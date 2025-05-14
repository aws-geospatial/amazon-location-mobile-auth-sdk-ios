import AWSGeoMaps
import AWSGeoPlaces
import AWSGeoRoutes
import AWSLocation

/// Protocol defining the interface for the AuthHelper class to provide access to the various Amazon Location Service client configs.
///
/// This allows unit tests to mock the behavior of `AuthHelper` by conforming to this protocol without relying on the actual
///  AWS SDK configs.
protocol AuthHelperProtocol {
    var geoMapsClientConfig: GeoMapsClient.GeoMapsClientConfiguration { get }
    var geoPlacesClientConfig: GeoPlacesClient.GeoPlacesClientConfiguration { get }
    var geoRoutesClientConfig: GeoRoutesClient.GeoRoutesClientConfiguration { get }
    var locationClientConfig: LocationClient.LocationClientConfiguration { get }
}
