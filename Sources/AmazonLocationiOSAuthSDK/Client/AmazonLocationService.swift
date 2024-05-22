//public protocol AmazonLocationService: Sendable {
//    /// Client used to communicate with AWS
//    var client: AmazonLocationClient { get }
//    /// Service context details
//    var config: AmazonLocationServiceConfig { get }
//    /// Create new version of service with patch
//    ///
//    /// This is required to support ``with(region:middlewares:timeout:byteBufferAllocator:options:)``.
//    /// Standard implementation is as follows
//    /// ```swift
//    /// public init(from: MyService, patch: AWSServiceConfig.Patch) {
//    ///     self.client = from.client
//    ///     self.config = from.config.with(patch: patch)
//    /// }
//    /// ```
//    init(from: Self, patch: AmazonLocationServiceConfig.Patch)
//}
//
//extension AmazonLocationService {
//    /// Region where service is running
//    public var region: Region { return config.region }
//    /// The url to use in requests
//    public var endpoint: String { return config.endpoint }
//
//    /// Return new version of Service with edited parameters
//    /// - Parameters:
//    ///   - region: Server region
//    ///   - middlewares: Additional middleware to add
//    ///   - timeout: Time out value for HTTP requests
//    ///   - byteBufferAllocator: byte buffer allocator used throughout AWSClient
//    ///   - options: options used by client when processing requests
//    /// - Returns: New version of the service
//    public func with(
//        region: Region? = nil,
//        middleware: AWSMiddlewareProtocol? = nil,
//        timeout: TimeAmount? = nil,
//        byteBufferAllocator: ByteBufferAllocator? = nil,
//        options: AWSServiceConfig.Options? = nil
//    ) -> Self {
//        return Self(from: self, patch: .init(
//            region: region,
//            middleware: middleware,
//            timeout: timeout,
//            byteBufferAllocator: byteBufferAllocator,
//            options: options
//        ))
//    }
//
//    /// Generate a signed URL
//    /// - parameters:
//    ///     - url : URL to sign
//    ///     - httpMethod: HTTP method to use (.GET, .PUT, .PUSH etc)
//    ///     - headers: Headers that are to be used with this URL. Be sure to include these headers when you used the returned URL
//    ///     - expires: How long before the signed URL expires
//    ///     - logger: Logger to output to
//    /// - returns:
//    ///     A signed URL
//    public func signURL(
//        url: URL,
//        httpMethod: HTTPMethod,
//        headers: HTTPHeaders = HTTPHeaders(),
//        expires: TimeAmount,
//        logger: Logger = AWSClient.loggingDisabled
//    ) async throws -> URL {
//        return try await self.client.signURL(url: url, httpMethod: httpMethod, headers: headers, expires: expires, serviceConfig: self.config, logger: logger)
//    }
//
//    /// Generate signed headers
//    /// - parameters:
//    ///     - url : URL to sign
//    ///     - httpMethod: HTTP method to use (.GET, .PUT, .PUSH etc)
//    ///     - headers: Headers that are to be used with this URL. Be sure to include these headers when you used the returned URL
//    ///     - body: body payload to sign as well. While it is unnecessary to provide the body for S3 other services require it
//    ///     - logger: Logger to output to
//    /// - returns:
//    ///     A series of signed headers including the original headers provided to the function
//    public func signHeaders(
//        url: URL,
//        httpMethod: HTTPMethod,
//        headers: HTTPHeaders = HTTPHeaders(),
//        body: AWSHTTPBody = .init(),
//        logger: Logger = AWSClient.loggingDisabled
//    ) async throws -> HTTPHeaders {
//        return try await self.client.signHeaders(url: url, httpMethod: httpMethod, headers: headers, body: body, serviceConfig: self.config, logger: logger)
//    }
//}
