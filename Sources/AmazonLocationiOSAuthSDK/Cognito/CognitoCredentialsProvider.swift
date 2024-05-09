import Foundation

internal class CognitoCredentialsProvider {
    
    static func getAWSIdentityId(identityPoolId: String, region: String, completion: @escaping (String?) -> Void) {
        let url = "https://cognito-identity.\(region).amazonaws.com/"
        let requestBody = "{\"IdentityPoolId\": \"\(identityPoolId)\"}"
        let mediaType = "application/x-amz-json-1.1"
        
        guard let requestUrl = URL(string: url) else {
            print("Error: Invalid URL")
            completion(nil)
            return
        }
        
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "POST"
        request.addValue("application/x-amz-json-1.1", forHTTPHeaderField: "Content-Type")
        request.addValue(mediaType, forHTTPHeaderField: "Accept")
        request.addValue("AWSCognitoIdentityService.GetId", forHTTPHeaderField: "X-Amz-Target")
        request.httpBody = requestBody.data(using: .utf8)
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                completion(nil)
                return
            }
            
            guard let data = data else {
                print("Error: No data received")
                completion(nil)
                return
            }
            
            do {
                if let jsonResponse = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                    if let identityId = jsonResponse["IdentityId"] as? String {
                        completion(identityId)
                    } else {
                        completion(nil)
                    }
                } else {
                    completion(nil)
                }
            } catch {
                print("Error parsing JSON: \(error.localizedDescription)")
                completion(nil)
            }
        }
        
        task.resume()
    }
    
    static func getAWSCredentials(identityId: String, region: String, completion: @escaping ([String: Any]?) -> Void) {
        let url = "https://cognito-identity.\(region).amazonaws.com/"
        let requestBody = "{\"IdentityId\": \"\(identityId)\"}"
        let mediaType = "application/x-amz-json-1.1"
        
        guard let requestUrl = URL(string: url) else {
            print("Error: Invalid URL")
            completion(nil)
            return
        }
        
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "POST"
        request.addValue("application/x-amz-json-1.1", forHTTPHeaderField: "Content-Type")
        request.addValue(mediaType, forHTTPHeaderField: "Accept")
        request.addValue("AWSCognitoIdentityService.GetCredentialsForIdentity", forHTTPHeaderField: "X-Amz-Target")
        request.httpBody = requestBody.data(using: .utf8)
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                completion(nil)
                return
            }
            
            guard let data = data else {
                print("Error: No data received")
                completion(nil)
                return
            }
            
            do {
                if let jsonResponse = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                    completion(jsonResponse)
                } else {
                    completion(nil)
                }
            } catch {
                print("Error parsing JSON: \(error.localizedDescription)")
                completion(nil)
            }
        }
        
        task.resume()
    }
}
