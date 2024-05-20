import Foundation

public class AuthHelper {

    public init() {
    }
    
    public func authenticateWithCognitoIdentityPool(identityPoolId: String) async throws -> LocationCredentialsProvider? {
        let regionType = AmazonLocationEndpoint.toRegionType(identityPoolId: identityPoolId)
        return try? await authenticateWithCognitoIdentityPool(identityPoolId: identityPoolId, regionType: regionType!)
    }
    
    public func authenticateWithCognitoIdentityPool(identityPoolId: String, region: String) async throws -> LocationCredentialsProvider? {
        let regionType = AmazonLocationEndpoint.regionTypeByString(regionString: region)
        return try? await authenticateWithCognitoIdentityPool(identityPoolId: identityPoolId, regionType: regionType!)
    }
    
    private func authenticateWithCognitoIdentityPool(identityPoolId: String, regionType: AmazonLocationRegionType) async throws -> LocationCredentialsProvider? {
        let credentialProvider : LocationCredentialsProvider = LocationCredentialsProvider(regionType: regionType, identityPoolId: identityPoolId)
        try await credentialProvider.getCognitoProvider()?.refreshCognitoCredentialsIfExpired()
        return credentialProvider
    }

    public func authenticateWithApiKey(apiKey: String, region: String) -> LocationCredentialsProvider {
        let credentialProvider = LocationCredentialsProvider(region: region, apiKey: apiKey)
        credentialProvider.setAPIKey(apiKey: apiKey)
        credentialProvider.setRegion(region: region)
        return credentialProvider
    }
    
    public func getLocationClient() -> AmazonClient
    {
       return AmazonClient()
    }
}
