import Foundation
import AWSClientRuntime
import SmithyIdentityAPI
import SmithyHTTPAuthAPI
import SmithyHTTPAPI
import AWSSDKHTTPAuth

public class AWSSignerV4 {
    
    private let cognitoProvider: AmazonLocationCognitoCredentialsProvider
    
    public init(cognitoProvider: AmazonLocationCognitoCredentialsProvider)
    {
        self.cognitoProvider = cognitoProvider
    }
    
    public func signURL(url: URL, serviceName: String, expiration: TimeInterval) async throws -> URL? {
        try await cognitoProvider.refreshCognitoCredentialsIfExpired()
        if let credentials = cognitoProvider.getCognitoCredentials(), let region = cognitoProvider.region {
            let resolver:AWSClientRuntime.StaticAWSCredentialIdentityResolver? =  try StaticAWSCredentialIdentityResolver(AWSCredentialIdentity(accessKey: credentials.accessKeyId, secret: credentials.secretKey, expiration: credentials.expiration, sessionToken: credentials.sessionToken))
            
            var headers = Headers()
            headers.add(name: "host", value: self.hostname(from: url))
            let requestBuilder = SdkHttpRequestBuilder().withHost(url.host!).withPath(url.path)
                .withHeaders(headers)
            
            let signedURL = await AWSSigV4Signer.sigV4SignedURL(requestBuilder: requestBuilder, awsCredentialIdentityResolver: resolver!, signingName: serviceName, signingRegion: region, date: Date(), expiration: expiration, signingAlgorithm: SigningAlgorithm.sigv4)
            return signedURL
        }
        return nil
    }
    
    private func hostname(from url: URL) -> String {
        "\(url.host ?? "")\(self.port(from: url).map { ":\($0)" } ?? "")"
    }
    
    private func port(from url: URL) -> Int? {
        guard let port = url.port else { return nil }
        guard url.scheme != "http" || port != 80 else { return nil }
        guard url.scheme != "https" || port != 443 else { return nil }
        return port
    }
}

