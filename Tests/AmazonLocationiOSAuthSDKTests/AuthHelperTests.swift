import XCTest
import Foundation
@testable import AmazonLocationiOSAuthSDK
import AwsCommonRuntimeKit
import CoreLocation
import AWSLocation

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
        let searchPlaceIndex = config["placeIndex"]!
        
        let authHelper = AuthHelper()
        let authProvider = try? await authHelper.authenticateWithCognitoIdentityPool(identityPoolId: identityPoolID)
        XCTAssertEqual(authProvider!.getIdentityPoolId(), identityPoolID)
        XCTAssertNotNil(authProvider?.getCognitoProvider())
        
        let biasPosition = CLLocationCoordinate2D(latitude: 47.654502614244194, longitude: -122.35862564621954)
        let locationClient = authHelper.getLocationClient()
        let searchPlaceIndexForSuggestionsInput = SearchPlaceIndexForSuggestionsInput(biasPosition: [biasPosition.longitude, biasPosition.latitude], indexName: searchPlaceIndex, maxResults: 15, text: "Schools")
        let response = try await locationClient?.searchPlaceIndexForSuggestions(input: searchPlaceIndexForSuggestionsInput)
        
        var searchResults: [String] = []
        if let results = response?.results {
            for item in results {
                searchResults.append((item.text)!)
            }
        }
        XCTAssertNotEqual(searchResults.count, 0, "Search has results")
    }
    
    func testAuthWithIdentityPoolIDAndRegion() async throws {
        let config = readTestConfig()
        
        let identityPoolID = config["identityPoolID"]!
        let region = config["region"]!
        let authHelper = AuthHelper()
        let authProvider = try? await authHelper.authenticateWithCognitoIdentityPool(identityPoolId: identityPoolID, region: region)
        XCTAssertEqual(authProvider!.getIdentityPoolId(), identityPoolID)
    }
    
    func testAuthWithAPIKey() async throws {
        do {
            let config = readTestConfig()
            let apiKey = config["apiKey"]!
            let region = config["region"]!
            let searchPlaceIndex = config["placeIndex"]!
            
            let authHelper = AuthHelper()
            let authProvider = try await authHelper.authenticateWithApiKey(apiKey: apiKey, region: region)
            
            XCTAssertNotNil(authProvider?.getApiProvider())
            
            let biasPosition = CLLocationCoordinate2D(latitude: 47.654502614244194, longitude: -122.35862564621954)
            let locationClient = authHelper.getLocationClient()
            let searchPlaceIndexForSuggestionsInput = SearchPlaceIndexForSuggestionsInput(biasPosition: [biasPosition.longitude, biasPosition.latitude], indexName: searchPlaceIndex, key: apiKey, maxResults: 15, text: "Schools")
            let response = try await locationClient?.searchPlaceIndexForSuggestions(input: searchPlaceIndexForSuggestionsInput)
            
            var searchResults: [String] = []
            if let results = response?.results {
                for item in results {
                    searchResults.append((item.text)!)
                }
            }
            XCTAssertNotEqual(searchResults.count, 0, "Search has results")
        }
        catch {
            XCTFail(error.localizedDescription)
            throw error
        }
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
            let authProvider = try? await authHelper.authenticateWithCredentialsProvider(credentialsProvider: credentialProvider, region: region)
            let customAccessKey = try await authProvider!.getCustomCredentialsProvider()?.getCredentials().getAccessKey()
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
