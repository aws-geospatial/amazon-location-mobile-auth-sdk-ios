public struct SearchByPositionEndpoint: AmazonLocationEndpoint {
    public let region: String
    public let indexName: String
    
    public init(region: String, indexName: String) {
        self.region = region
        self.indexName = indexName
    }
    
    public func url() -> String {
        return "https://places.geo.\(region).amazonaws.com/places/v0/indexes/\(indexName)/search/position"
    }
}
