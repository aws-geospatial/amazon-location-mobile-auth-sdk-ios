import Foundation

public class AmazonLocationClient {
    public let locationProvider: LocationCredentialsProvider
    
    public init(locationCredentialsProvider: LocationCredentialsProvider) {
        self.locationProvider = locationCredentialsProvider
    }
    
    public func sendRequest<T: Decodable, E: AmazonBaseErrorResponse & Error>(
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
                if requestData != nil {
                    let jsonString = String(data: requestData!, encoding: .utf8)
                    print(jsonString as Any)
                }
                request.httpBody = requestData
            } catch {
                print("Error: Unable to encode request body as JSON")
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
                if T.self == EmptyResponse.self {
                    return .success(EmptyResponse(statusCode: httpResponse.statusCode, description: httpResponse.description) as! T)
                    }
                    else {
                        let jsonString = String(data: data, encoding: .utf8)
                        print(jsonString as Any)
                        let decoder = JSONDecoder()
                        let successResponse = try decoder.decode(successType, from: data)
                        return .success(successResponse)
                    }
            } else {
                let decoder = JSONDecoder()
                let errorResponse = try decoder.decode(errorType, from: data)
                return .failure(errorResponse)
            }
        } catch {
            print("Error: \(error.localizedDescription)")
            throw error
        }
    }


    public func searchPosition(indexName: String, request: SearchByPositionRequest) async throws -> SearchByPositionResponse? {
        
        let result: Result<SearchByPositionResponse, AmazonErrorResponse> = try await sendRequest(
            serviceName: .Location,
            endpoint: SearchByPositionEndpoint(region: locationProvider.getRegion()!, indexName: indexName),
            httpMethod: .POST,
            requestBody: request,
            successType: SearchByPositionResponse.self,
            errorType: AmazonErrorResponse.self
        )
        
        switch result {
        case .success(let response):
            return response
        case .failure(let errorResponse):
            throw errorResponse
        }
    }
}
