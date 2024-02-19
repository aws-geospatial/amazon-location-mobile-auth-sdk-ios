import AWSCore
import AWSMobileClientXCF

public class AuthHelper {

    public init() {
    }
    
    public func authenticateWithCognitoUserPool(identityPoolId: String, region: String) -> LocationCredentialsProvider {
        let regionType = AWSEndpoint.regionTypeByString(regionString: region)
        let credentialProvider : LocationCredentialsProvider = LocationCredentialsProvider(regionType: regionType!, identityPoolId: identityPoolId)
        
        let configuration = AWSServiceConfiguration(
            region: regionType!,
            credentialsProvider: credentialProvider.getCognitoProvider()
        )
        
        AWSServiceManager.default().defaultServiceConfiguration = configuration
        return credentialProvider
    }
    
    public func authenticateWithCognitoUserPool(identityPoolId: String) -> LocationCredentialsProvider {
        let regionType = AWSEndpoint.toRegionType(identityPoolId: identityPoolId)
        
        let credentialProvider : LocationCredentialsProvider = LocationCredentialsProvider(regionType: regionType!, identityPoolId: identityPoolId)
        
        let configuration = AWSServiceConfiguration(
            region: regionType!,
            credentialsProvider: credentialProvider.getCognitoProvider()
        )
        
        AWSServiceManager.default().defaultServiceConfiguration = configuration
        return credentialProvider
    }
    
    public func authenticateWithAPIKey(apiKey: String, region: String) -> LocationCredentialsProvider {
        let credentialProvider = LocationCredentialsProvider(region: region, apiKey: apiKey)
        credentialProvider.setAPIKey(apiKey: apiKey)
        credentialProvider.setRegion(region: region)
        return credentialProvider
    }
}
