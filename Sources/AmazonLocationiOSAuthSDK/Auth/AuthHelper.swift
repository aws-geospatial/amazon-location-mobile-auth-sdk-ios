import Foundation

public class AuthHelper {

    private var locationCredentialsProvider: LocationCredentialsProvider?
    
    public init() {
    }
    
    public func authenticateWithCognitoIdentityPool(identityPoolId: String) async throws -> LocationCredentialsProvider? {
        let regionType = AmazonLocationRegion.toRegionType(identityPoolId: identityPoolId)
        locationCredentialsProvider = try? await authenticateWithCognitoIdentityPool(identityPoolId: identityPoolId, regionType: regionType!)
        return locationCredentialsProvider
    }
    
    public func authenticateWithCognitoIdentityPool(identityPoolId: String, region: String) async throws -> LocationCredentialsProvider? {
        let regionType = AmazonLocationRegion.regionTypeByString(regionString: region)
        locationCredentialsProvider = try? await authenticateWithCognitoIdentityPool(identityPoolId: identityPoolId, regionType: regionType!)
        return locationCredentialsProvider
    }
    
    private func authenticateWithCognitoIdentityPool(identityPoolId: String, regionType: AmazonLocationRegionType) async throws -> LocationCredentialsProvider? {
        let credentialProvider = LocationCredentialsProvider(regionType: regionType, identityPoolId: identityPoolId)
        credentialProvider.setRegion(region: regionType.rawValue)
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
        return AmazonLocationClient(locationCredentialsProvider: self.locationCredentialsProvider!)
    }
}
