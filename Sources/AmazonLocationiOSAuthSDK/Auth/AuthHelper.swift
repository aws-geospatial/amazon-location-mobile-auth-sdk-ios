import Foundation
import AwsCommonRuntimeKit

@objc public class AuthHelper: NSObject {

    private var locationCredentialsProvider: LocationCredentialsProvider?
    
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
        try await credentialProvider.getCognitoProvider()?.refreshCognitoCredentialsIfExpired()
        return credentialProvider
    }

    @objc public func authenticateWithApiKey(apiKey: String, region: String) -> LocationCredentialsProvider {
        let credentialProvider = LocationCredentialsProvider(region: region, apiKey: apiKey)
        credentialProvider.setAPIKey(apiKey: apiKey)
        credentialProvider.setRegion(region: region)
        locationCredentialsProvider =  credentialProvider
        return credentialProvider
    }
    
    @objc public func authenticateWithCredentialsProvider(credentialsProvider: AmazonLocationCustomCredentialsProvider) async throws -> LocationCredentialsProvider? {
        let credentialProvider = LocationCredentialsProvider(credentialsProvider: credentialsProvider)
        return credentialProvider
    }
    
    @objc public func getLocationClient() -> AmazonLocationClient?
    {
        guard let locationCredentialsProvider = self.locationCredentialsProvider else {
            return nil
        }
        return AmazonLocationClient(locationCredentialsProvider: locationCredentialsProvider)
    }
}
