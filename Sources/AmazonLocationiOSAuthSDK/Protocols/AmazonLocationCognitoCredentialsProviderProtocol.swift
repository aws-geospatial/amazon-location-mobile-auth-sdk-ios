protocol AmazonLocationCognitoCredentialsProviderProtocol {
    func getCognitoCredentials() -> CognitoCredentials?
    func refreshCognitoCredentials() async throws
}
