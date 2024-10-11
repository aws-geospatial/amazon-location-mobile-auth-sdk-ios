import Foundation
import AWSLocation
import AwsCommonRuntimeKit

@objc public class AuthHelper: NSObject {

    private var locationCredentialsProvider: LocationCredentialsProvider?
    private var amazonLocationClient: AmazonLocationClient?

    @objc public override init() {
    }
    
    @objc public func authenticateWithCognitoIdentityPool(identityPoolId: String) async throws -> LocationCredentialsProvider? {
        let region = AmazonLocationRegion.toRegionString(identityPoolId: identityPoolId)
        locationCredentialsProvider = try? await authenticateWithCognitoIdentityPoolAndRegion(identityPoolId: identityPoolId, region: region)
        return locationCredentialsProvider
    }
    
    @objc public func authenticateWithCognitoIdentityPool(identityPoolId: String, region: String) async throws -> LocationCredentialsProvider? {
        locationCredentialsProvider = try? await authenticateWithCognitoIdentityPoolAndRegion(identityPoolId: identityPoolId, region: region)
        return locationCredentialsProvider
    }
    
    private func authenticateWithCognitoIdentityPoolAndRegion(identityPoolId: String, region: String) async throws -> LocationCredentialsProvider? {
        let credentialProvider = LocationCredentialsProvider(region: region, identityPoolId: identityPoolId)
        credentialProvider.setRegion(region: region)
        amazonLocationClient = AmazonLocationClient(locationCredentialsProvider: credentialProvider)
        try await amazonLocationClient?.initialiseLocationClient()
        return credentialProvider
    }

    @objc public func authenticateWithApiKey(apiKey: String, region: String) async throws -> LocationCredentialsProvider? {
        let credentialProvider = LocationCredentialsProvider(region: region, apiKey: apiKey)
        credentialProvider.setAPIKey(apiKey: apiKey)
        credentialProvider.setRegion(region: region)
        locationCredentialsProvider = credentialProvider
        if let credentialsProvider = locationCredentialsProvider {
            amazonLocationClient = AmazonLocationClient(locationCredentialsProvider: credentialsProvider)
            try await amazonLocationClient?.initialiseLocationClient()
        }
        return credentialProvider
    }
    
    public func authenticateWithCredentialsProvider(credentialsProvider: CredentialsProvider, region: String) async throws -> LocationCredentialsProvider? {
        let credentialProvider = LocationCredentialsProvider(credentialsProvider: credentialsProvider)
        credentialProvider.setRegion(region: region)
        locationCredentialsProvider = credentialProvider
        if let credentialsProvider = locationCredentialsProvider {
            amazonLocationClient = AmazonLocationClient(locationCredentialsProvider: credentialsProvider)
            try await amazonLocationClient?.initialiseLocationClient()
        }
        return credentialProvider
    }

    @objc public func getLocationClient() -> AmazonLocationClient?
    {
        return amazonLocationClient
    }
}
