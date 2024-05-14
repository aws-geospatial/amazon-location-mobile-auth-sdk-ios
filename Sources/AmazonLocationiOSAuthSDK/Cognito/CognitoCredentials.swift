import Foundation

public struct CognitoCredentials: Codable {
    public let identityPoolId: String
    public let accessKeyId: String
    public let secretAccessKey: String
    public let sessionToken: String?
    public let expiryDate: Date?

    public init(identityPoolId: String, accessKeyId: String, secretAccessKey: String, sessionToken: String? = nil, expiryDate: Date? = nil) {
        self.identityPoolId = identityPoolId
        self.accessKeyId = accessKeyId
        self.secretAccessKey = secretAccessKey
        self.sessionToken = sessionToken
        self.expiryDate = expiryDate
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
