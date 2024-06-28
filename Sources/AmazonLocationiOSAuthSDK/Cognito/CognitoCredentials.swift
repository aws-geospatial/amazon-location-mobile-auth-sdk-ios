import Foundation

public struct AWSStaticCredentials: Codable {
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
    
    
    public static func encodeCognitoCredentials(credential: AWSStaticCredentials) -> String? {
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .iso8601
        do {
            let jsonData = try encoder.encode(credential)
            let jsonString = String(data: jsonData, encoding: .utf8)
            return jsonString
        } catch {
            Logger.shared.log("Error encoding CognitoCredential to JSON: \(error)")
            return nil
        }
    }

    public static func decodeCognitoCredentials(jsonString: String) -> AWSStaticCredentials? {
        guard let jsonData = jsonString.data(using: .utf8) else {
            Logger.shared.log("Invalid JSON string")
            return nil
        }
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        do {
            let credential = try decoder.decode(AWSStaticCredentials.self, from: jsonData)
            return credential
        } catch {
            Logger.shared.log("Error decoding JSON to CognitoCredential: \(error)")
            return nil
        }
    }
}
