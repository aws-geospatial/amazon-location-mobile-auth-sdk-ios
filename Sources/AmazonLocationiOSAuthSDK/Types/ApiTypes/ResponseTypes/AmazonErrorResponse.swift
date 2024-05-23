import Foundation

public protocol AmazonErrorResponse: Codable {
    var errorCode: String { get }
    var errorMessage: String { get }
}
