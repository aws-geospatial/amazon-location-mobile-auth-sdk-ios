public class LocationCredentialsProvider {
    private var cognitoProvider: AmazonLocationCognitoCredentialsProvider?
    private var apiProvider: AmazonLocationApiCredentialsProvider?
    private var region: String?
    
    public init(regionType: AmazonLocationRegionType, identityPoolId: String){
        self.region = regionType.rawValue
        self.cognitoProvider = AmazonLocationCognitoCredentialsProvider(identityPoolId: identityPoolId, region: region)
    }
    
    public init(region: String, apiKey: String){
        self.region = region
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
