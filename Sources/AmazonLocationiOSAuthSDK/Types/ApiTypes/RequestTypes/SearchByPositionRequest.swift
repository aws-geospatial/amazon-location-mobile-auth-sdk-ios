import Foundation

public struct SearchByPositionRequest {
    public let position: [NSNumber]
    public let language: String
    public let maxResults: Int

    public init(position: [NSNumber], language: String = "en", maxResults: Int = 10) {
        self.position = position
        self.language = language
        self.maxResults = maxResults
    }
}
