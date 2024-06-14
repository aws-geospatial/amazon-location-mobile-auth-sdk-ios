import Foundation

public enum AmazonService: String {
    case Location = "geo"
}

public protocol AmazonLocationEndpoint {
    func url() -> String
    
    func isApiKeyEndpoint() -> Bool
}
