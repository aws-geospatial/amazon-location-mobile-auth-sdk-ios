import Foundation

public class AmazonLocationClient {
    private let locationProvider: LocationCredentialsProvider
    
    public init(locationCredentialsProvider: LocationCredentialsProvider) {
        self.locationProvider = locationCredentialsProvider
    }
    
    private func sendRequest(serviceName: AmazonService, endpoint: AmazonLocationEndpoint, httpMethod: HTTPMethod, requestBody: EncodableRequest?) async throws -> Data? {
        let url = URL(string: endpoint.url())!
        
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod.rawValue
        var requestData: Data? = nil
        
        if let requestBody = requestBody {
            do {
                requestData = try requestBody.toData()
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
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                return nil
            }
            return data
        } catch {
            print("Error: \(error.localizedDescription)")
            throw error
        }
    }

    
    public func searchPosition(indexName: String, request: SearchByPositionRequest) async throws -> SearchByPositionResponse? {
        
        let responseData = try await sendRequest(serviceName: .Location, endpoint: .locationSearch(region: locationProvider.getRegion()!, indexName: indexName), httpMethod: .POST, requestBody: request)

        if responseData != nil {
            do {
                let response = try SearchByPositionResponse.from(data: responseData!)
                return response
            }
            catch {
                print(error)
                return nil
            }
        }
        
        return nil
    }
}
