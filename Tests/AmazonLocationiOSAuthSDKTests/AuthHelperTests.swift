import XCTest
@testable import AmazonLocationiOSAuthSDK

final class AuthHelperTests: XCTestCase {
    
    func testAuthWithIdentityPoolID() throws {
        let identityPoolID = "us-east-1:d9a96645-afa9-4ad2-b780-cac8be20aeeb"
        let authHelper = AuthHelper()
        let authProvider = authHelper.authenticateWithCognitoUserPool(identityPoolId: identityPoolID)
        XCTAssertEqual(authProvider.getIdentityPoolId(), identityPoolID)
    }
    
    func testAuthWithAPIKey() throws {
        let apiKey = "DummyAPIKey"
        let region = "us-east-1"
        let authHelper = AuthHelper()
        let authProvider = authHelper.authenticateWithAPIKey(apiKey: apiKey, region: region)
        XCTAssertEqual(authProvider.getAPIKey(), apiKey)
    }
}
