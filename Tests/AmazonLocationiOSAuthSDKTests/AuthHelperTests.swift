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
        XCTAssertNotNil(authProvider.getAPIProvider())
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
                authHelper.signOut { error in
                    expectation.fulfill()
                }
            }
        }
        
        waitForExpectations(timeout: 120, handler: nil)
    }
    
    func testAWSEndpoint() {
        let config = readTestConfig()
        
        let identityPoolID = config["identityPoolID"]!
        
        XCTAssertEqual(AWSEndpoint.regionTypeByString(regionString: "us-east-1"), .USEast1)
        XCTAssertEqual(AWSEndpoint.regionTypeByString(regionString: "us-east-2"), .USEast2)
        XCTAssertEqual(AWSEndpoint.regionTypeByString(regionString: "us-west-2"), .USWest2)
        XCTAssertEqual(AWSEndpoint.regionTypeByString(regionString: "us-west-1"), .USWest1)
        XCTAssertEqual(AWSEndpoint.regionTypeByString(regionString: "eu-west-1"), .EUWest1)
        XCTAssertEqual(AWSEndpoint.regionTypeByString(regionString: "eu-west-2"), .EUWest2)
        XCTAssertEqual(AWSEndpoint.regionTypeByString(regionString: "eu-west-3"), .EUWest3)
        XCTAssertEqual(AWSEndpoint.regionTypeByString(regionString: "eu-central-1"), .EUCentral1)
        XCTAssertEqual(AWSEndpoint.regionTypeByString(regionString: "eu-north-1"), .EUNorth1)
        XCTAssertEqual(AWSEndpoint.regionTypeByString(regionString: "ap-east-1"), .APEast1)
        XCTAssertEqual(AWSEndpoint.regionTypeByString(regionString: "ap-southeast-1"), .APSoutheast1)
        XCTAssertEqual(AWSEndpoint.regionTypeByString(regionString:  "ap-northeast-1"), .APNortheast1)
        XCTAssertEqual(AWSEndpoint.regionTypeByString(regionString: "ap-northeast-2"), .APNortheast2)
        XCTAssertEqual(AWSEndpoint.regionTypeByString(regionString: "ap-southeast-2"), .APSoutheast2)
        XCTAssertEqual(AWSEndpoint.regionTypeByString(regionString: "ap-south-1"), .APSouth1)
        XCTAssertEqual(AWSEndpoint.regionTypeByString(regionString: "sa-east-1"), .SAEast1)
        XCTAssertEqual(AWSEndpoint.regionTypeByString(regionString: "cn-north-1"), .CNNorth1)
        XCTAssertEqual(AWSEndpoint.regionTypeByString(regionString: "cn-northwest-1"), .CNNorthWest1)
        XCTAssertEqual(AWSEndpoint.regionTypeByString(regionString: "ca-central-1"), .CACentral1)
        XCTAssertEqual(AWSEndpoint.regionTypeByString(regionString: "us-gov-west-1"), .USGovWest1)
        XCTAssertEqual(AWSEndpoint.regionTypeByString(regionString: "us-gov-east-1"), .USGovEast1)
        XCTAssertEqual(AWSEndpoint.regionTypeByString(regionString: "me-south-1"), .MESouth1)
        XCTAssertEqual(AWSEndpoint.regionTypeByString(regionString: "af-south-1"), .AFSouth1)
        XCTAssertEqual(AWSEndpoint.regionTypeByString(regionString: "eu-south-1"), .EUSouth1)
        
        XCTAssertEqual(AWSEndpoint.toRegionType(identityPoolId: identityPoolID), .USEast1)
        XCTAssertEqual(AWSEndpoint.toRegionString(identityPoolId: identityPoolID), "us-east-1")
    }
    
    func testReadPlist() {
        guard let plistURL = Bundle.module.url(forResource: "TestConfig", withExtension: "plist"),
              let plistData = try? Data(contentsOf: plistURL) else {
            XCTFail("Failed to read plist file")
            return
        }
        
        do {
            if let plistDict = try PropertyListSerialization.propertyList(from: plistData, options: [], format: nil) as? [String: Any] {
                print(plistData)
                // Now you can use plistDict as a normal dictionary
                if let identityPoolID = plistDict["identityPoolID"] as? String {
                    // Use your config value here
                    print(identityPoolID)
                }
            }
        } catch {
            XCTFail("Error reading plist: \(error)")
        }
    }
}
