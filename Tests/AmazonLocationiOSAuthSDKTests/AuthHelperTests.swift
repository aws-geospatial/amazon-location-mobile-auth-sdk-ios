import XCTest
import Foundation
@testable import AmazonLocationiOSAuthSDK
import AwsCommonRuntimeKit

final class AuthHelperTests: XCTestCase {
    
    func readTestConfig() -> [String: String] {
        // Implement reading from your chosen config file. This is an example for a plist.
        guard let plistURL =  Foundation.Bundle.module.url(forResource: "TestConfig", withExtension: "plist"),
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
    
    func testAuthWithCustomeCredentials() async throws {
        let config = readTestConfig()
        
        let identityPoolID = config["identityPoolID"]!
        let region = config["region"]!
        let authHelper = AuthHelper()
        let authCognitoProvider = try? await authHelper.authenticateWithCognitoIdentityPool(identityPoolId: identityPoolID, region: region)
        let credentials = authCognitoProvider?.getCognitoProvider()?.getCognitoCredentials()
        
        if let accessKey = credentials?.accessKeyId, let secret = credentials?.secretKey, let sessionToken = credentials?.sessionToken {
            let credentialProvider = try CredentialsProvider(source: .static(accessKey: accessKey, secret: secret, sessionToken: sessionToken, shutdownCallback: {}))
            let customCredentialsProvider = AmazonLocationCustomCredentialsProvider(credentialsProvider: credentialProvider)
            let authProvider = try? await authHelper.authenticateWithCredentialsProvider(credentialsProvider: customCredentialsProvider)
            let customAccessKey = try await authProvider!.getCustomCredentialsProvider()?.credentialsProvider?.getCredentials().getAccessKey()
            XCTAssertEqual(customAccessKey, accessKey)
        }
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
