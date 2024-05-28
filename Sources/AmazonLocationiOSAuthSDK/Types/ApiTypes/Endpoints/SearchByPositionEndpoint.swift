public struct SearchByPositionEndpoint: AmazonLocationEndpoint {
    
    public let region: String
    public let indexName: String
    public let apiKey: String?
    
    public init(region: String, indexName: String, apiKey: String? = nil) {
        self.region = region
        self.indexName = indexName
        self.apiKey = apiKey
    }
    
    public func url() -> String {
        let apiKeySuffix = apiKey != nil ? "?key=\(apiKey!)" : ""
        return "https://places.geo.\(region).amazonaws.com/places/v0/indexes/\(indexName)/search/position\(apiKeySuffix)"
    }
    
    public func isApiKeyEndpoint() -> Bool {
        return apiKey != nil
    }
}
