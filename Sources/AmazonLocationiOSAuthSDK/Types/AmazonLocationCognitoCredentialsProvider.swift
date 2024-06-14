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
        if self.cognitoCredentials != nil && self.cognitoCredentials!.expiration! > Date() {
            return self.cognitoCredentials
        }
        else if let cognitoCredentialsString = KeyChainHelper.get(key: .CognitoCredentials), let cognitoCredentials = CognitoCredentials.decodeCognitoCredentials(jsonString: cognitoCredentialsString) {
            self.cognitoCredentials = cognitoCredentials
            return self.cognitoCredentials
        }
        return self.cognitoCredentials
    }
    
    public func refreshCognitoCredentialsIfExpired() async throws {
        if let savedCredentials = getCognitoCredentials(), savedCredentials.expiration! > Date() {
            cognitoCredentials = savedCredentials
        } else {
            try? await refreshCognitoCredentials()
        }
    }
    
    public func refreshCognitoCredentials() async throws {
        if let identityPoolId = self.identityPoolId, let region = self.region, let cognitoCredentials = try await CognitoCredentialsProvider.generateCognitoCredentials(identityPoolId: identityPoolId, region: region) {
           setCognitoCredentials(cognitoCredentials: cognitoCredentials)
        }
    }
    
    private func setCognitoCredentials(cognitoCredentials: CognitoCredentials) {
        self.cognitoCredentials = cognitoCredentials
        KeyChainHelper.save(value: CognitoCredentials.encodeCognitoCredentials(credential: cognitoCredentials)!, key: .CognitoCredentials)
    }
}
