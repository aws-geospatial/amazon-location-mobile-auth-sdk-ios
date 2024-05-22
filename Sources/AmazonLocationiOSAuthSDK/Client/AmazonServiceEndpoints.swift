public enum AmazonService: String {
    case Location = "geo"
}


public enum AmazonLocationEndpoint {
    case locationSearch(region: String, indexName: String)
    case locationTrackingUpload(region: String, trackerName: String)
    
    func url() -> String {
        switch self {
        case .locationSearch(let region, let indexName):
            return "https://places.geo.\(region).amazonaws.com/places/v0/indexes/\(indexName)/search/position"
        case .locationTrackingUpload(let region, let trackerName):
            return "https://tracker.geo.\(region).amazonaws.com/\(trackerName)"
        }
    }
}
