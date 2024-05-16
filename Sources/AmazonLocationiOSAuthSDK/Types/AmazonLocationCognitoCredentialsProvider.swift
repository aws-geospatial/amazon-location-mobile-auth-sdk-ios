import Foundation

public class AmazonLocationCognitoCredentialsProvider {
    internal var identityPoolId: String?
    internal var region: String?
    private var cognitoCredentials: CognitoCredentials?
    
    public init(identityPoolId: String, region: String?) {
        self.identityPoolId = identityPoolId
        self.region = region
    }
    
    internal func getCognitoCredentials() -> CognitoCredentials? {
        if let cognitoCredentialsString = KeyChainHelper.get(key: .CognitoCredentials), let cognitoCredentials = CognitoCredentials.decodeCognitoCredentials(jsonString: cognitoCredentialsString) {
            self.cognitoCredentials = cognitoCredentials
        }
        return cognitoCredentials
    }
    
    public func refreshCognitoCredentialsIfExpired() async throws {
        if let savedCredentials = getCognitoCredentials(), savedCredentials.expiryDate! > Date() {
            cognitoCredentials = savedCredentials
        } else {
            try? await refreshCognitoCredentials()
        }
    }
    
    public func refreshCognitoCredentials() async throws {
        if let identityPoolId = self.identityPoolId, let region = self.region {
           let cognitoCredentials = try await generateCognitoCredentials(identityPoolId: identityPoolId, region: region)
           setCognitoCredentials(cognitoCredentials: cognitoCredentials)
        }
    }
    
    private func setCognitoCredentials(cognitoCredentials: CognitoCredentials) {
        self.cognitoCredentials = cognitoCredentials
        KeyChainHelper.save(value: CognitoCredentials.encodeCognitoCredentials(credential: cognitoCredentials)!, key: .CognitoCredentials)
    }
    
    private func generateCognitoCredentials(identityPoolId: String, region: String) async throws -> CognitoCredentials {
        guard let identityId = try await CognitoCredentialsProvider.getAWSIdentityId(identityPoolId: identityPoolId, region: region) else {
            throw CognitoError.identityIdNotFound
        }
        
        guard let response = try await CognitoCredentialsProvider.getAWSCredentials(identityId: identityId, region: region),
              let credentials = response["Credentials"] as? [String:Any],
              let accessKeyId = credentials["AccessKeyId"] as? String,
              let secretAccessKey = credentials["SecretKey"] as? String,
              let sessionToken = credentials["SessionToken"] as? String,
              let expirationInterval = credentials["Expiration"] as? NSNumber
        else {
            throw CognitoError.credentialsNotFound
        }
        
        let expiryDate = Date(timeIntervalSince1970: TimeInterval(truncating: expirationInterval))
        return CognitoCredentials(identityPoolId: identityPoolId, accessKeyId: accessKeyId, secretAccessKey: secretAccessKey, sessionToken: sessionToken, expiryDate: expiryDate)
    }
}

enum CognitoError: Error {
    case identityIdNotFound
    case credentialsNotFound
}
