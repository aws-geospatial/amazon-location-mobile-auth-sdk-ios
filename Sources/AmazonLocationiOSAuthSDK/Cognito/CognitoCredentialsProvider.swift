import Foundation

internal class CognitoCredentialsProvider {
    
    static func getAWSIdentityId(identityPoolId: String, region: String) async throws -> String? {
        let url = "https://cognito-identity.\(region).amazonaws.com/"
        let requestBody = "{\"IdentityPoolId\": \"\(identityPoolId)\"}"
        let mediaType = "application/x-amz-json-1.1"
        
        guard let requestUrl = URL(string: url) else {
            print("Error: Invalid URL")
            return nil
        }
        
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "POST"
        request.addValue("application/x-amz-json-1.1", forHTTPHeaderField: "Content-Type")
        request.addValue(mediaType, forHTTPHeaderField: "Accept")
        request.addValue("AWSCognitoIdentityService.GetId", forHTTPHeaderField: "X-Amz-Target")
        request.httpBody = requestBody.data(using: .utf8)
        
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            guard let jsonResponse = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                  let identityId = jsonResponse["IdentityId"] as? String
            else {
                return nil
            }
            return identityId
        } catch {
            throw error
        }
    }
    
    static func getAWSCredentials(identityId: String, region: String) async throws -> [String: Any]? {
        let url = "https://cognito-identity.\(region).amazonaws.com/"
        let requestBody = "{\"IdentityId\": \"\(identityId)\"}"
        let mediaType = "application/x-amz-json-1.1"
        
        guard let requestUrl = URL(string: url) else {
            print("Error: Invalid URL")
            return nil
        }
        
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "POST"
        request.addValue("application/x-amz-json-1.1", forHTTPHeaderField: "Content-Type")
        request.addValue(mediaType, forHTTPHeaderField: "Accept")
        request.addValue("AWSCognitoIdentityService.GetCredentialsForIdentity", forHTTPHeaderField: "X-Amz-Target")
        request.httpBody = requestBody.data(using: .utf8)
        
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
        } catch {
            throw error
        }
    }
}
