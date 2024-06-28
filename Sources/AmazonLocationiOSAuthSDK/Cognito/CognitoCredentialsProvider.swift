import Foundation
import AWSCognitoIdentity

public class CognitoCredentialsProvider {
    private static var cognitoIdentityClient: CognitoIdentityClient?
    
    private static func getAWSIdentityId(identityPoolId: String, region: String) async throws -> GetIdOutput {
        do {
            if cognitoIdentityClient == nil {
                cognitoIdentityClient = try AWSCognitoIdentity.CognitoIdentityClient(region: region)
            }
            let idInput = GetIdInput(identityPoolId: identityPoolId)
            let identity = try await cognitoIdentityClient!.getId(input: idInput)
            return identity
        } catch {
            throw error
        }
    }
    
    private static func getAWSCredentials(identity: GetIdOutput, region: String) async throws -> GetCredentialsForIdentityOutput {
        do {
            if cognitoIdentityClient == nil {
                cognitoIdentityClient = try AWSCognitoIdentity.CognitoIdentityClient(region: region)
            }
            let credentialsInput = GetCredentialsForIdentityInput(identityId: identity.identityId)
            let credentials = try await cognitoIdentityClient!.getCredentialsForIdentity(input: credentialsInput)
            return credentials
            
        } catch {
            throw error
        }
    }
    
    static func generateCognitoCredentials(identityPoolId: String, region: String) async throws  -> AWSStaticCredentials?
    {
        let identity = try await getAWSIdentityId(identityPoolId: identityPoolId, region: region)
        
        if let credentialsOutput = try await getAWSCredentials(identity: identity, region: region).credentials, 
            let accessKeyId = credentialsOutput.accessKeyId, 
            let secretKey = credentialsOutput.secretKey,
            let sessionToken = credentialsOutput.sessionToken, 
            let expiration = credentialsOutput.expiration  {
            
            let cognitoCredentials = AWSStaticCredentials(identityPoolId: identityPoolId, accessKeyId: accessKeyId, secretKey: secretKey, sessionToken: sessionToken, expiration: expiration)
            return cognitoCredentials
        }
        return nil
    }
}
