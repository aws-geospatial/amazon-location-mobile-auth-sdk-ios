import Foundation

@objc public class AmazonLocationCognitoCredentialsProvider: NSObject {
    internal var identityPoolId: String?
    internal var region: String?
    private var cognitoCredentials: CognitoCredentials?
    private var refreshTimer: Timer?
    
    @objc public init(identityPoolId: String, region: String?) {
        self.identityPoolId = identityPoolId
        self.region = region
    }

    public func getCognitoCredentials() -> CognitoCredentials? {
        if self.cognitoCredentials != nil && self.cognitoCredentials!.expiration! > Date() {
            return self.cognitoCredentials
        }
        else if let cognitoCredentialsString = KeyChainHelper.get(key: .CognitoCredentials), let cognitoCredentials = CognitoCredentials.decodeCognitoCredentials(jsonString: cognitoCredentialsString) {
            self.cognitoCredentials = cognitoCredentials
            return self.cognitoCredentials
        }
        return self.cognitoCredentials
    }
    
    @objc public func refreshCognitoCredentialsIfExpired() async throws {
        if let savedCredentials = getCognitoCredentials(), savedCredentials.expiration! > Date() {
            cognitoCredentials = savedCredentials
        } else {
            try? await refreshCognitoCredentials()
        }
    }
    
    @objc public func refreshCognitoCredentials() async throws {
        if let identityPoolId = self.identityPoolId, let region = self.region, let cognitoCredentials = try await CognitoCredentialsProvider.generateCognitoCredentials(identityPoolId: identityPoolId, region: region) {
            setCognitoCredentials(cognitoCredentials: cognitoCredentials)

            var timeToRefresh = 3600.0 // default to 1 hour if credentials does not have expiration field
            if (cognitoCredentials.expiration != nil) {
                timeToRefresh = cognitoCredentials.expiration!.timeIntervalSince(Date())
            }

            // timeToRefresh minus 1 minute to give some time for the actual refresh to happen
            timeToRefresh -= 60.0

            // Dispatch a timed refresh of the credentials before they expire
            // We have to copy timeToRefresh to dispatchTimeToRefresh, because you can't reference
            // a captured var in a concurrent operation, only constants
            let dispatchTimeToRefresh = timeToRefresh
            DispatchQueue.main.async {
                self.refreshTimer = Timer.scheduledTimer(timeInterval: dispatchTimeToRefresh, target: self, selector: #selector(self.dispatchRefreshCognitoCredentials), userInfo: nil, repeats: false)
            }
        }
    }
    
    @objc public func dispatchRefreshCognitoCredentials() {
        // Helper function so that we can call refreshCognitoCredentials, which is an async method,
        // from the refresh Timer selector in refreshCognitoCredentials()
        // Swift will crash if you try to target an async method with a Timer selector
        Task {
            try await self.refreshCognitoCredentials()
        }
    }
    
    private func setCognitoCredentials(cognitoCredentials: CognitoCredentials) {
        self.cognitoCredentials = cognitoCredentials
        KeyChainHelper.save(value: CognitoCredentials.encodeCognitoCredentials(credential: cognitoCredentials)!, key: .CognitoCredentials)
    }
}
