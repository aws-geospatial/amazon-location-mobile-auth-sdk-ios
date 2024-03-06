import AWSCore
import AWSMobileClientXCF

public class AuthHelper {
    public init() {
    }
    
    public func authenticateWithCognitoUserPool(identityPoolId: String, region: String) -> LocationCredentialsProvider {
        let regionType = AWSEndpoint.regionTypeByString(regionString: region)
        let credentialProvider : LocationCredentialsProvider = LocationCredentialsProvider(regionType: regionType!, identityPoolId: identityPoolId)
        
        let configuration = AWSServiceConfiguration(
            region: regionType!,
            credentialsProvider: credentialProvider.getCognitoProvider()
        )
        
        AWSServiceManager.default().defaultServiceConfiguration = configuration
        return credentialProvider
    }
    
    public func authenticateWithCognitoUserPool(identityPoolId: String) -> LocationCredentialsProvider {
        let regionType = toRegionType(identityPoolId: identityPoolId)
        
        let credentialProvider : LocationCredentialsProvider = LocationCredentialsProvider(regionType: regionType!, identityPoolId: identityPoolId)
        
        let configuration = AWSServiceConfiguration(
            region: regionType!,
            credentialsProvider: credentialProvider.getCognitoProvider()
        )
        
        AWSServiceManager.default().defaultServiceConfiguration = configuration
        return credentialProvider
    }
    
    public func authenticateWithAPIKey(apiKey: String, region: String) -> LocationCredentialsProvider {
        let credentialProvider = LocationCredentialsProvider(region: region, apiKey: apiKey)
        credentialProvider.setAPIKey(apiKey: apiKey)
        credentialProvider.setRegion(region: region)
        return credentialProvider
    }
    
    public func authenticateWithCognitoUserPool(identityPoolId: String, userPoolId: String, clientId: String, clientSecret: String?) ->  LocationCredentialsProvider {
        let regionType = toRegionType(identityPoolId: identityPoolId)
        let credentialProvider : LocationCredentialsProvider = LocationCredentialsProvider(regionType: regionType!, identityPoolId: identityPoolId)

        
        let configuration = AWSServiceConfiguration(
            region: regionType!,
            credentialsProvider: credentialProvider.getCognitoProvider()
        )
        let userPoolConfiguration = AWSCognitoIdentityUserPoolConfiguration(clientId: clientId, clientSecret: clientSecret, poolId: userPoolId)
        
        AWSCognitoIdentityUserPool.register(with: configuration, userPoolConfiguration: userPoolConfiguration, forKey: "UserPool")
        AWSServiceManager.default().defaultServiceConfiguration = configuration
        
        configureAWSMobileClient(identityPoolId: identityPoolId, userPoolId: userPoolId, clientId: clientId, clientSecret: clientSecret)
        
        return credentialProvider
    }

    func configureAWSMobileClient(identityPoolId: String, userPoolId: String, clientId: String, clientSecret: String?) {
        let region = toRegionString(identityPoolId: identityPoolId)

        
        var cognitoUserPoolDict: [String: Any] = [
            "PoolId": userPoolId,
            "AppClientId": clientId,
            "Region": region
        ]
        
        if let clientSecret = clientSecret {
            cognitoUserPoolDict["AppClientSecret"] = clientSecret
        }
        
        let configuration: [String: Any] = [
            "IdentityManager": [
                "Default": [:]
            ],
            "CredentialsProvider": [
                "CognitoIdentity": [
                    "Default": [
                        "PoolId": identityPoolId,
                        "Region": region
                    ]
                ]
            ],
            "CognitoUserPool": [
                "Default": cognitoUserPoolDict
            ]
        ]
        
        AWSInfo.configureDefaultAWSInfo(configuration)
        
        AWSMobileClient.default().initialize {(userState, error) in
            print("AWS login?: \(AWSMobileClient.default().isSignedIn)")
            
            if let userState = userState {
                switch userState {
                case .signedIn:
                    print("Logged In")
                    AWSMobileClient.default().getTokens {tokens, error in
                        print("tokens: \(String(describing: tokens))")
                    }
                default:
                    print("none")
                }
            } else if let error = error {
                print(error.localizedDescription)
                return
            }
        }
    }
    
    public func signIn(username: String, password: String, completion: @escaping (AWSMobileClientXCF.SignInResult?, NSError?) -> Void) {

        AWSMobileClient.default().signIn(username: username, password: password) { (signInResult, error) in
                if let error = error {
                    completion(nil, NSError(domain: "AuthDomain", code: AWSCognitoIdentityProviderErrorType.invalidParameter.rawValue, userInfo: [NSLocalizedDescriptionKey: "\((error as! AWSMobileClientError).message)"]))
                } else if let signInResult = signInResult {
                    switch (signInResult.signInState) {
                    case .signedIn:
                        completion(signInResult, nil)
                    case .newPasswordRequired:
                        completion(nil, NSError(domain: "AuthDomain", code: AWSCognitoIdentityProviderErrorType.passwordResetRequired.rawValue, userInfo: [NSLocalizedDescriptionKey: "Sign In Failed with state: \(signInResult.signInState)"]))
                                   // Optionally, redirect the user to your new password UI here
                    default:
                        completion(nil, NSError(domain: "AuthDomain", code: -1001, userInfo: [NSLocalizedDescriptionKey: "Sign In Failed with state: \(signInResult.signInState)"]))
                    }
                }
        }
    }
    
    public func signOut(completion: @escaping (Error?) -> Void) {
        AWSMobileClient.default().signOut(completionHandler: completion)
    }
    
    public func confirmSignin(newPassword: String, completion: @escaping (AWSMobileClientXCF.SignInResult?, NSError?) -> Void) {
        let additionalAttributes: [String: String] = [:]
        
        AWSMobileClient.default().confirmSignIn(challengeResponse: newPassword, userAttributes: additionalAttributes) { (confirmSignInResult, error) in
            DispatchQueue.main.async {
                if let error = error {
                    completion(nil, error as NSError)
                } else if let confirmSignInResult = confirmSignInResult {
                    switch confirmSignInResult.signInState {
                    case .signedIn:
                        completion(confirmSignInResult, nil)
                    default:
                        completion(nil, NSError(domain: "AuthDomain", code: -1004, userInfo: [NSLocalizedDescriptionKey: "Failed to set new password with state: \(confirmSignInResult.signInState)"]))
                    }
                }
            }
        }
    }
    
    private func toRegionType(identityPoolId: String) -> AWSRegionType? {
        var region: AWSRegionType?
    
        if let stringRegion = identityPoolId.components(separatedBy: ":").first {
            
            if let extractedRegion = AWSEndpoint.regionTypeByString(regionString: stringRegion) {
                region = extractedRegion
            } else {
                print("Invalid region: \(stringRegion)")
            }
        }
        return region
    }
    
    private func toRegionString(identityPoolId: String) -> String {
        return identityPoolId.components(separatedBy: ":").first ?? identityPoolId
    }
}

