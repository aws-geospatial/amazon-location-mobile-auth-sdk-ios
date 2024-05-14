public class AmazonLocationCognitoCredentialsProvider {
    internal var identityPoolId: String?
    internal var region: String?
    internal var cognitoCredentials: CognitoCredentials?
    
    public init(identityPoolId: String, region: String?) {
        self.identityPoolId = identityPoolId
        self.region = region
    }
    
    internal func getCognitoCredentials() -> CognitoCredentials? {
        return cognitoCredentials
    }
    
    internal func setCognitoCredentials(cognitoCredentials: CognitoCredentials) {
        self.cognitoCredentials = cognitoCredentials
        KeyChainHelper.save(value: CognitoCredentials.encodeCognitoCredentials(credential: cognitoCredentials)!, key: .CognitoCrdentials)
    }
}
