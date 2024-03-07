import AWSCore

public class LocationCredentialsProvider {
    private var cognitoProvider: AWSCognitoCredentialsProvider?
    private var apiProvider: AmazonLocationAPICredentialsProvider?
    private var region: String?
    
    public init(regionType: AWSRegionType, identityPoolId: String){
        self.cognitoProvider = AWSCognitoCredentialsProvider(regionType: regionType, identityPoolId: identityPoolId)
    }
    
    public init(region: String, apiKey: String){
        self.apiProvider = AmazonLocationAPICredentialsProvider(apiKey: apiKey, region: region)
    }
    
    public func getCognitoProvider() -> AWSCognitoCredentialsProvider? {
        return cognitoProvider
    }
    
    public func getAPIProvider() -> AmazonLocationAPICredentialsProvider? {
        return apiProvider
    }
    
    public func getIdentityPoolId() -> String? {
        return self.cognitoProvider?.identityPoolId
    }
    
    public func getAPIKey() -> String? {
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
