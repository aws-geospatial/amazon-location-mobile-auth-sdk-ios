import Foundation

public struct AmazonLocationResponse<T, E> {
    public let status: ResponseStatus
    public let data: T?
    public let error: E?
}
