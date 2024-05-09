import Foundation

public class AmazonLocationCognitoCredentialsProvider {
    internal var identityPoolId: String?
    internal var region: String?
    
    public init(identityPoolId: String, region: String?) {
        self.identityPoolId = identityPoolId
        self.region = region
    }
}
