import XCTest
@testable import AmazonLocationiOSAuthSDK

final class AuthHelperTests: XCTestCase {
    
    func testAuthWithIdentityPoolID() throws {
        let identityPoolID = "<Enter you Identity pool ID here>"
        let authHelper = AuthHelper()
        let authProvider = authHelper.authenticateWithCognitoUserPool(identityPoolId: identityPoolID)
        XCTAssertEqual(authProvider.getIdentityPoolId(), identityPoolID)
    }
    
    func testAuthWithAPIKey() throws {
        let apiKey = "<Enter you API Key here>"
        let region = "<Enter you region here>"
        let authHelper = AuthHelper()
        let authProvider = authHelper.authenticateWithAPIKey(apiKey: apiKey, region: region)
        XCTAssertEqual(authProvider.getAPIKey(), apiKey)
    }
}
