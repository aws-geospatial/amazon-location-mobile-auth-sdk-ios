import Foundation
import AWSGeoMaps
import AWSGeoPlaces
import AWSGeoRoutes
import AWSLocation
import AwsCommonRuntimeKit
import SmithyIdentity
import SmithyHTTPAuthAPI

@objc public class AuthHelper: NSObject {
    internal var geoMapsClientConfig: GeoMapsClient.GeoMapsClientConfiguration
    internal var geoPlacesClientConfig: GeoPlacesClient.GeoPlacesClientConfiguration
    internal var geoRoutesClientConfig: GeoRoutesClient.GeoRoutesClientConfiguration
    internal var locationClientConfig: LocationClient.LocationClientConfiguration
    private var cognitoCredentialsProvider: AmazonLocationCognitoCredentialsProvider?

    public init(geoMapsClientConfig: GeoMapsClient.GeoMapsClientConfiguration, geoPlacesClientConfig: GeoPlacesClient.GeoPlacesClientConfiguration, geoRoutesClientConfig: GeoRoutesClient.GeoRoutesClientConfiguration, locationClientConfig: LocationClient.LocationClientConfiguration) {
        self.geoMapsClientConfig = geoMapsClientConfig
        self.geoPlacesClientConfig = geoPlacesClientConfig
        self.geoRoutesClientConfig = geoRoutesClientConfig
        self.locationClientConfig = locationClientConfig
    }

    @objc static public func withApiKey(apiKey: String, region: String) async throws -> AuthHelper {
        // For API key, we use a custom AuthScheme to bypass the normal credential signer,
        // since we are going to be passing the API key to the requests instead
        let resolver: AuthSchemeResolver = ApiKeyAuthSchemeResolver()
        let authScheme: AuthScheme = ApiKeyAuthScheme()
        let authSchemes: [AuthScheme] = [authScheme]
        
        let geoMapsClientConfig = try await GeoMapsClient.GeoMapsClientConfiguration(region: region, authSchemes: authSchemes, authSchemeResolver: resolver)
        let geoPlacesClientConfig = try await GeoPlacesClient.GeoPlacesClientConfiguration(region: region, authSchemes: authSchemes, authSchemeResolver: resolver)
        let geoRoutesClientConfig = try await GeoRoutesClient.GeoRoutesClientConfiguration(region: region, authSchemes: authSchemes, authSchemeResolver: resolver)
        let locationClientConfig = try await LocationClient.LocationClientConfiguration(region: region, authSchemes: authSchemes, authSchemeResolver: resolver)
        
        // This HTTP interceptor will inject the API key for all requests
        geoMapsClientConfig.addInterceptorProvider(APIKeyInterceptorProvider(apiKey: apiKey))
        geoPlacesClientConfig.addInterceptorProvider(APIKeyInterceptorProvider(apiKey: apiKey))
        geoRoutesClientConfig.addInterceptorProvider(APIKeyInterceptorProvider(apiKey: apiKey))
        locationClientConfig.addInterceptorProvider(APIKeyInterceptorProvider(apiKey: apiKey))
        
        let authHelper = AuthHelper(geoMapsClientConfig: geoMapsClientConfig, geoPlacesClientConfig: geoPlacesClientConfig, geoRoutesClientConfig: geoRoutesClientConfig, locationClientConfig: locationClientConfig)
        
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

        let geoMapsClientConfig = try await GeoMapsClient.GeoMapsClientConfiguration(awsCredentialIdentityResolver: resolver, region: region, signingRegion: region)
        let geoPlacesClientConfig = try await GeoPlacesClient.GeoPlacesClientConfiguration(awsCredentialIdentityResolver: resolver, region: region, signingRegion: region)
        let geoRoutesClientConfig = try await GeoRoutesClient.GeoRoutesClientConfiguration(awsCredentialIdentityResolver: resolver, region: region, signingRegion: region)
        let locationClientConfig = try await LocationClient.LocationClientConfiguration(awsCredentialIdentityResolver: resolver, region: region, signingRegion: region)

        let authHelper = AuthHelper(geoMapsClientConfig: geoMapsClientConfig, geoPlacesClientConfig: geoPlacesClientConfig, geoRoutesClientConfig: geoRoutesClientConfig, locationClientConfig: locationClientConfig)

        // Store the cognito credentials provider so that it can refresh the credentials
        // if they are about to expire
        authHelper.cognitoCredentialsProvider = cognitoProvider

        return authHelper
    }
    
    public func getGeoMapsClientConfig() -> GeoMapsClient.GeoMapsClientConfiguration {
        return self.geoMapsClientConfig
    }
    
    public func getGeoPlacesClientConfig() -> GeoPlacesClient.GeoPlacesClientConfiguration {
        return self.geoPlacesClientConfig
    }
    
    public func getGeoRoutesClientConfig() -> GeoRoutesClient.GeoRoutesClientConfiguration {
        return self.geoRoutesClientConfig
    }
    
    public func getLocationClientConfig() -> LocationClient.LocationClientConfiguration {
        return self.locationClientConfig
    }
}

extension AuthHelper: AuthHelperProtocol { }
