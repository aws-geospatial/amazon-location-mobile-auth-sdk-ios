import Foundation

public struct SearchByPositionRequest: Codable, EncodableRequest {
    public let language: String
    public let maxResults: Int
    public let position: [Double]
    
    enum CodingKeys: String, CodingKey {
        case language = "Language"
        case maxResults = "MaxResults"
        case position = "Position"
    }

    public func toData() throws -> Data {
        let encoder = JSONEncoder()
        return try encoder.encode(self)
    }
}
