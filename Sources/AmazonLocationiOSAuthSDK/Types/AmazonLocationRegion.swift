import Foundation

@objc(AmazonLocationRegion)
public class AmazonLocationRegion: NSObject {
    @objc public static func toRegionString(identityPoolId: String) -> String {
        return identityPoolId.components(separatedBy: ":").first ?? identityPoolId
    }
}
