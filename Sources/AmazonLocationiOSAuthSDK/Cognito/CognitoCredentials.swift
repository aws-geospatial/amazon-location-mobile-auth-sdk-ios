import Foundation

public struct CognitoCredentials: Codable {
    public let identityPoolId: String
    public let accessKeyId: String
    public let secretKey: String
    public let sessionToken: String?
    public let expiration: Date?

    public init(identityPoolId: String, accessKeyId: String, secretKey: String, sessionToken: String? = nil, expiration: Date? = nil) {
        self.identityPoolId = identityPoolId
        self.accessKeyId = accessKeyId
        self.secretKey = secretKey
        self.sessionToken = sessionToken
        self.expiration = expiration
    }
    
    
    public static func encodeCognitoCredentials(credential: CognitoCredentials) -> String? {
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .iso8601
        do {
            let jsonData = try encoder.encode(credential)
            let jsonString = String(data: jsonData, encoding: .utf8)
            return jsonString
        } catch {
            print("Error encoding CognitoCredential to JSON: \(error)")
            return nil
        }
    }

    public static func decodeCognitoCredentials(jsonString: String) -> CognitoCredentials? {
        guard let jsonData = jsonString.data(using: .utf8) else {
            print("Invalid JSON string")
            return nil
        }
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        do {
            let credential = try decoder.decode(CognitoCredentials.self, from: jsonData)
            return credential
        } catch {
            print("Error decoding JSON to CognitoCredential: \(error)")
            return nil
        }
    }
}
