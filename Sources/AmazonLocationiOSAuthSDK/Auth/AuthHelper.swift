import Foundation
import AWSLocation
import AwsCommonRuntimeKit
import SmithyIdentity
import SmithyHTTPAuthAPI

@objc public class AuthHelper: NSObject {
    private var locationClientConfig: LocationClient.LocationClientConfiguration

    public init(locationClientConfig: LocationClient.LocationClientConfiguration) {
        self.locationClientConfig = locationClientConfig
    }

    @objc static public func withApiKey(apiKey: String, region: String) async throws -> AuthHelper {
        // For API key, we use a custom AuthScheme to bypass the normal credential signer,
        // since we are going to be passing the API key to the requests instead
        let resolver: AuthSchemeResolver = ApiKeyAuthSchemeResolver()
        let authScheme: AuthScheme = ApiKeyAuthScheme()
        let authSchemes: [AuthScheme] = [authScheme]
        
        let locationClientConfig = try await LocationClient.LocationClientConfiguration(region: region, authSchemes: authSchemes, authSchemeResolver: resolver)
        
        // This HTTP interceptor will inject the API key for all requests
        locationClientConfig.addInterceptorProvider(APIKeyInterceptorProvider(apiKey: apiKey))
        
        let authHelper = AuthHelper(locationClientConfig: locationClientConfig)
        
        return authHelper
    }
    
    @objc static public func withIdentityPoolId(identityPoolId: String) async throws -> AuthHelper? {
        let region = AmazonLocationRegion.toRegionString(identityPoolId: identityPoolId)
        let cognitoProvider = AmazonLocationCognitoCredentialsProvider(identityPoolId: identityPoolId, region: region)

        // Make sure credentials are refreshed
        try await cognitoProvider.refreshCognitoCredentialsIfExpired()

        if let credentials = cognitoProvider.getCognitoCredentials() {
            let credentialsIdentity = AWSCredentialIdentity(accessKey: credentials.accessKeyId, secret: credentials.secretKey, expiration: credentials.expiration, sessionToken: credentials.sessionToken)
            let resolver: StaticAWSCredentialIdentityResolver? =  try StaticAWSCredentialIdentityResolver(credentialsIdentity)
            
            let locationClientConfig = try await LocationClient.LocationClientConfiguration(awsCredentialIdentityResolver: resolver, region: region, signingRegion: region)
            
            let authHelper = AuthHelper(locationClientConfig: locationClientConfig)
            
            return authHelper
        }
        
        // If we failed to get the Cognito credentials, an error would've already been thrown above
        return nil
    }
    
    public func getLocationClientConfig() -> LocationClient.LocationClientConfiguration {
        return self.locationClientConfig
    }
}
