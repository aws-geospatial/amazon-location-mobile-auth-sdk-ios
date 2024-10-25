import Foundation
import AWSLocation
import AwsCommonRuntimeKit
import SmithyIdentity
import SmithyHTTPAuthAPI

@objc public class AuthHelper: NSObject {
    private var locationClientConfig: LocationClient.LocationClientConfiguration
    private var cognitoCredentialsProvider: AmazonLocationCognitoCredentialsProvider?

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

    @objc static public func withIdentityPoolId(identityPoolId: String) async throws -> AuthHelper {
        // If only the identityPoolId is passed, use its region for both the cognito credentials
        // and the region for our location client configurations
        let region = AmazonLocationRegion.toRegionString(identityPoolId: identityPoolId)

        return try await withIdentityPoolId(identityPoolId: identityPoolId, region: region)
    }
    
    @objc static public func withIdentityPoolId(identityPoolId: String, region: String) async throws -> AuthHelper {
        // Always use the region from the identityPoolId for retrieving cognito credentials
        let cognitoRegion = AmazonLocationRegion.toRegionString(identityPoolId: identityPoolId)
        let cognitoProvider = AmazonLocationCognitoCredentialsProvider(identityPoolId: identityPoolId, region: cognitoRegion)

        // Make sure credentials are refreshed
        try await cognitoProvider.refreshCognitoCredentialsIfExpired()

        var resolver: StaticAWSCredentialIdentityResolver?
        if let credentials = cognitoProvider.getCognitoCredentials() {
            let credentialsIdentity = AWSCredentialIdentity(accessKey: credentials.accessKeyId, secret: credentials.secretKey, expiration: credentials.expiration, sessionToken: credentials.sessionToken)
            resolver = try StaticAWSCredentialIdentityResolver(credentialsIdentity)
        }

        let locationClientConfig = try await LocationClient.LocationClientConfiguration(awsCredentialIdentityResolver: resolver, region: region, signingRegion: region)

        let authHelper = AuthHelper(locationClientConfig: locationClientConfig)

        // Store the cognito credentials provider so that it can refresh the credentials
        // if they are about to expire
        authHelper.cognitoCredentialsProvider = cognitoProvider

        return authHelper
    }
    
    public func getLocationClientConfig() -> LocationClient.LocationClientConfiguration {
        return self.locationClientConfig
    }
}
