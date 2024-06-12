import Foundation
import AWSClientRuntime
import SmithyIdentityAPI
import SmithyHTTPAuthAPI
import SmithyHTTPAPI
import AWSSDKHTTPAuth

public class AWSignerV4 {
    
    private let cognitoProvider: AmazonLocationCognitoCredentialsProvider
    
    public init(cognitoProvider: AmazonLocationCognitoCredentialsProvider)
    {
        self.cognitoProvider = cognitoProvider
    }
    
    public func signURL(cognitoProvider: AmazonLocationCognitoCredentialsProvider, url: URL, serviceName: String, expiration: TimeInterval) async throws -> URL? {
        try await cognitoProvider.refreshCognitoCredentialsIfExpired()
        if let credentials = cognitoProvider.getCognitoCredentials(), let region = cognitoProvider.region {
            let resolver:AWSClientRuntime.StaticAWSCredentialIdentityResolver? =  try StaticAWSCredentialIdentityResolver(AWSCredentialIdentity(accessKey: credentials.accessKeyId, secret: credentials.secretKey, expiration: credentials.expiration, sessionToken: credentials.sessionToken))
            
            let requestBuilder = SdkHttpRequestBuilder().withPath(url.absoluteString)
            let signedURL = await AWSSigV4Signer.sigV4SignedURL(requestBuilder: requestBuilder, awsCredentialIdentityResolver: resolver!, signingName: serviceName, signingRegion: region, date: Date(), expiration: expiration, signingAlgorithm: SigningAlgorithm.sigv4)
            return signedURL
        }
        return nil
    }
}

