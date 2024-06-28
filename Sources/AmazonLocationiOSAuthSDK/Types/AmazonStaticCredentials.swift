
import Foundation

@objc public class AmazonStaticCredentials: NSObject {
    public let accessKeyId: String
    public let secretKey: String
    public let sessionToken: String?
    public let expiration: Date?
    
    public init(accessKeyId: String, secretKey: String, sessionToken: String?, expiration: Date?) {
        self.accessKeyId = accessKeyId
        self.secretKey = secretKey
        self.sessionToken = sessionToken
        self.expiration = expiration
    }
}
