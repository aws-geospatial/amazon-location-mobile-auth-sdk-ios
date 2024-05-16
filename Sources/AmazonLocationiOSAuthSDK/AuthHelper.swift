import Foundation

public class AuthHelper {

    public init() {
    }
    
    public func authenticateWithCognitoIdentityPool(identityPoolId: String) async throws -> LocationCredentialsProvider? {
        let regionType = AmazonLocationEndpoint.toRegionType(identityPoolId: identityPoolId)
        return try? await authenticateWithCognitoIdentityPool(identityPoolId: identityPoolId, regionType: regionType!)
    }
    
    public func authenticateWithCognitoIdentityPool(identityPoolId: String, region: String) async throws -> LocationCredentialsProvider? {
        let regionType = AmazonLocationEndpoint.regionTypeByString(regionString: region)
        return try? await authenticateWithCognitoIdentityPool(identityPoolId: identityPoolId, regionType: regionType!)
    }
    
    private func authenticateWithCognitoIdentityPool(identityPoolId: String, regionType: AmazonLocationRegionType) async throws -> LocationCredentialsProvider? {
        let credentialProvider : LocationCredentialsProvider = LocationCredentialsProvider(regionType: regionType, identityPoolId: identityPoolId)
        guard let cognitoCredentials = try? await generateCognitoCredentials(identityPoolId: identityPoolId, region: regionType.rawValue) else {
            throw CognitoError.credentialsNotFound
        }
        credentialProvider.getCognitoProvider()?.setCognitoCredentials(cognitoCredentials: cognitoCredentials)
        return credentialProvider
    }

    private func generateCognitoCredentials(identityPoolId: String, region: String) async throws -> CognitoCredentials {
        guard let identityId = try await CognitoCredentialsProvider.getAWSIdentityId(identityPoolId: identityPoolId, region: region) else {
            throw CognitoError.identityIdNotFound
        }
        
        guard let response = try await CognitoCredentialsProvider.getAWSCredentials(identityId: identityId, region: region),
              let credentials = response["Credentials"] as? [String:Any],
              let accessKeyId = credentials["AccessKeyId"] as? String,
              let secretAccessKey = credentials["SecretKey"] as? String,
              let sessionToken = credentials["SessionToken"] as? String,
              let expirationInterval = credentials["Expiration"] as? NSNumber
        else {
            throw CognitoError.credentialsNotFound
        }
        
        let expiryDate = Date(timeIntervalSince1970: TimeInterval(truncating: expirationInterval))
        return CognitoCredentials(identityPoolId: identityPoolId, accessKeyId: accessKeyId, secretAccessKey: secretAccessKey, sessionToken: sessionToken, expiryDate: expiryDate)
    }

    public func authenticateWithApiKey(apiKey: String, region: String) -> LocationCredentialsProvider {
        let credentialProvider = LocationCredentialsProvider(region: region, apiKey: apiKey)
        credentialProvider.setAPIKey(apiKey: apiKey)
        credentialProvider.setRegion(region: region)
        return credentialProvider
    }
    
    public func getLocationClient() -> AmazonClient
    {
       return AmazonClient()
    }
}

enum CognitoError: Error {
    case identityIdNotFound
    case credentialsNotFound
}
