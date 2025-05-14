import Testing
@testable import AmazonLocationiOSAuthSDK
import AWSGeoMaps
import AWSGeoPlaces
import AWSGeoRoutes
import AWSLocation
import SmithyHTTPAuthAPI


@Suite("Auth Helper Tests") struct AuthHelperTests {
    @Test("Test with API Key") func testWithApiKey() async throws {
        let region: String = "us-east-1"
        let factory = MockAuthHelperFactory()
        let configs = try await factory.makeWithApiKey(apiKey: "test-api-key", region: region)
        
        #expect(configs.geoMapsClientConfig != nil)
        #expect(configs.geoMapsClientConfig.region ?? "" == region)
        
        #expect(configs.geoPlacesClientConfig != nil)
        #expect(configs.geoPlacesClientConfig.region ?? "" == region)
        
        #expect(configs.geoRoutesClientConfig != nil)
        #expect(configs.geoRoutesClientConfig.region ?? "" == region)
        
        #expect(configs.locationClientConfig != nil)
        #expect(configs.locationClientConfig.region ?? "" == region)
    }
    
    @Test("Test with IdentityPoolID") func testWithIdentityPoolId() async throws {
        let region: String = "us-east-1"
        let identityPoolId: String = "\(region):test-pool-id"
        let factory = MockAuthHelperFactory()
        let configs = try await factory.makeWithIdentityPoolId(identityPoolId: identityPoolId)
        
        #expect(configs.geoMapsClientConfig != nil)
        #expect(configs.geoMapsClientConfig.region ?? "" == region)
        
        #expect(configs.geoPlacesClientConfig != nil)
        #expect(configs.geoPlacesClientConfig.region ?? "" == region)
        
        #expect(configs.geoRoutesClientConfig != nil)
        #expect(configs.geoRoutesClientConfig.region ?? "" == region)
        
        #expect(configs.locationClientConfig != nil)
        #expect(configs.locationClientConfig.region ?? "" == region)
    }
    
    @Test("Test with IdentityPoolID and Region") func testWithIdentityPoolIdAndRegion() async throws {
        let region: String = "us-east-1"
        let identityPoolId: String = "\(region):test-pool-id"
        let factory = MockAuthHelperFactory()
        let configs = try await factory.makeWithIdentityPoolId(identityPoolId: identityPoolId, region: region)
        
        #expect(configs.geoMapsClientConfig != nil)
        #expect(configs.geoMapsClientConfig.region ?? "" == region)
        
        #expect(configs.geoPlacesClientConfig != nil)
        #expect(configs.geoPlacesClientConfig.region ?? "" == region)
        
        #expect(configs.geoRoutesClientConfig != nil)
        #expect(configs.geoRoutesClientConfig.region ?? "" == region)
        
        #expect(configs.locationClientConfig != nil)
        #expect(configs.locationClientConfig.region ?? "" == region)
    }
}
