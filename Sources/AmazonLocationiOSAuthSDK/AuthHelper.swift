public class AuthHelper {

    public init() {
    }
    
    public func authenticateWithCognitoIdentityPool(identityPoolId: String, region: String) -> LocationCredentialsProvider {
        let regionType = AmazonLocationEndpoint.regionTypeByString(regionString: region)
        let credentialProvider : LocationCredentialsProvider = LocationCredentialsProvider(regionType: regionType!, identityPoolId: identityPoolId)
        return credentialProvider
    }
    
    public func authenticateWithCognitoIdentityPool(identityPoolId: String) -> LocationCredentialsProvider {
        let regionType = AmazonLocationEndpoint.toRegionType(identityPoolId: identityPoolId)
        let credentialProvider : LocationCredentialsProvider = LocationCredentialsProvider(regionType: regionType!, identityPoolId: identityPoolId)
        return credentialProvider
    }
    
    public func authenticateWithApiKey(apiKey: String, region: String) -> LocationCredentialsProvider {
        let credentialProvider = LocationCredentialsProvider(region: region, apiKey: apiKey)
        credentialProvider.setAPIKey(apiKey: apiKey)
        credentialProvider.setRegion(region: region)
        return credentialProvider
    }
    
    public func getLocationClient() //-> AWSLocation
    {
       //return AWSLocation.default()
    }
}
