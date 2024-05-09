public class LocationCredentialsProvider {
    private var cognitoProvider: AmazonLocationCognitoCredentialsProvider?
    private var apiProvider: AmazonLocationApiCredentialsProvider?
    private var region: String?
    
    public init(regionType: AmazonLocationRegionType, identityPoolId: String){
        self.cognitoProvider = AmazonLocationCognitoCredentialsProvider(identityPoolId: identityPoolId, region: region)
    }
    
    public init(region: String, apiKey: String){
        self.apiProvider = AmazonLocationApiCredentialsProvider(apiKey: apiKey, region: region)
    }
    
    public func getCognitoProvider() -> AmazonLocationCognitoCredentialsProvider? {
        return cognitoProvider
    }
    
    public func getApiProvider() -> AmazonLocationApiCredentialsProvider? {
        return apiProvider
    }
    
    public func getIdentityPoolId() -> String? {
        return self.cognitoProvider?.identityPoolId
    }
    
    public func getAPIKey() -> String? {
        self.apiProvider?.apiKey = KeyChainHelper.get(key: .AmazonLocationAPIKey)
        return self.apiProvider?.apiKey
    }
    
    public func getRegion() -> String? {
        let region = KeyChainHelper.get(key: .AWSRegion)
        self.apiProvider?.region = region
        return region
    }
    
    internal func setAPIKey(apiKey: String) {
        self.apiProvider?.apiKey = apiKey
        KeyChainHelper.save(value: apiKey, key: .AmazonLocationAPIKey)
    }
    
    internal func setRegion(region: String) {
        self.apiProvider?.region = region
        self.region = region
        KeyChainHelper.save(value: region, key: .AWSRegion)
    }
}
