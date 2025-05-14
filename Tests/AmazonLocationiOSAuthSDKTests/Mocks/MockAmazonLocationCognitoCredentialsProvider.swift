import Foundation
@testable import AmazonLocationiOSAuthSDK

class MockAmazonLocationCognitoCredentialsProvider: AmazonLocationCognitoCredentialsProviderProtocol {
    internal var identityPoolId: String?
    internal var region: String?
    private var cognitoCredentials: CognitoCredentials?
    
    init(identityPoolId: String, region: String?) {
        self.identityPoolId = identityPoolId
        self.region = region
    }
    
    func getCognitoCredentials() -> CognitoCredentials? {
        return CognitoCredentials(identityPoolId: "mockIdentityPoolId", accessKeyId: "mockAccessKeyId", secretKey: "mockSecretKey", sessionToken: "mockSessionToken", expiration: Date())
    }
    
    // Do nothing, sleep for 100ms
    func refreshCognitoCredentials() async throws {
        try await Task.sleep(for: .milliseconds(100))
    }
}
