import Foundation

public protocol EncodableRequest {
    func toData() throws -> Data
}
