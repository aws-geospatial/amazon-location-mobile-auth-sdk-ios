import Foundation
import AWSLocation
import AWSClientRuntime
import SmithyIdentityAPI

public enum HTTPMethod: String {
    case GET
    case POST
    case PUT
    case DELETE
}

public struct HTTPHeaders {
    private var headers: [String: String]

    public init() {
        headers = [:]
    }

    mutating func add(name: String, value: String) {
        headers[name] = value
    }

    mutating func remove(name: String) {
        headers.removeValue(forKey: name)
    }

    func value(forName name: String) -> String? {
        return headers[name]
    }

    func allHeaders() -> [String: String] {
        return headers
    }
}

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
    
    public func sendAPIRequest<T: Decodable, E: AmazonBaseErrorResponse & Error>(
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
        
        if !endpoint.isApiKeyEndpoint() {
            throw LocationProviderError.apiKeyNotFound
        }

        // Execute the request and handle the response
        return try await executeAPIRequest(request, successType: successType, errorType: errorType)
    }

    private func encodeRequestBody(_ requestBody: EncodableRequest) throws -> Data {
        do {
            return try requestBody.toData()
        } catch {
            Logger.shared.log("Error: Unable to encode request body as JSON")
            throw error
        }
    }

    private func executeAPIRequest<T: Decodable, E: AmazonBaseErrorResponse & Error>(
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
            Logger.shared.log("Error: \(error.localizedDescription)")
            throw error
        }
    }
}
