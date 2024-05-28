import Foundation

public protocol AmazonBaseErrorResponse: Codable {
    var errorCode: String { get }
    var errorMessage: String { get }
}
