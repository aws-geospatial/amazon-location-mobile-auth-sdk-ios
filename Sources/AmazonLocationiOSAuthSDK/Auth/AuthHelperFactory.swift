/// Implementation of `AuthHelperFactoryProtocol` that delegates to the real `AuthHelper` static methods.
///
/// Used in production code, but replaced with a mock factory in unit testing.
class AuthHelperFactory: AuthHelperFactoryProtocol {
    func makeWithApiKey(apiKey: String, region: String) async throws -> AuthHelperProtocol {
        return try await AuthHelper.withApiKey(apiKey: apiKey, region: region)
    }
    
    func makeWithIdentityPoolId(identityPoolId: String) async throws -> AuthHelperProtocol {
        return try await AuthHelper.withIdentityPoolId(identityPoolId: identityPoolId)
    }
    
    func makeWithIdentityPoolId(identityPoolId: String, region: String) async throws -> AuthHelperProtocol {
        return try await AuthHelper.withIdentityPoolId(identityPoolId: identityPoolId, region: region)
    }
}
