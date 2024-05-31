import Foundation
import AWSLocation
import AWSClientRuntime

public class AmazonLocationClient {
    public let locationProvider: LocationCredentialsProvider
    public var locationClient: LocationClient?
    
    public init(locationCredentialsProvider: LocationCredentialsProvider) {
        self.locationProvider = locationCredentialsProvider
    }
    
    public func initialiseLocationClient() async throws {
        if let credentials = locationProvider.getCognitoProvider()?.getCognitoCredentials() {
            let resolver:AWSClientRuntime.StaticAWSCredentialIdentityResolver? =  try StaticAWSCredentialIdentityResolver(AWSCredentialIdentity(accessKey: credentials.accessKeyId, secret: credentials.secretKey, expiration: credentials.expiration, sessionToken: credentials.sessionToken))
            
            let clientConfig = try await LocationClient.LocationClientConfiguration(awsCredentialIdentityResolver: resolver, region: locationProvider.getRegion(), signingRegion: locationProvider.getRegion())
            self.locationClient = LocationClient(config: clientConfig)
        }
    }
    
    public func sendRequest<T: Decodable, E: AmazonBaseErrorResponse & Error>(
        serviceName: AmazonService,
        endpoint: AmazonLocationEndpoint,
        httpMethod: HTTPMethod,
        requestBody: EncodableRequest?,
        successType: T.Type,
        errorType: E.Type
    ) async throws -> AmazonLocationResponse<T, E> {
        let url = URL(string: endpoint.url())!
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod.rawValue
        
        // Encode request body if provided
        if let requestBody = requestBody {
            request.httpBody = try encodeRequestBody(requestBody)
        }
        
        // Set default headers
        var headers = HTTPHeaders()
        headers.add(name: "Content-Type", value: "application/json")
        
        // Sign headers with AWS credentials or throw error if not available
        if locationProvider.getCognitoProvider() != nil {
            signHeaders(&request, url: url, serviceName: serviceName, httpMethod: httpMethod, headers: headers, requestData: request.httpBody)
        } else if !endpoint.isApiKeyEndpoint() {
            throw LocationProviderError.noCognitoOrApiKeyFound
        }

        // Execute the request and handle the response
        return try await executeRequest(request, successType: successType, errorType: errorType)
    }

    private func encodeRequestBody(_ requestBody: EncodableRequest) throws -> Data {
        do {
            return try requestBody.toData()
        } catch {
            print("Error: Unable to encode request body as JSON")
            throw error
        }
    }

    private func signHeaders(_ request: inout URLRequest, url: URL, serviceName: AmazonService, httpMethod: HTTPMethod, headers: HTTPHeaders, requestData: Data?) {
        
        let cognitoCredentials = locationProvider.getCognitoProvider()!.getCognitoCredentials()
        let signer = AWSSigner(credentials: cognitoCredentials!, serviceName: serviceName.rawValue, region: locationProvider.getRegion()!)
        let signedHeaders = signer.signHeaders(url: url, method: httpMethod, headers: headers, body: requestData != nil ? .data(requestData!) : nil)
        
        for (name, value) in signedHeaders.allHeaders() {
            request.addValue(value, forHTTPHeaderField: name)
        }
    }

    private func executeRequest<T: Decodable, E: AmazonBaseErrorResponse & Error>(
        _ request: URLRequest,
        successType: T.Type,
        errorType: E.Type
    ) async throws -> AmazonLocationResponse<T, E> {
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            
            guard let httpResponse = response as? HTTPURLResponse else {
                throw URLError(.badServerResponse)
            }
            
            let status = ResponseStatus(statusCode: httpResponse.statusCode, description: HTTPURLResponse.localizedString(forStatusCode: httpResponse.statusCode))
            
            if (200...299).contains(httpResponse.statusCode) {
                let decoder = JSONDecoder()
                let successResponse = try decoder.decode(successType, from: data)
                return AmazonLocationResponse(status: status, data: successResponse, error: nil)
            } else {
                let decoder = JSONDecoder()
                let errorResponse = try decoder.decode(errorType, from: data)
                return AmazonLocationResponse(status: status, data: nil, error: errorResponse)
            }
        } catch {
            print("Error: \(error.localizedDescription)")
            throw error
        }
    }
    
    public func searchPosition(indexName: String, input: SearchPlaceIndexForPositionInput) async throws -> SearchPlaceIndexForPositionOutput? {
        do {
            if locationProvider.getCognitoProvider() != nil {
                if locationClient == nil {
                    try await initialiseLocationClient()
                }
                let response = try await locationClient!.searchPlaceIndexForPosition(input: input)
                return response
            }
            else if locationProvider.getApiProvider() != nil {
                let endpoint = SearchByPositionEndpoint(region: locationProvider.getRegion()!, indexName: indexName, apiKey: locationProvider.getApiProvider() != nil ? locationProvider.getAPIKey() : nil)
                let request = SearchByPositionRequest(language: input.language!, maxResults: input.maxResults!, position: input.position!)
                let response: AmazonLocationResponse<SearchByPositionResponse, AmazonErrorResponse> = try await sendRequest(
                           serviceName: .Location,
                           endpoint: endpoint,
                           httpMethod: .POST,
                           requestBody: request,
                           successType: SearchByPositionResponse.self,
                           errorType: AmazonErrorResponse.self
                       )
                       
                if let responseData = response.data {
                    return nil // TO DO: convert object to 
                }
                else if let responseError = response.error {
                    throw responseError
                }
            }
        }
        catch {
            throw error
        }
        return nil
    }
}
