import Foundation

public class AmazonLocationClient {
    private let locationProvider: LocationCredentialsProvider
    
    public init(locationCredentialsProvider: LocationCredentialsProvider) {
        self.locationProvider = locationCredentialsProvider
    }
    
    internal func sendRequest<T: Decodable, E: AmazonErrorResponse>(
        serviceName: AmazonService,
        endpoint: AmazonLocationEndpoint,
        httpMethod: HTTPMethod,
        requestBody: EncodableRequest?,
        successType: T.Type,
        errorType: E.Type
    ) async throws -> Result<T, E> {
        let url = URL(string: endpoint.url())!
        
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod.rawValue
        var requestData: Data? = nil
        
        if let requestBody = requestBody {
            do {
                requestData = try requestBody.toData()
                request.httpBody = requestData
            } catch {
                throw error
            }
        }
        
        var headers = HTTPHeaders()
        headers.add(name: "Content-Type", value: "application/json")
        
        let cognitoCredentials = locationProvider.getCognitoProvider()?.getCognitoCredentials()
        let signer = AWSSigner(credentials: cognitoCredentials!, serviceName: serviceName.rawValue, region: locationProvider.getRegion()!)
        let signedHeaders = signer.signHeaders(url: url, method: httpMethod, headers: headers, body: requestData != nil ? .data(requestData!) : nil)
        
        for (name, value) in signedHeaders.allHeaders() {
            request.addValue(value, forHTTPHeaderField: name)
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            
            guard let httpResponse = response as? HTTPURLResponse else {
                throw URLError(.badServerResponse)
            }
            
            if (200...299).contains(httpResponse.statusCode) {
                let decoder = JSONDecoder()
                let successResponse = try decoder.decode(successType, from: data)
                return .success(successResponse)
            } else {
                let decoder = JSONDecoder()
                let errorResponse = try decoder.decode(errorType, from: data)
                return .failure(errorResponse)
            }
        } catch {
            throw error
        }
    }

    public func searchPosition(indexName: String, request: SearchByPositionRequest) async throws -> SearchByPositionResponse? {
        
        let result: Result<SearchByPositionResponse, SearchByPositionErrorsResponse> = try await sendRequest(
            serviceName: .Location,
            endpoint: SearchByPositionEndpoint(region: locationProvider.getRegion()!, indexName: indexName),
            httpMethod: .POST,
            requestBody: request,
            successType: SearchByPositionResponse.self,
            errorType: SearchByPositionErrorsResponse.self
        )
        
        switch result {
        case .success(let response):
            return response
        case .failure(let errorResponse):
            throw errorResponse
        }
    }
}
