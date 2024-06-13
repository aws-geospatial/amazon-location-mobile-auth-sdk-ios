enum CognitoError: Error {
    case identityIdNotFound
    case credentialsNotFound
}

enum LocationProviderError: Error {
    case apiKeyNotFound
}
