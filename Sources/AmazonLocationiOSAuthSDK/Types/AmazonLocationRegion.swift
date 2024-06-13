public enum AmazonLocationRegionType: String {
    case USEast1 = "us-east-1"
    case USEast2 = "us-east-2"
    case USWest2 = "us-west-2"
    case USWest1 = "us-west-1"
    case EUWest1 = "eu-west-1"
    case EUWest2 = "eu-west-2"
    case EUWest3 = "eu-west-3"
    case EUCentral1 = "eu-central-1"
    case EUNorth1 = "eu-north-1"
    case APEast1 = "ap-east-1"
    case APSoutheast1 = "ap-southeast-1"
    case APNortheast1 = "ap-northeast-1"
    case APNortheast2 = "ap-northeast-2"
    case APSoutheast2 = "ap-southeast-2"
    case APSouth1 = "ap-south-1"
    case SAEast1 = "sa-east-1"
    case CNNorth1 = "cn-north-1"
    case CNNorthWest1 = "cn-northwest-1"
    case CACentral1 = "ca-central-1"
    case USGovWest1 = "us-gov-west-1"
    case USGovEast1 = "us-gov-east-1"
    case MESouth1 = "me-south-1"
    case AFSouth1 = "af-south-1"
    case EUSouth1 = "eu-south-1"
}

public class AmazonLocationRegion {

    public static func regionTypeByString(regionString: String) -> AmazonLocationRegionType? {
        return AmazonLocationRegionType(rawValue: regionString)
    }
    
    public static func toRegionType(identityPoolId: String) -> AmazonLocationRegionType? {
        var region: AmazonLocationRegionType?
    
        if let stringRegion = identityPoolId.components(separatedBy: ":").first {
            
            if let extractedRegion = AmazonLocationRegion.regionTypeByString(regionString: stringRegion) {
                region = extractedRegion
            } else {
                Logger.shared.log("Invalid region: \(stringRegion)")
            }
        }
        return region
    }
    
    public static func toRegionString(identityPoolId: String) -> String {
        return identityPoolId.components(separatedBy: ":").first ?? identityPoolId
    }
}
