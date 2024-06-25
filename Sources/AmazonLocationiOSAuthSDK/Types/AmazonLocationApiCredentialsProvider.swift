import Foundation

@objc public class AmazonLocationApiCredentialsProvider: NSObject {
    internal var apiKey: String?
    internal var region: String?
    
    @objc public init(apiKey: String, region: String?) {
        self.apiKey = apiKey
        self.region = region
    }
}
