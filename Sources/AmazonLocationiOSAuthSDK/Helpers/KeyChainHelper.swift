import KeychainSwift

enum KeyChainType: String {
    case AmazonLocationAPIKey
    case AWSRegion
}

final class KeyChainHelper {
    static let keychain = KeychainSwift()
    
    static func save(value:String, key: KeyChainType) {
        keychain.set(value, forKey: key.rawValue)
    }
    
    static func get(key: KeyChainType) -> String? {
        return keychain.get(key.rawValue)
    }
}
