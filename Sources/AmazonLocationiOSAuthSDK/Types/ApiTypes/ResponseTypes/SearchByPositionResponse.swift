import Foundation

public struct Geometry: Codable {
    public let Point: [Double]
}

public struct PlaceTimeZone: Codable {
    public let Name: String
    public let Offset: Int
}

public struct Place: Codable {
    public let AddressNumber: String?
    public let Categories: [String]?
    public let Country: String?
    public let Geometry: Geometry
    public let Interpolated: Bool
    public let Label: String?
    public let Municipality: String?
    public let Neighborhood: String?
    public let PostalCode: String?
    public let Region: String?
    public let Street: String?
    public let SubMunicipality: String?
    public let SubRegion: String?
    public let SupplementalCategories: [String]?
    public let TimeZone: PlaceTimeZone?
    public let UnitNumber: String?
    public let UnitType: String?
}

public struct SearchResult: Codable {
    public let Distance: Double
    public let Place: Place
    public let PlaceId: String
}

public struct SearchSummary: Codable {
    public let DataSource: String
    public let Language: String
    public let MaxResults: Int
    public let Position: [Double]
}

public struct SearchByPositionResponse: Codable {
    public let Results: [SearchResult]
    public let Summary: SearchSummary
}

extension SearchByPositionResponse {
    public static func from(data: Data) throws -> SearchByPositionResponse? {
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let response = try decoder.decode(SearchByPositionResponse.self, from: data)
            return response
        }
        catch {
            print(error)
            return nil
        }
    }
}
