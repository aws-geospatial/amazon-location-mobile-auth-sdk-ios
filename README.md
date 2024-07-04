# Amazon Location Service Mobile Authentication SDK for iOS

These utilities help you authenticate when when making [Amazon Location Service](https://aws.amazon.com/location/) API calls from their iOS applications. This specifically helps when using [Amazon Cognito](https://docs.aws.amazon.com/location/latest/developerguide/authenticating-using-cognito.html) as the authentication method.

## Installation

1. Go to File -> Add Package Dependencies in your XCode project.
2. Type the package URL (https://github.com/aws-geospatial/amazon-location-mobile-auth-sdk-ios/) into the search bar and press the enter key. 
3. Select the "amazon-location-mobile-auth-sdk-ios" package and click on "Add Package".
4. Select the "AmazonLocationiOSAuthSDK" package product and click on "Add Package".

## Usage

After installing the library, import the AuthHelper class in an activity:

``` swift
import AmazonLocationiOSAuthSDK
import AWSLocationXCF
```

You can create an AuthHelper and use it with the AWS SDK:

``` swift
// Create an authentication helper using credentials from Cognito
func exampleCognitoLogin() {
    let authHelper = AuthHelper()
    let locationCredentialsProvider = authHelper.authenticateWithCognitoIdentityPool(identityPoolId: "My-Cognito-Identity-Pool-Id", region: "us-east-1")
    let locationClient = authHelper.getLocationClient()
}
```

``` swift
// Create an authentication helper using credentials from any AWS-Swift-SDK [Credentials Provider](https://github.com/awslabs/aws-crt-swift/blob/main/Source/AwsCommonRuntimeKit/auth/credentials/CredentialsProvider.swift)
func exampleCognitoLogin() {
    let authHelper = AuthHelper()
    let credentialProvider = try CredentialsProvider(source: .static(accessKey: "My-AWS-AccessKey", secret: "My-AWS-Secret", sessionToken: "My-AWS-SessionToken", shutdownCallback: {/*Perform post shutdown operation here*/})) 
    let customCredentialsProvider = AmazonLocationCustomCredentialsProvider(credentialsProvider: credentialProvider)
    let locationCredentialsProvider = authHelper.authenticateWithCredentialsProvider(credentialsProvider: AmazonLocationCustomCredentialsProvider)
    let locationClient = authHelper.getLocationClient()
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

## Contributing

We welcome community contributions and pull requests. See [CONTRIBUTING.md](https://github.com/aws-geospatial/amazon-location-mobile-auth-sdk-ios/blob/master/CONTRIBUTING.md) for information on how to set up a development environment and submit code.

## License

The Amazon Location Service Mobile Authentication SDK for iOS is distributed under the
[Apache License, Version 2.0](http://www.apache.org/licenses/LICENSE-2.0),
see LICENSE.txt and NOTICE.txt for more information.
