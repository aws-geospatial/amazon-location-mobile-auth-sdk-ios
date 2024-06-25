import Foundation

@objc public class AmazonLocationRegion: NSObject {
    @objc public static func toRegionString(identityPoolId: String) -> String {
        return identityPoolId.components(separatedBy: ":").first ?? identityPoolId
    }
}
