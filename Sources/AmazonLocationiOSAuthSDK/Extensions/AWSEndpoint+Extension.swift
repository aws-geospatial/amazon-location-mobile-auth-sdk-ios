import Foundation
import AWSCore

fileprivate let AWSRegionNameUSEast1 = "us-east-1"
fileprivate let AWSRegionNameUSEast2 = "us-east-2"
fileprivate let AWSRegionNameUSWest2 = "us-west-2"
fileprivate let AWSRegionNameUSWest1 = "us-west-1"
fileprivate let AWSRegionNameEUWest1 = "eu-west-1"
fileprivate let AWSRegionNameEUWest2 = "eu-west-2"
fileprivate let AWSRegionNameEUWest3 = "eu-west-3"
fileprivate let AWSRegionNameEUCentral1 = "eu-central-1"
fileprivate let AWSRegionNameEUNorth1 = "eu-north-1"
fileprivate let AWSRegionNameAPEast1 = "ap-east-1"
fileprivate let AWSRegionNameAPSoutheast1 = "ap-southeast-1"
fileprivate let AWSRegionNameAPNortheast1 = "ap-northeast-1"
fileprivate let AWSRegionNameAPNortheast2 = "ap-northeast-2"
fileprivate let AWSRegionNameAPSoutheast2 = "ap-southeast-2"
fileprivate let AWSRegionNameAPSouth1 = "ap-south-1"
fileprivate let AWSRegionNameSAEast1 = "sa-east-1"
fileprivate let AWSRegionNameCNNorth1 = "cn-north-1"
fileprivate let AWSRegionNameCNNorthWest1 = "cn-northwest-1"
fileprivate let AWSRegionNameCACentral1 = "ca-central-1"
fileprivate let AWSRegionNameUSGovWest1 = "us-gov-west-1"
fileprivate let AWSRegionNameUSGovEast1 = "us-gov-east-1"
fileprivate let AWSRegionNameMESouth1 = "me-south-1"
fileprivate let AWSRegionNameAFSouth1 = "af-south-1"
fileprivate let AWSRegionNameEUSouth1 = "eu-south-1"

public extension AWSEndpoint {

    static func regionTypeByString(regionString: String) -> AWSRegionType? {
        switch regionString {
            case AWSRegionNameUSEast1:
                return .USEast1
            case AWSRegionNameUSEast2:
                return .USEast2
            case AWSRegionNameUSWest2:
                return .USWest2
            case AWSRegionNameUSWest1:
                return .USWest1
            case AWSRegionNameEUWest1:
                return .EUWest1
            case AWSRegionNameEUWest2:
                return .EUWest2
            case AWSRegionNameEUCentral1:
                return .EUCentral1
            case AWSRegionNameAPSoutheast1:
                return .APSoutheast1
            case AWSRegionNameAPSoutheast2:
                return .APSoutheast2
            case AWSRegionNameAPNortheast1:
                return .APNortheast1
            case AWSRegionNameAPNortheast2:
                return .APNortheast2
            case AWSRegionNameAPSouth1:
                return .APSouth1
            case AWSRegionNameSAEast1:
                return .SAEast1
            case AWSRegionNameCNNorth1:
                return .CNNorth1
            case AWSRegionNameCACentral1:
            return .CACentral1
            case AWSRegionNameUSGovWest1:
                return .USGovWest1;
            case AWSRegionNameCNNorthWest1:
                return .CNNorthWest1;
            case AWSRegionNameEUWest3:
                return .EUWest3;
            case AWSRegionNameUSGovEast1:
                return .USGovEast1;
            case AWSRegionNameEUNorth1:
                return .EUNorth1;
            case AWSRegionNameAPEast1:
                return .APEast1;
            case AWSRegionNameMESouth1:
                return .MESouth1;
            case AWSRegionNameAFSouth1:
                return .AFSouth1;
            case AWSRegionNameEUSouth1:
                return .EUSouth1;
            default:
                return nil;
        }
    }
    
    static func toRegionType(identityPoolId: String) -> AWSRegionType? {
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
    
    static func toRegionString(identityPoolId: String) -> String {
        return identityPoolId.components(separatedBy: ":").first ?? identityPoolId
    }
}
