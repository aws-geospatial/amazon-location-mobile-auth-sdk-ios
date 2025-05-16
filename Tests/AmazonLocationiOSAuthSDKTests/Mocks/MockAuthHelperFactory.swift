@testable import AmazonLocationiOSAuthSDK
import AWSGeoMaps
import AWSGeoPlaces
import AWSGeoRoutes
import AWSLocation
import SmithyHTTPAuthAPI

class MockAuthHelperFactory: AuthHelperFactoryProtocol {    
    func makeWithApiKey(apiKey: String, region: String) async throws -> AuthHelperProtocol {
        let resolver: AuthSchemeResolver = ApiKeyAuthSchemeResolver()
        let authScheme: AuthScheme = ApiKeyAuthScheme()
        let authSchemes: [AuthScheme] = [authScheme]
        
        let geoMapsClientConfig = try await GeoMapsClient.GeoMapsClientConfiguration(region: region, authSchemes: authSchemes, authSchemeResolver: resolver)
        let geoPlacesClientConfig = try await GeoPlacesClient.GeoPlacesClientConfiguration(region: region, authSchemes: authSchemes, authSchemeResolver: resolver)
        let geoRoutesClientConfig = try await GeoRoutesClient.GeoRoutesClientConfiguration(region: region, authSchemes: authSchemes, authSchemeResolver: resolver)
        let locationClientConfig = try await LocationClient.LocationClientConfiguration(region: region, authSchemes: authSchemes, authSchemeResolver: resolver)
        
        geoMapsClientConfig.addInterceptorProvider(APIKeyInterceptorProvider(apiKey: apiKey))
        geoPlacesClientConfig.addInterceptorProvider(APIKeyInterceptorProvider(apiKey: apiKey))
        geoRoutesClientConfig.addInterceptorProvider(APIKeyInterceptorProvider(apiKey: apiKey))
        locationClientConfig.addInterceptorProvider(APIKeyInterceptorProvider(apiKey: apiKey))
        
        return MockAuthHelper(geoMapsClientConfig: geoMapsClientConfig, geoPlacesClientConfig: geoPlacesClientConfig, geoRoutesClientConfig: geoRoutesClientConfig, locationClientConfig: locationClientConfig)
    }
    
    func makeWithIdentityPoolId(identityPoolId: String) async throws -> AuthHelperProtocol {
        let region = AmazonLocationRegion.toRegionString(identityPoolId: identityPoolId)

        return try await makeWithIdentityPoolId(identityPoolId: identityPoolId, region: region)
    }
    
    func makeWithIdentityPoolId(identityPoolId: String, region: String) async throws -> AuthHelperProtocol {
        let cognitoRegion = AmazonLocationRegion.toRegionString(identityPoolId: identityPoolId)
        let cognitoProvider = MockAmazonLocationCognitoCredentialsProvider(identityPoolId: identityPoolId, region: cognitoRegion)

        try await cognitoProvider.refreshCognitoCredentials()

        let geoMapsClientConfig = try await GeoMapsClient.GeoMapsClientConfiguration(region: region, signingRegion: region)
        let geoPlacesClientConfig = try await GeoPlacesClient.GeoPlacesClientConfiguration(region: region, signingRegion: region)
        let geoRoutesClientConfig = try await GeoRoutesClient.GeoRoutesClientConfiguration(region: region, signingRegion: region)
        let locationClientConfig = try await LocationClient.LocationClientConfiguration(region: region, signingRegion: region)

        let authHelper = MockAuthHelper(geoMapsClientConfig: geoMapsClientConfig, geoPlacesClientConfig: geoPlacesClientConfig, geoRoutesClientConfig: geoRoutesClientConfig, locationClientConfig: locationClientConfig)

        authHelper.cognitoCredentialsProvider = cognitoProvider

        return authHelper
    }
}
