import Foundation

@objc public class LocationCredentialsProvider: NSObject {
    private var cognitoProvider: AmazonLocationCognitoCredentialsProvider?
    private var apiProvider: AmazonLocationApiCredentialsProvider?
    private var customCredentialsProvider: AmazonLocationCustomCredentialsProvider?
    private var region: String?
    
    @objc public init(region: String, identityPoolId: String){
        self.region = region
        self.cognitoProvider = AmazonLocationCognitoCredentialsProvider(identityPoolId: identityPoolId, region: region)
    }
    
    @objc public init(region: String, apiKey: String){
        self.region = region
        self.apiProvider = AmazonLocationApiCredentialsProvider(apiKey: apiKey, region: region)
    }
    
    @objc public init(credentialsProvider: AmazonLocationCustomCredentialsProvider){
        self.customCredentialsProvider = credentialsProvider
    }
    
    @objc public func getCognitoProvider() -> AmazonLocationCognitoCredentialsProvider? {
        return cognitoProvider
    }
    
    @objc public func getApiProvider() -> AmazonLocationApiCredentialsProvider? {
        return apiProvider
    }
    
    @objc public func getCustomProvider() -> AmazonLocationCustomCredentialsProvider? {
        return customCredentialsProvider
    }
    
    @objc public func getIdentityPoolId() -> String? {
        return self.cognitoProvider?.identityPoolId
    }
    
    @objc public func getAPIKey() -> String? {
        return self.apiProvider?.apiKey
    }
    
    @objc public func getRegion() -> String? {
        return region
    }
    
    internal func setAPIKey(apiKey: String) {
        self.apiProvider?.apiKey = apiKey
        KeyChainHelper.save(value: apiKey, key: .AmazonLocationAPIKey)
    }
    
    internal func setRegion(region: String) {
        self.apiProvider?.region = region
        self.cognitoProvider?.region = region
        self.region = region
        KeyChainHelper.save(value: region, key: .AWSRegion)
    }
}
