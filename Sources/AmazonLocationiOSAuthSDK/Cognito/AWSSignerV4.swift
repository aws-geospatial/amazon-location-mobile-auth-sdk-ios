// AWSSignerV4.swift

import CryptoKit
import struct Foundation.CharacterSet
import struct Foundation.Data
import struct Foundation.Date
import class Foundation.DateFormatter
import struct Foundation.Locale
import struct Foundation.TimeZone
import struct Foundation.URL
import struct Foundation.URLComponents

public enum HTTPMethod: String {
    case GET
    case POST
    case PUT
    case DELETE
}

public struct HTTPHeaders {
    private var headers: [String: String]

    public init() {
        headers = [:]
    }

    mutating func add(name: String, value: String) {
        headers[name] = value
    }

    mutating func remove(name: String) {
        headers.removeValue(forKey: name)
    }

    func value(forName name: String) -> String? {
        return headers[name]
    }

    func allHeaders() -> [String: String] {
        return headers
    }
}

public struct TimeAmount: Hashable {
    @available(*, deprecated, message: "This typealias doesn't serve any purpose. Please use Int64 directly.")
    public typealias Value = Int64

    /// The nanoseconds representation of the `TimeAmount`.
    public let nanoseconds: Int64

    /* private but */ @inlinable
    init(_ nanoseconds: Int64) {
        self.nanoseconds = nanoseconds
    }

    /// Creates a new `TimeAmount` for the given amount of nanoseconds.
    ///
    /// - parameters:
    ///     - amount: the amount of nanoseconds this `TimeAmount` represents.
    /// - returns: the `TimeAmount` for the given amount.
    @inlinable
    public static func nanoseconds(_ amount: Int64) -> TimeAmount {
        return TimeAmount(amount)
    }

    /// Creates a new `TimeAmount` for the given amount of microseconds.
    ///
    /// - parameters:
    ///     - amount: the amount of microseconds this `TimeAmount` represents.
    /// - returns: the `TimeAmount` for the given amount.
    ///
    /// - note: returns `TimeAmount(.max)` if the amount overflows when converted to nanoseconds and `TimeAmount(.min)` if it underflows.
    @inlinable
    public static func microseconds(_ amount: Int64) -> TimeAmount {
        return TimeAmount(_cappedNanoseconds(amount: amount, multiplier: 1000))
    }

    /// Creates a new `TimeAmount` for the given amount of milliseconds.
    ///
    /// - parameters:
    ///     - amount: the amount of milliseconds this `TimeAmount` represents.
    /// - returns: the `TimeAmount` for the given amount.
    ///
    /// - note: returns `TimeAmount(.max)` if the amount overflows when converted to nanoseconds and `TimeAmount(.min)` if it underflows.
    @inlinable
    public static func milliseconds(_ amount: Int64) -> TimeAmount {
        return TimeAmount(_cappedNanoseconds(amount: amount, multiplier: 1000 * 1000))
    }

    /// Creates a new `TimeAmount` for the given amount of seconds.
    ///
    /// - parameters:
    ///     - amount: the amount of seconds this `TimeAmount` represents.
    /// - returns: the `TimeAmount` for the given amount.
    ///
    /// - note: returns `TimeAmount(.max)` if the amount overflows when converted to nanoseconds and `TimeAmount(.min)` if it underflows.
    @inlinable
    public static func seconds(_ amount: Int64) -> TimeAmount {
        return TimeAmount(_cappedNanoseconds(amount: amount, multiplier: 1000 * 1000 * 1000))
    }

    /// Creates a new `TimeAmount` for the given amount of minutes.
    ///
    /// - parameters:
    ///     - amount: the amount of minutes this `TimeAmount` represents.
    /// - returns: the `TimeAmount` for the given amount.
    ///
    /// - note: returns `TimeAmount(.max)` if the amount overflows when converted to nanoseconds and `TimeAmount(.min)` if it underflows.
    @inlinable
    public static func minutes(_ amount: Int64) -> TimeAmount {
        return TimeAmount(_cappedNanoseconds(amount: amount, multiplier: 1000 * 1000 * 1000 * 60))
    }

    /// Creates a new `TimeAmount` for the given amount of hours.
    ///
    /// - parameters:
    ///     - amount: the amount of hours this `TimeAmount` represents.
    /// - returns: the `TimeAmount` for the given amount.
    ///
    /// - note: returns `TimeAmount(.max)` if the amount overflows when converted to nanoseconds and `TimeAmount(.min)` if it underflows.
    @inlinable
    public static func hours(_ amount: Int64) -> TimeAmount {
        return TimeAmount(_cappedNanoseconds(amount: amount, multiplier: 1000 * 1000 * 1000 * 60 * 60))
    }
    
    /// Converts `amount` to nanoseconds multiplying it by `multiplier`. The return value is capped to `Int64.max` if the multiplication overflows and `Int64.min` if it underflows.
    ///
    ///  - parameters:
    ///     - amount: the amount to be converted to nanoseconds.
    ///     - multiplier: the multiplier that converts the given amount to nanoseconds.
    ///  - returns: the amount converted to nanoseconds within [Int64.min, Int64.max].
    @inlinable
    static func _cappedNanoseconds(amount: Int64, multiplier: Int64) -> Int64 {
        let nanosecondsMultiplication = amount.multipliedReportingOverflow(by: multiplier)
        if nanosecondsMultiplication.overflow {
            return amount >= 0 ? .max : .min
        } else {
            return nanosecondsMultiplication.partialValue
        }
    }
}

/// Amazon request V4 Signer (This signer is for external aws signing such as Maps cognito signing)
public struct AWSSignerV4 {
    /// Security credentials for accessing AWS services
    public let credentials: AmazonStaticCredentials
    /// Service signing name. In general this is the same as the service name
    public let serviceName: String
    /// AWS region you are working in
    public let region: String

    static let hashedEmptyBody = SHA256.hash(data: [UInt8]()).hexDigest()

    private static let timeStampDateFormatter: DateFormatter = createTimeStampDateFormatter()

    /// Initialise the Signer class with AWS credentials
    public init(credentials: AmazonStaticCredentials, serviceName: String, region: String) {
        self.credentials = credentials
        self.serviceName = serviceName
        self.region = region
    }
    
    public init(amazonLocationCognitoCredentialsProvider: AmazonLocationCognitoCredentialsProvider, serviceName: String) {
        let cognitoCredentials = amazonLocationCognitoCredentialsProvider.getCognitoCredentials()!
        self.credentials = AmazonStaticCredentials(accessKeyId: cognitoCredentials.accessKeyId, secretKey: cognitoCredentials.secretKey, sessionToken: cognitoCredentials.sessionToken, expiration: cognitoCredentials.expiration)
        self.serviceName = serviceName
        self.region = amazonLocationCognitoCredentialsProvider.region!
    }

    /// Enum for holding request payload
    public enum BodyData {
        /// String
        case string(String)
        /// Data
        case data(Data)
        /// Don't use body when signing request
        case unsignedPayload
        /// Internally used when S3 streamed payloads
        case s3chunked
    }


    
    /// Process URL before signing
    ///
    /// `signURL` and `signHeaders` make assumptions about the URLs they are provided, this function cleans up a URL so it is ready
    /// to be signed by either of these functions. It sorts the query params and ensures they are properly percent encoded
    public func processURL(url: URL) -> URL? {
        guard var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false) else { return nil }
        let urlQueryString = urlComponents.queryItems?
            .sorted {
                if $0.name < $1.name { return true }
                if $0.name > $1.name { return false }
                guard let value1 = $0.value, let value2 = $1.value else { return false }
                return value1 < value2
            }
            .map { item in item.value.map { "\(item.name)=\($0.uriEncode())" } ?? "\(item.name)=" }
            .joined(separator: "&")
        urlComponents.percentEncodedQuery = urlQueryString
        // S3 requires "+" encoded in the URL
        if self.serviceName == "s3" {
            urlComponents.percentEncodedPath = urlComponents.path.s3PathEncode()
        }
        return urlComponents.url
    }

    /// Generate signed headers, for a HTTP request
    /// - Parameters:
    ///   - url: Request URL
    ///   - method: Request HTTP method
    ///   - headers: Request headers
    ///   - body: Request body
    ///   - omitSecurityToken: Should we include security token in the query parameters
    ///   - date: Date that URL is valid from, defaults to now
    /// - Returns: Request headers with added "authorization" header that contains request signature
    public func signHeaders(
        url: URL,
        method: HTTPMethod = .GET,
        headers: HTTPHeaders = HTTPHeaders(),
        body: BodyData? = nil,
        omitSecurityToken: Bool = false,
        date: Date = Date()
    ) -> HTTPHeaders {
        let bodyHash = AWSSignerV4.hashedPayload(body)
        let dateString = AWSSignerV4.timestamp(date)
        var headers = headers
        // add date, host, sha256 and if available security token headers
        headers.add(name: "host", value: Self.hostname(from: url))
        headers.add(name: "x-amz-date", value: dateString)
        headers.add(name: "x-amz-content-sha256", value: bodyHash)
        if !omitSecurityToken, let sessionToken = credentials.sessionToken {
            headers.add(name: "x-amz-security-token", value: sessionToken)
        }
        // construct signing data. Do this after adding the headers as it uses data from the headers
        let signingData = AWSSignerV4.SigningData(url: url, method: method, headers: headers, body: body, bodyHash: bodyHash, date: dateString, signer: self)

        // construct authorization string
        let authorization = "AWS4-HMAC-SHA256 " +
            "Credential=\(credentials.accessKeyId)/\(signingData.date)/\(self.region)/\(self.serviceName)/aws4_request," +
            "SignedHeaders=\(signingData.signedHeaders)," +
            "Signature=\(self.signature(signingData: signingData))"

        // add Authorization header
        headers.add(name: "authorization", value: authorization)
        // now we have signed the request we can add the security token if required
        if omitSecurityToken, let sessionToken = credentials.sessionToken {
            headers.add(name: "x-amz-security-token", value: sessionToken)
        }

        return headers
    }

    /// Generate a signed URL, for a HTTP request
    /// - Parameters:
    ///   - url: Request URL
    ///   - method: Request HTTP method
    ///   - headers: Request headers
    ///   - body: Request body
    ///   - expires: How long before the signed URL expires
    ///   - omitSecurityToken: Should we include security token in the query parameters
    ///   - date: Date that URL is valid from, defaults to now
    /// - Returns: Signed URL
    public func signURL(
        url: URL,
        method: HTTPMethod = .GET,
        headers: HTTPHeaders = HTTPHeaders(),
        body: BodyData? = nil,
        expires: TimeAmount,
        omitSecurityToken: Bool = false,
        date: Date = Date()
    ) -> URL {
        var headers = headers
        headers.add(name: "host", value: Self.hostname(from: url))
        // Create signing data
        var signingData = AWSSignerV4.SigningData(url: url, method: method, headers: headers, body: body, date: AWSSignerV4.timestamp(date), signer: self)
        // Construct query string. Start with original query strings and append all the signing info.
        var query = url.query ?? ""
        if query.count > 0 {
            query += "&"
        }
        query += "X-Amz-Algorithm=AWS4-HMAC-SHA256"
        query += "&X-Amz-Credential=\(self.credentials.accessKeyId)/\(signingData.date)/\(self.region)/\(self.serviceName)/aws4_request"
        query += "&X-Amz-Date=\(signingData.datetime)"
        query += "&X-Amz-Expires=\(expires.nanoseconds / 1_000_000_000)"
        query += "&X-Amz-SignedHeaders=\(signingData.signedHeaders)"
        if !omitSecurityToken, let sessionToken = credentials.sessionToken {
            query += "&X-Amz-Security-Token=\(sessionToken.uriEncode())"
        }
        // Split the string and sort to ensure the order of query strings is the same as AWS
        query = query.split(separator: "&")
            .sorted()
            .joined(separator: "&")
            .queryEncode()

        // update unsignedURL in the signingData so when the canonical request is constructed it includes all the signing query items
        signingData.unsignedURL = URL(string: url.absoluteString.split(separator: "?")[0] + "?" + query)! // NEED TO DEAL WITH SITUATION WHERE THIS FAILS
        query += "&X-Amz-Signature=\(self.signature(signingData: signingData))"
        if omitSecurityToken, let sessionToken = credentials.sessionToken {
            query += "&X-Amz-Security-Token=\(sessionToken.uriEncode())"
        }

        // Add signature to query items and build a new Request
        let signedURL = URL(string: url.absoluteString.split(separator: "?")[0] + "?" + query)!

        return signedURL
    }

    /// Temporary structure passed from calls to `startSigningChunks` and
    /// subsequent calls to `signChunk`
    public struct ChunkedSigningData {
        /// signature for streamed data
        public let signature: String
        let datetime: String
        let signingKey: SymmetricKey
    }

    /// Start the process of signing a s3 chunked upload.
    ///
    /// Update headers and generate first signature. See https://docs.aws.amazon.com/AmazonS3/latest/API/sigv4-streaming.html
    /// for more details
    /// - Parameters:
    ///   - url: url
    ///   - method: http method
    ///   - headers: original headers
    ///   - date: date to use for signing
    /// - Returns: Tuple of updated headers and signing data to use in first call to `signChunk`
    public func startSigningChunks(url: URL, method: HTTPMethod = .GET, headers: HTTPHeaders = HTTPHeaders(), date: Date = Date()) -> (headers: HTTPHeaders, signingData: ChunkedSigningData) {
        let bodyHash = AWSSignerV4.hashedPayload(.s3chunked)
        let dateString = AWSSignerV4.timestamp(date)
        var headers = headers
        // add date, host, sha256 and if available security token headers
        headers.add(name: "host", value: Self.hostname(from: url))
        headers.add(name: "x-amz-date", value: dateString)
        headers.add(name: "x-amz-content-sha256", value: bodyHash)
        if let sessionToken = credentials.sessionToken {
            headers.add(name: "x-amz-security-token", value: sessionToken)
        }
        // remove content-length header
        headers.remove(name: "content-length")

        // construct signing data. Do this after adding the headers as it uses data from the headers
        let signingData = AWSSignerV4.SigningData(url: url, method: method, headers: headers, bodyHash: bodyHash, date: dateString, signer: self)
        let signingKey = self.signingKey(date: signingData.date)
        let signature = self.signature(signingData: signingData)
        let chunkedSigningData = ChunkedSigningData(signature: signature, datetime: signingData.datetime, signingKey: signingKey)

        // construct authorization string
        let authorization = "AWS4-HMAC-SHA256 " +
            "Credential=\(credentials.accessKeyId)/\(signingData.date)/\(self.region)/\(self.serviceName)/aws4_request," +
            "SignedHeaders=\(signingData.signedHeaders)," +
            "Signature=\(signature)"

        // add Authorization header
        headers.add(name: "authorization", value: authorization)

        return (headers: headers, signingData: chunkedSigningData)
    }

    /// Generate the signature for a chunk in a s3 chunked upload
    /// - Parameters:
    ///   - body: Body of chunk
    ///   - signingData: Signing data returned from previous `signChunk` or `startSigningChunk` if this is the first call
    /// - Returns: signing data that includes the signature and other data that is required for signing the next chunk
    public func signChunk(body: BodyData, signingData: ChunkedSigningData) -> ChunkedSigningData {
        let stringToSign = self.chunkStringToSign(body: body, previousSignature: signingData.signature, datetime: signingData.datetime)
        let signature = HMAC<SHA256>.authenticationCode(for: [UInt8](stringToSign.utf8), using: signingData.signingKey).hexDigest()
        return ChunkedSigningData(signature: signature, datetime: signingData.datetime, signingKey: signingData.signingKey)
    }

    /// structure used to store data used throughout the signing process
    struct SigningData {
        let url: URL
        let method: HTTPMethod
        let hashedPayload: String
        let datetime: String
        let headersToSign: [String: String]
        let signedHeaders: String
        var unsignedURL: URL

        var date: String { return String(self.datetime.prefix(8)) }

        init(url: URL, method: HTTPMethod = .GET, headers: HTTPHeaders = HTTPHeaders(), body: BodyData? = nil, bodyHash: String? = nil, date: String, signer: AWSSignerV4) {
            self.url = url
            self.method = method
            self.datetime = date
            self.unsignedURL = self.url

            if let hash = bodyHash {
                self.hashedPayload = hash
            } else if signer.serviceName == "s3" {
                self.hashedPayload = "UNSIGNED-PAYLOAD"
            } else {
                self.hashedPayload = AWSSignerV4.hashedPayload(body)
            }

            // from S3 V4 signed documentation
            // The CanonicalHeaders list must include the following:
            // - HTTP host header.
            // If the Content-Type header is present in the request, you must add it to the CanonicalHeaders list.
            // Any x-amz-* headers that you plan to include in your request must also be added. For example, if
            // you are using temporary security credentials, you need to include x-amz-security-token in your request.
            // You must add this header in the list of CanonicalHeaders.
            let headersNotToSign: Set<String> = [
                "authorization",
                "content-length",
                "expect",
                "user-agent",
            ]
            var headersToSign: [String: String] = [:]
            var signedHeadersArray: [String] = []
            for header in headers.allHeaders() {
                let lowercasedHeaderName = header.key.lowercased()
                if headersNotToSign.contains(lowercasedHeaderName) {
                    continue
                }
                headersToSign[lowercasedHeaderName] = header.value
                signedHeadersArray.append(lowercasedHeaderName)
            }
            self.headersToSign = headersToSign
            self.signedHeaders = signedHeadersArray.sorted().joined(separator: ";")
        }
    }

    // Stage 3 Calculating signature as in https://docs.aws.amazon.com/general/latest/gr/sigv4-calculate-signature.html
    func signature(signingData: SigningData) -> String {
        let signingKey = self.signingKey(date: signingData.date)
        let kSignature = HMAC<SHA256>.authenticationCode(for: [UInt8](self.stringToSign(signingData: signingData).utf8), using: signingKey)
        return kSignature.hexDigest()
    }

    /// Stage 2 Create the string to sign as in https://docs.aws.amazon.com/general/latest/gr/sigv4-create-string-to-sign.html
    func stringToSign(signingData: SigningData) -> String {
        let stringToSign = "AWS4-HMAC-SHA256\n" +
            "\(signingData.datetime)\n" +
            "\(signingData.date)/\(self.region)/\(self.serviceName)/aws4_request\n" +
            SHA256.hash(data: [UInt8](self.canonicalRequest(signingData: signingData).utf8)).hexDigest()
        return stringToSign
    }

    /// Stage 1 Create the canonical request as in https://docs.aws.amazon.com/general/latest/gr/sigv4-create-canonical-request.html
    func canonicalRequest(signingData: SigningData) -> String {
        let canonicalHeaders = signingData.headersToSign
            .map { (key: $0.key.lowercased(), value: $0.value) }
            .sorted { $0.key < $1.key }
            .map { return "\($0.key):\($0.value.trimmingCharacters(in: CharacterSet.whitespaces).removeSequentialWhitespace())" }
            .joined(separator: "\n")
        let canonicalPath: String
        let urlComps = URLComponents(url: signingData.unsignedURL, resolvingAgainstBaseURL: false)!
        if self.serviceName == "s3" {
            canonicalPath = urlComps.path.uriEncodeWithSlash()
        } else {
            // non S3 paths need to be encoded twice
            canonicalPath = urlComps.percentEncodedPath.uriEncodeWithSlash()
        }
        let canonicalRequest = "\(signingData.method.rawValue)\n" +
            "\(canonicalPath)\n" +
            "\(signingData.unsignedURL.query ?? "")\n" + // assuming query parameters have are already percent encoded correctly
            "\(canonicalHeaders)\n\n" +
            "\(signingData.signedHeaders)\n" +
            signingData.hashedPayload
        return canonicalRequest
    }

    /// get signing key
    func signingKey(date: String) -> SymmetricKey {
        let kDate = HMAC<SHA256>.authenticationCode(for: [UInt8](date.utf8), using: SymmetricKey(data: Array("AWS4\(self.credentials.secretKey)".utf8)))
        let kRegion = HMAC<SHA256>.authenticationCode(for: [UInt8](self.region.utf8), using: SymmetricKey(data: kDate))
        let kService = HMAC<SHA256>.authenticationCode(for: [UInt8](self.serviceName.utf8), using: SymmetricKey(data: kRegion))
        let kSigning = HMAC<SHA256>.authenticationCode(for: [UInt8]("aws4_request".utf8), using: SymmetricKey(data: kService))
        return SymmetricKey(data: kSigning)
    }

    /// chunked upload string to sign
    func chunkStringToSign(body: BodyData, previousSignature: String, datetime: String) -> String {
        let date = String(datetime.prefix(8))
        let stringToSign = "AWS4-HMAC-SHA256-PAYLOAD\n" +
            "\(datetime)\n" +
            "\(date)/\(region)/\(serviceName)/aws4_request\n" +
            "\(previousSignature)\n" +
            "\(Self.hashedEmptyBody)\n" +
            Self.hashedPayload(body)
        return stringToSign
    }

    /// Create a SHA256 hash of the Requests body
    static func hashedPayload(_ payload: BodyData?) -> String {
        guard let payload else { return self.hashedEmptyBody }
        let hash: String?
        switch payload {
        case .string(let string):
            hash = SHA256.hash(data: [UInt8](string.utf8)).hexDigest()
        case .data(let data):
            hash = SHA256.hash(data: data).hexDigest()
        case .unsignedPayload:
            return "UNSIGNED-PAYLOAD"
        case .s3chunked:
            return "STREAMING-AWS4-HMAC-SHA256-PAYLOAD"
        }
        if let hash {
            return hash
        } else {
            return self.hashedEmptyBody
        }
    }

    /// create timestamp dateformatter
    private static func createTimeStampDateFormatter() -> DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd'T'HHmmss'Z'"
        formatter.timeZone = TimeZone(abbreviation: "UTC")
        formatter.locale = Locale(identifier: "en_US_POSIX")
        return formatter
    }

    /// return a timestamp formatted for signing requests
    static func timestamp(_ date: Date) -> String {
        return self.timeStampDateFormatter.string(from: date)
    }

    /// returns port from URL. If port is set to 80 on an http url or 443 on an https url nil is returned
    private static func port(from url: URL) -> Int? {
        guard let port = url.port else { return nil }
        guard url.scheme != "http" || port != 80 else { return nil }
        guard url.scheme != "https" || port != 443 else { return nil }
        return port
    }

    private static func hostname(from url: URL) -> String {
        "\(url.host ?? "")\(self.port(from: url).map { ":\($0)" } ?? "")"
    }
}

@_spi(AmazonLocationiOSAuthSDKInternal)
extension String {
    func queryEncode() -> String {
        return addingPercentEncoding(withAllowedCharacters: String.queryAllowedCharacters) ?? self
    }

    func s3PathEncode() -> String {
        return addingPercentEncoding(withAllowedCharacters: String.s3PathAllowedCharacters) ?? self
    }

    func uriEncode() -> String {
        return addingPercentEncoding(withAllowedCharacters: String.uriAllowedCharacters) ?? self
    }

    func uriEncodeWithSlash() -> String {
        return addingPercentEncoding(withAllowedCharacters: String.uriAllowedWithSlashCharacters) ?? self
    }

    static let s3PathAllowedCharacters = CharacterSet.urlPathAllowed.subtracting(.init(charactersIn: "+@()&$=:,'!*"))
    static let uriAllowedWithSlashCharacters = CharacterSet(charactersIn: "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-._~/")
    static let uriAllowedCharacters = CharacterSet(charactersIn: "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-._~")
    static let queryAllowedCharacters = CharacterSet(charactersIn: "/;+").inverted
}

@_spi(AmazonLocationiOSAuthSDKInternal)
public extension Sequence<UInt8> {
    /// return a hexEncoded string buffer from an array of bytes
    func hexDigest() -> String {
        return self.map { String(format: "%02x", $0) }.joined(separator: "")
    }
}

@_spi(AmazonLocationiOSAuthSDKInternal)
public extension URL {
    /// return URL path, but do not remove the slash at the end if it exists.
    ///
    /// There doesn't seem to be anyway to do this without parsing the path myself
    /// If I could guarantee macOS 10.11 then I could use `hasDirectoryPath`.
    var pathWithSlash: String {
        let relativeString = self.relativeString
        let doesPathEndInSlash: Bool
        // does path end in "/"
        if let questionMark = relativeString.firstIndex(of: "?") {
            let prevCharacter = relativeString.index(before: questionMark)
            doesPathEndInSlash = (relativeString[prevCharacter] == "/")
        } else if let hashCharacter = relativeString.firstIndex(of: "#") {
            let prevCharacter = relativeString.index(before: hashCharacter)
            doesPathEndInSlash = (relativeString[prevCharacter] == "/")
        } else {
            let prevCharacter = relativeString.index(before: relativeString.endIndex)
            doesPathEndInSlash = (relativeString[prevCharacter] == "/")
        }
        var path = self.path
        if doesPathEndInSlash, path != "/" {
            path += "/"
        }
        return path
    }
}

@_spi(AmazonLocationiOSAuthSDKInternal)
private extension String {
    func removeSequentialWhitespace() -> String {
        return reduce(into: "") { result, character in
            if result.last?.isWhitespace != true || character.isWhitespace == false {
                result.append(character)
            }
        }
    }
}
