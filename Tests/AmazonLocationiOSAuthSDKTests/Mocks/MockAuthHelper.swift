import Foundation
@testable import AmazonLocationiOSAuthSDK
import AWSGeoMaps
import AWSGeoPlaces
import AWSGeoRoutes
import AWSLocation

class MockAuthHelper: AuthHelperProtocol {
    var geoMapsClientConfig: GeoMapsClient.GeoMapsClientConfiguration
    var geoPlacesClientConfig: GeoPlacesClient.GeoPlacesClientConfiguration
    var geoRoutesClientConfig: GeoRoutesClient.GeoRoutesClientConfiguration
    var locationClientConfig: LocationClient.LocationClientConfiguration
    var cognitoCredentialsProvider: MockAmazonLocationCognitoCredentialsProvider?
    
    init(geoMapsClientConfig: GeoMapsClient.GeoMapsClientConfiguration,
         geoPlacesClientConfig: GeoPlacesClient.GeoPlacesClientConfiguration,
         geoRoutesClientConfig: GeoRoutesClient.GeoRoutesClientConfiguration,
         locationClientConfig: LocationClient.LocationClientConfiguration) {
        self.geoMapsClientConfig = geoMapsClientConfig
        self.geoPlacesClientConfig = geoPlacesClientConfig
        self.geoRoutesClientConfig = geoRoutesClientConfig
        self.locationClientConfig = locationClientConfig
    }
}
