import XCTest
@testable import AmazonLocationiOSAuthSDK
import AWSCore
import AWSMobileClientXCF

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
    
    func testAuthWithUserPoolID() throws {
        let expectation = self.expectation(description: "Authentication completes")
        let identityPoolID = "us-east-1:d9a96645-afa9-4ad2-b780-cac8be20aeeb"
        let userPoolID = "us-east-1_bW9PR3CUP"
        let clientId = "2s07mamf60ft2brf63csg9h9or"
        let clientSecret: String? = nil
        let username = "zesheikh2"
        let password = "Ran&a123(xa1&12z"
        let newPassword = "Ran&a123(xa1&12z"
        
        let authHelper = AuthHelper()
        authHelper.setNewPassword(newPassword)
        
        _ = authHelper.authenticateWithCognitoUserPool(identityPoolId: identityPoolID, userPoolId: userPoolID, clientId: clientId, clientSecret: clientSecret)
        
        authHelper.signIn(username: username, password: password) { result, error in

            if let error = error as NSError? {
                print("adas")
                if let code = AWSCognitoIdentityProviderErrorType(rawValue: error.code) {
                    switch code {
                    case .passwordResetRequired:
                        // Handle password reset required
                        print("Password reset required")
                        authHelper.confirmSignin(newPassword: newPassword) { result, error in
                            if let error = error as NSError? {
                                print("change password error: \(error)")
                            }
                            else {
                                print("Successful authentication \(String(describing: result?.signInState))")
                                expectation.fulfill()
                            }
                        }
                    default:
                        print("Authentication error: \(error.localizedDescription)")
                    }
                }
            } else {
                // Successful authentication
                print("Successful authentication \(String(describing: result?.signInState))")
                expectation.fulfill()
            }
        }
        
        waitForExpectations(timeout: 120, handler: nil)
    }
}
