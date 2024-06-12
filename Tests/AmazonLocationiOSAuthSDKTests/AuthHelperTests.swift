import XCTest

@testable import AmazonLocationiOSAuthSDK
import AWSLocation

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
    
    func testAuthWithIdentityPoolID() async throws {
        let config = readTestConfig()
        
        let identityPoolID = config["identityPoolID"]!
        let authHelper = AuthHelper()
        let authProvider = try? await authHelper.authenticateWithCognitoIdentityPool(identityPoolId: identityPoolID)
        XCTAssertEqual(authProvider!.getIdentityPoolId(), identityPoolID)
    }
    
    func testAuthWithIdentityPoolIDAndRegion() async throws {
        let config = readTestConfig()
        
        let identityPoolID = config["identityPoolID"]!
        let region = config["region"]!
        let authHelper = AuthHelper()
        let authProvider = try? await authHelper.authenticateWithCognitoIdentityPool(identityPoolId: identityPoolID, region: region)
        XCTAssertEqual(authProvider!.getIdentityPoolId(), identityPoolID)
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
        
        XCTAssertEqual(AmazonLocationRegion.regionTypeByString(regionString: "us-east-1"), .USEast1)
        XCTAssertEqual(AmazonLocationRegion.regionTypeByString(regionString: "us-east-2"), .USEast2)
        XCTAssertEqual(AmazonLocationRegion.regionTypeByString(regionString: "us-west-2"), .USWest2)
        XCTAssertEqual(AmazonLocationRegion.regionTypeByString(regionString: "us-west-1"), .USWest1)
        XCTAssertEqual(AmazonLocationRegion.regionTypeByString(regionString: "eu-west-1"), .EUWest1)
        XCTAssertEqual(AmazonLocationRegion.regionTypeByString(regionString: "eu-west-2"), .EUWest2)
        XCTAssertEqual(AmazonLocationRegion.regionTypeByString(regionString: "eu-west-3"), .EUWest3)
        XCTAssertEqual(AmazonLocationRegion.regionTypeByString(regionString: "eu-central-1"), .EUCentral1)
        XCTAssertEqual(AmazonLocationRegion.regionTypeByString(regionString: "eu-north-1"), .EUNorth1)
        XCTAssertEqual(AmazonLocationRegion.regionTypeByString(regionString: "ap-east-1"), .APEast1)
        XCTAssertEqual(AmazonLocationRegion.regionTypeByString(regionString: "ap-southeast-1"), .APSoutheast1)
        XCTAssertEqual(AmazonLocationRegion.regionTypeByString(regionString:  "ap-northeast-1"), .APNortheast1)
        XCTAssertEqual(AmazonLocationRegion.regionTypeByString(regionString: "ap-northeast-2"), .APNortheast2)
        XCTAssertEqual(AmazonLocationRegion.regionTypeByString(regionString: "ap-southeast-2"), .APSoutheast2)
        XCTAssertEqual(AmazonLocationRegion.regionTypeByString(regionString: "ap-south-1"), .APSouth1)
        XCTAssertEqual(AmazonLocationRegion.regionTypeByString(regionString: "sa-east-1"), .SAEast1)
        XCTAssertEqual(AmazonLocationRegion.regionTypeByString(regionString: "cn-north-1"), .CNNorth1)
        XCTAssertEqual(AmazonLocationRegion.regionTypeByString(regionString: "cn-northwest-1"), .CNNorthWest1)
        XCTAssertEqual(AmazonLocationRegion.regionTypeByString(regionString: "ca-central-1"), .CACentral1)
        XCTAssertEqual(AmazonLocationRegion.regionTypeByString(regionString: "us-gov-west-1"), .USGovWest1)
        XCTAssertEqual(AmazonLocationRegion.regionTypeByString(regionString: "us-gov-east-1"), .USGovEast1)
        XCTAssertEqual(AmazonLocationRegion.regionTypeByString(regionString: "me-south-1"), .MESouth1)
        XCTAssertEqual(AmazonLocationRegion.regionTypeByString(regionString: "af-south-1"), .AFSouth1)
        XCTAssertEqual(AmazonLocationRegion.regionTypeByString(regionString: "eu-south-1"), .EUSouth1)
        
        XCTAssertEqual(AmazonLocationRegion.toRegionType(identityPoolId: identityPoolID), .USEast1)
        XCTAssertEqual(AmazonLocationRegion.toRegionString(identityPoolId: identityPoolID), "us-east-1")
    }
    
    func testAWSSigner() async throws {
        let config = readTestConfig()
        
        let identityPoolID = config["identityPoolID"]!
        let region = config["region"]!
        let authHelper = AuthHelper()
        let credentialsProvider = try? await authHelper.authenticateWithCognitoIdentityPool(identityPoolId: identityPoolID, region: region)!
        let cognitoProvider = credentialsProvider!.getCognitoProvider()!
        
        let awsSigner = AWSSignerV4(amazonLocationCognitoCredentialsProvider: cognitoProvider, serviceName: "geo")
        let url = URL(string: "https://maps.geo.us-east-1.amazonaws.com/maps/v0/maps/TestQuickStart/style-descriptor")!

        let signedURL = awsSigner.signURL(url: url, expires: TimeAmount.hours(1))
        XCTAssertNotNil(signedURL.absoluteString)
    }
}
