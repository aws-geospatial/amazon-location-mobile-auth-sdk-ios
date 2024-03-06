import XCTest
@testable import AmazonLocationiOSAuthSDK
import AWSCore
import AWSMobileClientXCF

final class AuthHelperTests: XCTestCase {
    
    func readTestConfig() -> [String: String] {
        // Implement reading from your chosen config file. This is an example for a plist.
        guard let plistURL = Bundle.module.url(forResource: "TestConfig", withExtension: "plist"),
              let plistData = try? Data(contentsOf: plistURL) else {
            fatalError("Test configuration file not found.")
        }
        do {
            if let plistDict = try PropertyListSerialization.propertyList(from: plistData, options: [], format: nil) as? [String: String] {
                return plistDict
            }
        } catch {
            XCTFail("Error reading plist: \(error)")
        }
        return [:]
    }
    
    func testAuthWithIdentityPoolID() throws {
        let config = readTestConfig()
        
        let identityPoolID = config["identityPoolID"]!
        let authHelper = AuthHelper()
        let authProvider = authHelper.authenticateWithCognitoUserPool(identityPoolId: identityPoolID)
        XCTAssertEqual(authProvider.getIdentityPoolId(), identityPoolID)
    }
    
    func testAuthWithIdentityPoolIDAndRegion() throws {
        let config = readTestConfig()
        
        let identityPoolID = config["identityPoolID"]!
        let region = config["region"]!
        let authHelper = AuthHelper()
        let authProvider = authHelper.authenticateWithCognitoUserPool(identityPoolId: identityPoolID, region: region)
        XCTAssertEqual(authProvider.getIdentityPoolId(), identityPoolID)
    }
    
    func testAuthWithAPIKey() throws {
        let config = readTestConfig()
        
        let apiKey = config["apiKey"]!
        let region = config["region"]!

        let authHelper = AuthHelper()
        let authProvider = authHelper.authenticateWithAPIKey(apiKey: apiKey, region: region)
        XCTAssertEqual(authProvider.getAPIKey(), apiKey)
    }
    
    func testSigninWithUserPoolID() throws {
        let config = readTestConfig()
        
        let identityPoolID = config["identityPoolID"]!
        let userPoolID = config["userPoolID"]!
        let clientId = config["clientId"]!
        let clientSecret: String? = nil
        let username = config["username"]!
        let password = config["password"]!
        let newPassword = config["newPassword"]!
        
        let expectation = self.expectation(description: "Authentication completes")
        
        let authHelper = AuthHelper()
        
        _ = authHelper.authenticateWithCognitoUserPool(identityPoolId: identityPoolID, userPoolId: userPoolID, clientId: clientId, clientSecret: clientSecret)
        
        authHelper.signIn(username: username, password: password) { result, error in
            
            if let error = error as NSError? {
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
    
//    func testReadPlist() {
//        guard let plistURL = Bundle.module.url(forResource: "TestConfig", withExtension: "plist"),
//              let plistData = try? Data(contentsOf: plistURL) else {
//            XCTFail("Failed to read plist file")
//            return
//        }
//        
//        do {
//            if let plistDict = try PropertyListSerialization.propertyList(from: plistData, options: [], format: nil) as? [String: Any] {
//                print(plistData)
//                // Now you can use plistDict as a normal dictionary
//                if let identityPoolID = plistDict["identityPoolID"] as? String {
//                    // Use your config value here
//                    print(identityPoolID)
//                }
//            }
//        } catch {
//            XCTFail("Error reading plist: \(error)")
//        }
//    }
}
