# 1.1.1

### ✨ Features and improvements

- Several dependency version updates

- Bump github.com/apple/swift-nio from 2.93.0 to 2.101.0

# 1.1.0

### ✨ Features and improvements

- Several dependency version updates

- fix auto release workflow for ios versions to correctly read existing release versions
- Add unit tests for APIKeyInterceptor bundle ID header
- Add X-Apple-Bundle-Id header to API key requests
- Add two workflows; one to automate release, the second to retry failed dependabot pr creation

# 1.0.1

### ✨ Features and improvements

- Updated `aws-sdk-swift` dependency to latest to version `1.6.37` to resolve [security vulnerability](https://github.com/aws-geospatial/amazon-location-mobile-auth-sdk-ios/security/dependabot/1)

# 1.0.0

### ⚠️ Breaking changes

- Refactored API to `withAPIKey` and `withIdentityPoolId` entry points that return corresponding client configurations for standalone Maps, Places, Routes SDKs and Location SDK
- Removed custom wrapped client -> user can now use the clients directly from [aws-sdk-swift](https://github.com/awslabs/aws-sdk-swift)

### ✨ Features and improvements

- Added support for new standalone Maps, Places, and Routes SDKs
- Added HTTP interceptor for API key use-case so user no longer needs to pass the API key to each request
- Implemented automatic refresh of credentials when using Amazon Cognito
- Updated README with usage examples for all the new clients

# 0.3.2

### ✨ Features and improvements

- Made more methods public to make API Key usable from outside the package.

# 0.3.1

### ✨ Features and improvements

- Bumped AWS SDK to latest version.

# 0.3.0

### ✨ Features and improvements

- Added API Key support
- Updated dependencies

# 0.2.2

### ✨ Features and improvements

- Add support for custom credential providers
- Remove all mentions of API key in code and readme of all projects
- Create Objective-C bridge

# 0.2.1

### 🐞 Bug fixes

- AWS SDK 0.46.0 hotfix related to StaticAWSCredentialIdentityResolver

# 0.2.0

### ✨ Features and improvements

- Replaced aws-sdk-ios with aws-sdk-swift

# 0.1.0

### ✨ Features and improvements

- Create utilities to help authenticate into Amazon Location Service through using Amazon Cognito's Identity Pool ID or Amazon Location Service API keys.
