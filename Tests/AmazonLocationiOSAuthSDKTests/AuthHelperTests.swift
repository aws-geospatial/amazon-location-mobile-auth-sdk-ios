import XCTest
@testable import AmazonLocationiOSAuthSDK

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
        let authProvider = authHelper.authenticateWithCognitoIdentityPool(identityPoolId: identityPoolID)
        XCTAssertEqual(authProvider.getIdentityPoolId(), identityPoolID)
    }
    
    func testAuthWithIdentityPoolIDAndRegion() throws {
        let config = readTestConfig()
        
        let identityPoolID = config["identityPoolID"]!
        let region = config["region"]!
        let authHelper = AuthHelper()
        let authProvider = authHelper.authenticateWithCognitoIdentityPool(identityPoolId: identityPoolID, region: region)
        XCTAssertEqual(authProvider.getIdentityPoolId(), identityPoolID)
    }
    
    func testAuthWithAPIKey() throws {
        let config = readTestConfig()
        
        let apiKey = config["apiKey"]!
        let region = config["region"]!

        let authHelper = AuthHelper()
        let authProvider = authHelper.authenticateWithApiKey(apiKey: apiKey, region: region)
        XCTAssertNotNil(authProvider.getApiProvider())
    }
    
    func testAWSEndpoint() {
        let config = readTestConfig()
        
        let identityPoolID = config["identityPoolID"]!
        
        XCTAssertEqual(AmazonLocationEndpoint.regionTypeByString(regionString: "us-east-1"), .USEast1)
        XCTAssertEqual(AmazonLocationEndpoint.regionTypeByString(regionString: "us-east-2"), .USEast2)
        XCTAssertEqual(AmazonLocationEndpoint.regionTypeByString(regionString: "us-west-2"), .USWest2)
        XCTAssertEqual(AmazonLocationEndpoint.regionTypeByString(regionString: "us-west-1"), .USWest1)
        XCTAssertEqual(AmazonLocationEndpoint.regionTypeByString(regionString: "eu-west-1"), .EUWest1)
        XCTAssertEqual(AmazonLocationEndpoint.regionTypeByString(regionString: "eu-west-2"), .EUWest2)
        XCTAssertEqual(AmazonLocationEndpoint.regionTypeByString(regionString: "eu-west-3"), .EUWest3)
        XCTAssertEqual(AmazonLocationEndpoint.regionTypeByString(regionString: "eu-central-1"), .EUCentral1)
        XCTAssertEqual(AmazonLocationEndpoint.regionTypeByString(regionString: "eu-north-1"), .EUNorth1)
        XCTAssertEqual(AmazonLocationEndpoint.regionTypeByString(regionString: "ap-east-1"), .APEast1)
        XCTAssertEqual(AmazonLocationEndpoint.regionTypeByString(regionString: "ap-southeast-1"), .APSoutheast1)
        XCTAssertEqual(AmazonLocationEndpoint.regionTypeByString(regionString:  "ap-northeast-1"), .APNortheast1)
        XCTAssertEqual(AmazonLocationEndpoint.regionTypeByString(regionString: "ap-northeast-2"), .APNortheast2)
        XCTAssertEqual(AmazonLocationEndpoint.regionTypeByString(regionString: "ap-southeast-2"), .APSoutheast2)
        XCTAssertEqual(AmazonLocationEndpoint.regionTypeByString(regionString: "ap-south-1"), .APSouth1)
        XCTAssertEqual(AmazonLocationEndpoint.regionTypeByString(regionString: "sa-east-1"), .SAEast1)
        XCTAssertEqual(AmazonLocationEndpoint.regionTypeByString(regionString: "cn-north-1"), .CNNorth1)
        XCTAssertEqual(AmazonLocationEndpoint.regionTypeByString(regionString: "cn-northwest-1"), .CNNorthWest1)
        XCTAssertEqual(AmazonLocationEndpoint.regionTypeByString(regionString: "ca-central-1"), .CACentral1)
        XCTAssertEqual(AmazonLocationEndpoint.regionTypeByString(regionString: "us-gov-west-1"), .USGovWest1)
        XCTAssertEqual(AmazonLocationEndpoint.regionTypeByString(regionString: "us-gov-east-1"), .USGovEast1)
        XCTAssertEqual(AmazonLocationEndpoint.regionTypeByString(regionString: "me-south-1"), .MESouth1)
        XCTAssertEqual(AmazonLocationEndpoint.regionTypeByString(regionString: "af-south-1"), .AFSouth1)
        XCTAssertEqual(AmazonLocationEndpoint.regionTypeByString(regionString: "eu-south-1"), .EUSouth1)
        
        XCTAssertEqual(AmazonLocationEndpoint.toRegionType(identityPoolId: identityPoolID), .USEast1)
        XCTAssertEqual(AmazonLocationEndpoint.toRegionString(identityPoolId: identityPoolID), "us-east-1")
    }
    
    func testCognitoCredentialsProvider() {
        let config = readTestConfig()
        
        let identityPoolId = config["identityPoolID"]!
        let region = config["region"]!
        
        let expectation = self.expectation(description: "Wait for getCredentials response")
                
        CognitoCredentialsProvider.getAWSIdentityId(identityPoolId: identityPoolId, region: region) { (identityId) in
            guard let identityId = identityId else {
                XCTFail("Failed to get AWS identity ID")
                expectation.fulfill()
                return
            }
            
            CognitoCredentialsProvider.getAWSCredentials(identityId: identityId, region: region) { (response) in
                XCTAssertNotNil(response, "Response should not be nil")
                expectation.fulfill()
            }
        }
        
        waitForExpectations(timeout: 10) { (error) in
            if let error = error {
                XCTFail("Timeout waiting for getCredentials: \(error)")
            }
        }
    }
}
