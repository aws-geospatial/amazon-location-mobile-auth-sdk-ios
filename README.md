# Amazon Location Service Mobile Authentication SDK for iOS

These utilities help you authenticate when when making [Amazon Location Service](https://aws.amazon.com/location/) API calls from iOS applications. This specifically helps when using [API keys](https://docs.aws.amazon.com/location/latest/developerguide/using-apikeys.html) or [Amazon Cognito](https://docs.aws.amazon.com/location/latest/developerguide/authenticating-using-cognito.html) as the authentication method.

## Installation

1. Go to File -> Add Package Dependencies in your XCode project.
2. Type the package URL (https://github.com/aws-geospatial/amazon-location-mobile-auth-sdk-ios/) into the search bar and press the enter key.
3. Select the "amazon-location-mobile-auth-sdk-ios" package and click on "Add Package".
4. Select the "AmazonLocationiOSAuthSDK" package product and click on "Add Package".

## Usage

After installing the library, use the `AuthHelper` class to retrieve your desired client configuration for either [API keys](https://docs.aws.amazon.com/location/latest/developerguide/using-apikeys.html) or [Amazon Cognito](https://docs.aws.amazon.com/location/latest/developerguide/authenticating-using-cognito.html).

### API keys

Here is an example using the standalone `Places` SDK with the [API key](https://docs.aws.amazon.com/location/latest/developerguide/using-apikeys.html) authentication method:

```swift
import AmazonLocationiOSAuthSDK
import AWSGeoPlaces

func geoPlacesExample() {
    let apiKey = "<API key>"
    let region = "<Region>"

    // Create an authentication helper using your API key and region
    let authHelper = try await AuthHelper.withApiKey(apiKey: apiKey, region: region)

    // Configure the GeoPlacesClient to use API keys when making requests
    let client: GeoPlacesClient = GeoPlacesClient(config: authHelper.getGeoPlacesClientConfig())

    // Construct the input for the request
    let input = AWSGeoPlaces.SearchTextInput(
        biasPosition: [-97.7457518, 30.268193],
        queryText: "tacos"
    )

    // Use the client to send the request
    let output = try await client.searchText(input: input)
}
```

Here is an example using the standalone `Routes` SDK with the [API key](https://docs.aws.amazon.com/location/latest/developerguide/using-apikeys.html) authentication method:

```swift
import AmazonLocationiOSAuthSDK
import AWSGeoRoutes

func geoRoutesExample() {
    let apiKey = "<API key>"
    let region = "<Region>"

    // Create an authentication helper using your API key and region
    let authHelper = try await AuthHelper.withApiKey(apiKey: apiKey, region: region)

    // Configure the GeoRoutesClient to use API keys when making requests
    let client: GeoRoutesClient = GeoRoutesClient(config: authHelper.getGeoRoutesClientConfig())

    // Construct the input for the request
    let input = AWSGeoRoutes.CalculateRoutesInput(
        destination: [-123.1651031, 49.2577281],
        origin: [-97.7457518, 30.268193]
    )

    // Use the client to send the request
    let output = try await client.calculateRoutes(input: input)
}
```

Here is an example using the `Location` SDK with the [API key](https://docs.aws.amazon.com/location/latest/developerguide/using-apikeys.html) authentication method:

```swift
import AmazonLocationiOSAuthSDK
import AWSLocation

func locationExample() {
    let apiKey = "<API key>"
    let region = "<Region>"

    // Create an authentication helper using your API key and region
    let authHelper = try await AuthHelper.withApiKey(apiKey: apiKey, region: region)

    // Configure the LocationClient to use API keys when making requests
    let client: LocationClient = LocationClient(config: authHelper.getLocationClientConfig())

    // Construct the input for the request
    let input = AWSLocation.ListGeofencesInput(
        collectionName: "<Collection name>"
    )

    // Use the client to send the request
    let output = try await client.listGeofences(input: input)
}
```

### Amazon Cognito

Here is an example using the standalone `Places` SDK with the [Amazon Cognito](https://docs.aws.amazon.com/location/latest/developerguide/authenticating-using-cognito.html) authentication method:

```swift
import AmazonLocationiOSAuthSDK
import AWSGeoPlaces

func geoPlacesExample() {
    let identityPoolId = "<Identity Pool ID>"

    // Create an authentication helper using credentials from Cognito
    let authHelper = try await AuthHelper.withIdentityPoolId(identityPoolId: identityPoolId)

    // Configure the GeoPlacesClient to use credentials obtained via Amazon Cognito
    let client: GeoPlacesClient = GeoPlacesClient(config: authHelper.getGeoPlacesClientConfig())

    // Construct the input for the request
    let input = AWSGeoPlaces.SearchTextInput(
        biasPosition: [-97.7457518, 30.268193],
        queryText: "tacos"
    )

    // Use the client to send the request
    let output = try await client.searchText(input: input)
}
```

Here is an example using the standalone `Routes` SDK with the [Amazon Cognito](https://docs.aws.amazon.com/location/latest/developerguide/authenticating-using-cognito.html) authentication method:

```swift
import AmazonLocationiOSAuthSDK
import AWSGeoRoutes

func geoRoutesExample() {
    let identityPoolId = "<Identity Pool ID>"

    // Create an authentication helper using credentials from Cognito
    let authHelper = try await AuthHelper.withIdentityPoolId(identityPoolId: identityPoolId)

    // Configure the GeoRoutesClient to use credentials obtained via Amazon Cognito
    let client: GeoRoutesClient = GeoRoutesClient(config: authHelper.getGeoRoutesClientConfig())

    // Construct the input for the request
    let input = AWSGeoRoutes.CalculateRoutesInput(
        destination: [-123.1651031, 49.2577281],
        origin: [-97.7457518, 30.268193]
    )

    // Use the client to send the request
    let output = try await client.calculateRoutes(input: input)
}
```

Here is an example using the `Location` SDK with the [Amazon Cognito](https://docs.aws.amazon.com/location/latest/developerguide/authenticating-using-cognito.html) authentication method:

```swift
import AmazonLocationiOSAuthSDK
import AWSLocation

func locationExample() {
    let identityPoolId = "<Identity Pool ID>"

    // Create an authentication helper using credentials from Cognito
    let authHelper = try await AuthHelper.withIdentityPoolId(identityPoolId: identityPoolId)

    // Configure the LocationClient to use credentials obtained via Amazon Cognito
    let client: LocationClient = LocationClient(config: authHelper.getLocationClientConfig())

    // Construct the input for the request
    let input = AWSLocation.ListGeofencesInput(
        collectionName: "<Collection name>"
    )

    // Use the client to send the request
    let output = try await client.listGeofences(input: input)
}
```

## Security

See [CONTRIBUTING](CONTRIBUTING.md#security-issue-notifications) for more information.

## Getting Help

The best way to interact with our team is through GitHub.
You can [open an issue](https://github.com/aws-geospatial/amazon-location-mobile-auth-sdk-ios/issues/new/choose) and choose from one of our templates for
[bug reports](https://github.com/aws-geospatial/amazon-location-mobile-auth-sdk-ios/issues/new?assignees=&labels=bug%2C+needs-triage&template=---bug-report.md&title=),
[feature requests](https://github.com/aws-geospatial/amazon-location-mobile-auth-sdk-ios/issues/new?assignees=&labels=feature-request&template=---feature-request.md&title=)
or [guidance](https://github.com/aws-geospatial/amazon-location-mobile-auth-sdk-ios/issues/new?assignees=&labels=guidance%2C+needs-triage&template=---questions---help.md&title=).
If you have a support plan with [AWS Support](https://aws.amazon.com/premiumsupport/), you can also create a new support case.

Please make sure to check out the following resources before opening an issue:

- Our [Changelog](CHANGELOG.md) for recent changes.

## Contributing

We welcome community contributions and pull requests. See [CONTRIBUTING.md](CONTRIBUTING.md) for information on how to set up a development environment and submit code.

## License

The Amazon Location Service Mobile Authentication SDK for iOS is distributed under the
[Apache License, Version 2.0](http://www.apache.org/licenses/LICENSE-2.0),
see LICENSE.txt and NOTICE.txt for more information.
