import Foundation

public class AuthHelper {

    private var locationCredentialsProvider: LocationCredentialsProvider?
    
    public init() {
    }
    
    public func authenticateWithCognitoIdentityPool(identityPoolId: String) async throws -> LocationCredentialsProvider? {
        let region = AmazonLocationRegion.toRegionString(identityPoolId: identityPoolId)
        locationCredentialsProvider = try? await authenticateWithCognitoIdentityPoolAndRegion(identityPoolId: identityPoolId, region: region)
        return locationCredentialsProvider
    }
    
    public func authenticateWithCognitoIdentityPool(identityPoolId: String, region: String) async throws -> LocationCredentialsProvider? {
        locationCredentialsProvider = try? await authenticateWithCognitoIdentityPoolAndRegion(identityPoolId: identityPoolId, region: region)
        return locationCredentialsProvider
    }
    
    private func authenticateWithCognitoIdentityPoolAndRegion(identityPoolId: String, region: String) async throws -> LocationCredentialsProvider? {
        let credentialProvider = LocationCredentialsProvider(region: region, identityPoolId: identityPoolId)
        credentialProvider.setRegion(region: region)
        try await credentialProvider.getCognitoProvider()?.refreshCognitoCredentialsIfExpired()
        return credentialProvider
    }

    public func authenticateWithApiKey(apiKey: String, region: String) -> LocationCredentialsProvider {
        let credentialProvider = LocationCredentialsProvider(region: region, apiKey: apiKey)
        credentialProvider.setAPIKey(apiKey: apiKey)
        credentialProvider.setRegion(region: region)
        locationCredentialsProvider =  credentialProvider
        return credentialProvider
    }
    
    public func getLocationClient() -> AmazonLocationClient?
    {
        guard let locationCredentialsProvider = self.locationCredentialsProvider else {
            return nil
        }
        return AmazonLocationClient(locationCredentialsProvider: locationCredentialsProvider)
    }
}
