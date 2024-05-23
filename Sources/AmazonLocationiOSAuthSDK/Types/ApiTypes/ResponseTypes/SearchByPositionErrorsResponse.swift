import Foundation

public struct SearchByPositionErrorsResponse: AmazonErrorResponse, Error {
    public let error: ErrorInfo
    
    enum CodingKeys: String, CodingKey {
        case error = "Error"
    }
    
    public var errorCode: String {
        return error.code
    }
    
    public var errorMessage: String {
        return error.message
    }
    
    public struct ErrorInfo: Codable {
        public let code: String
        public let message: String
        
        enum CodingKeys: String, CodingKey {
            case code = "Code"
            case message = "Message"
        }
    }
}
