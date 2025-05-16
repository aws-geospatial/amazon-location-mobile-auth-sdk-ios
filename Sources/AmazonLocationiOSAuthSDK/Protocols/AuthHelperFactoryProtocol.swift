/// Protocol that defines the factory methods for creating AuthHelper instances.
///
/// Wraps the initializers from `AuthHelper` into an instance-based factory pattern that is easier to mock for testing.
protocol AuthHelperFactoryProtocol {
    func makeWithApiKey(apiKey: String, region: String) async throws -> AuthHelperProtocol
    func makeWithIdentityPoolId(identityPoolId: String) async throws -> AuthHelperProtocol
    func makeWithIdentityPoolId(identityPoolId: String, region: String) async throws -> AuthHelperProtocol
}
