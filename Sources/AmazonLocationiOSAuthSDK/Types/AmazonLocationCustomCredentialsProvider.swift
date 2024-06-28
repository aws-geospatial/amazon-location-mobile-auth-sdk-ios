import Foundation
import AwsCommonRuntimeKit

@objc public class AmazonLocationCustomCredentialsProvider: NSObject {
    public var credentialsProvider: CredentialsProvider? = nil
    public init(credentialsProvider: CredentialsProvider) {
        self.credentialsProvider = credentialsProvider
    }
}
