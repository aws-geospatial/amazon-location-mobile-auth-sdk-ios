//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

// Code generated by smithy-swift-codegen. DO NOT EDIT!

@testable import AWSGeoRoutes
import SmithyTestUtil
import XCTest
import enum ClientRuntime.EndpointError
import struct SmithyHTTPAPI.Endpoint
import struct SmithyHTTPAPI.Headers

class EndpointResolverTest: XCTestCase {

    override class func setUp() {
        SmithyTestUtil.TestInitializer.initialize()
    }

    /// For custom endpoint with region not set and fips disabled
    func testResolve1() throws {
        let endpointParams = EndpointParams(
            endpoint: "https://example.com",
            useFIPS: false
        )
        let resolver = try DefaultEndpointResolver()

        let actual = try resolver.resolve(params: endpointParams)

        let properties: [String: AnyHashable] =
            [:]

        let headers = SmithyHTTPAPI.Headers()
        let expected = try SmithyHTTPAPI.Endpoint(urlString: "https://example.com", headers: headers, properties: properties)

        XCTAssertEqual(expected, actual)
    }

    /// For custom endpoint with fips enabled
    func testResolve2() throws {
        let endpointParams = EndpointParams(
            endpoint: "https://example.com",
            useFIPS: true
        )
        let resolver = try DefaultEndpointResolver()

        XCTAssertThrowsError(try resolver.resolve(params: endpointParams)) { error in
            switch error {
            case ClientRuntime.EndpointError.unresolved(let message):
                XCTAssertEqual("Invalid Configuration: FIPS and custom endpoint are not supported", message)
            default:
                XCTFail()
            }
        }
    }

    /// For custom endpoint with fips disabled and dualstack enabled
    func testResolve3() throws {
        let endpointParams = EndpointParams(
            endpoint: "https://example.com",
            useDualStack: true,
            useFIPS: false
        )
        let resolver = try DefaultEndpointResolver()

        XCTAssertThrowsError(try resolver.resolve(params: endpointParams)) { error in
            switch error {
            case ClientRuntime.EndpointError.unresolved(let message):
                XCTAssertEqual("Invalid Configuration: Dualstack and custom endpoint are not supported", message)
            default:
                XCTFail()
            }
        }
    }

    /// For region us-east-1 with FIPS enabled and DualStack enabled
    func testResolve4() throws {
        let endpointParams = EndpointParams(
            region: "us-east-1",
            useDualStack: true,
            useFIPS: true
        )
        let resolver = try DefaultEndpointResolver()

        let actual = try resolver.resolve(params: endpointParams)

        let properties: [String: AnyHashable] =
            [:]

        let headers = SmithyHTTPAPI.Headers()
        let expected = try SmithyHTTPAPI.Endpoint(urlString: "https://routes.geo-fips.us-east-1.api.aws/v2", headers: headers, properties: properties)

        XCTAssertEqual(expected, actual)
    }

    /// For region us-east-1 with FIPS enabled and DualStack disabled
    func testResolve5() throws {
        let endpointParams = EndpointParams(
            region: "us-east-1",
            useDualStack: false,
            useFIPS: true
        )
        let resolver = try DefaultEndpointResolver()

        let actual = try resolver.resolve(params: endpointParams)

        let properties: [String: AnyHashable] =
            [:]

        let headers = SmithyHTTPAPI.Headers()
        let expected = try SmithyHTTPAPI.Endpoint(urlString: "https://routes.geo-fips.us-east-1.amazonaws.com/v2", headers: headers, properties: properties)

        XCTAssertEqual(expected, actual)
    }

    /// For region us-east-1 with FIPS disabled and DualStack enabled
    func testResolve6() throws {
        let endpointParams = EndpointParams(
            region: "us-east-1",
            useDualStack: true,
            useFIPS: false
        )
        let resolver = try DefaultEndpointResolver()

        let actual = try resolver.resolve(params: endpointParams)

        let properties: [String: AnyHashable] =
            [:]

        let headers = SmithyHTTPAPI.Headers()
        let expected = try SmithyHTTPAPI.Endpoint(urlString: "https://routes.geo.us-east-1.api.aws/v2", headers: headers, properties: properties)

        XCTAssertEqual(expected, actual)
    }

    /// For region us-east-1 with FIPS disabled and DualStack disabled
    func testResolve7() throws {
        let endpointParams = EndpointParams(
            region: "us-east-1",
            useDualStack: false,
            useFIPS: false
        )
        let resolver = try DefaultEndpointResolver()

        let actual = try resolver.resolve(params: endpointParams)

        let properties: [String: AnyHashable] =
            [:]

        let headers = SmithyHTTPAPI.Headers()
        let expected = try SmithyHTTPAPI.Endpoint(urlString: "https://routes.geo.us-east-1.amazonaws.com/v2", headers: headers, properties: properties)

        XCTAssertEqual(expected, actual)
    }

    /// For region cn-northwest-1 with FIPS enabled and DualStack enabled
    func testResolve8() throws {
        let endpointParams = EndpointParams(
            region: "cn-northwest-1",
            useDualStack: true,
            useFIPS: true
        )
        let resolver = try DefaultEndpointResolver()

        let actual = try resolver.resolve(params: endpointParams)

        let properties: [String: AnyHashable] =
            [:]

        let headers = SmithyHTTPAPI.Headers()
        let expected = try SmithyHTTPAPI.Endpoint(urlString: "https://geo-routes-fips.cn-northwest-1.api.amazonwebservices.com.cn", headers: headers, properties: properties)

        XCTAssertEqual(expected, actual)
    }

    /// For region cn-northwest-1 with FIPS enabled and DualStack disabled
    func testResolve9() throws {
        let endpointParams = EndpointParams(
            region: "cn-northwest-1",
            useDualStack: false,
            useFIPS: true
        )
        let resolver = try DefaultEndpointResolver()

        let actual = try resolver.resolve(params: endpointParams)

        let properties: [String: AnyHashable] =
            [:]

        let headers = SmithyHTTPAPI.Headers()
        let expected = try SmithyHTTPAPI.Endpoint(urlString: "https://geo-routes-fips.cn-northwest-1.amazonaws.com.cn", headers: headers, properties: properties)

        XCTAssertEqual(expected, actual)
    }

    /// For region cn-northwest-1 with FIPS disabled and DualStack enabled
    func testResolve10() throws {
        let endpointParams = EndpointParams(
            region: "cn-northwest-1",
            useDualStack: true,
            useFIPS: false
        )
        let resolver = try DefaultEndpointResolver()

        let actual = try resolver.resolve(params: endpointParams)

        let properties: [String: AnyHashable] =
            [:]

        let headers = SmithyHTTPAPI.Headers()
        let expected = try SmithyHTTPAPI.Endpoint(urlString: "https://geo-routes.cn-northwest-1.api.amazonwebservices.com.cn", headers: headers, properties: properties)

        XCTAssertEqual(expected, actual)
    }

    /// For region cn-northwest-1 with FIPS disabled and DualStack disabled
    func testResolve11() throws {
        let endpointParams = EndpointParams(
            region: "cn-northwest-1",
            useDualStack: false,
            useFIPS: false
        )
        let resolver = try DefaultEndpointResolver()

        let actual = try resolver.resolve(params: endpointParams)

        let properties: [String: AnyHashable] =
            [:]

        let headers = SmithyHTTPAPI.Headers()
        let expected = try SmithyHTTPAPI.Endpoint(urlString: "https://geo-routes.cn-northwest-1.amazonaws.com.cn", headers: headers, properties: properties)

        XCTAssertEqual(expected, actual)
    }

    /// For region us-gov-west-1 with FIPS enabled and DualStack enabled
    func testResolve12() throws {
        let endpointParams = EndpointParams(
            region: "us-gov-west-1",
            useDualStack: true,
            useFIPS: true
        )
        let resolver = try DefaultEndpointResolver()

        let actual = try resolver.resolve(params: endpointParams)

        let properties: [String: AnyHashable] =
            [:]

        let headers = SmithyHTTPAPI.Headers()
        let expected = try SmithyHTTPAPI.Endpoint(urlString: "https://routes.geo-fips.us-gov-west-1.us-gov.api.aws/v2", headers: headers, properties: properties)

        XCTAssertEqual(expected, actual)
    }

    /// For region us-gov-west-1 with FIPS enabled and DualStack disabled
    func testResolve13() throws {
        let endpointParams = EndpointParams(
            region: "us-gov-west-1",
            useDualStack: false,
            useFIPS: true
        )
        let resolver = try DefaultEndpointResolver()

        let actual = try resolver.resolve(params: endpointParams)

        let properties: [String: AnyHashable] =
            [:]

        let headers = SmithyHTTPAPI.Headers()
        let expected = try SmithyHTTPAPI.Endpoint(urlString: "https://routes.geo-fips.us-gov-west-1.us-gov.amazonaws.com/v2", headers: headers, properties: properties)

        XCTAssertEqual(expected, actual)
    }

    /// For region us-gov-west-1 with FIPS disabled and DualStack enabled
    func testResolve14() throws {
        let endpointParams = EndpointParams(
            region: "us-gov-west-1",
            useDualStack: true,
            useFIPS: false
        )
        let resolver = try DefaultEndpointResolver()

        let actual = try resolver.resolve(params: endpointParams)

        let properties: [String: AnyHashable] =
            [:]

        let headers = SmithyHTTPAPI.Headers()
        let expected = try SmithyHTTPAPI.Endpoint(urlString: "https://routes.geo.us-gov-west-1.us-gov.api.aws/v2", headers: headers, properties: properties)

        XCTAssertEqual(expected, actual)
    }

    /// For region us-gov-west-1 with FIPS disabled and DualStack disabled
    func testResolve15() throws {
        let endpointParams = EndpointParams(
            region: "us-gov-west-1",
            useDualStack: false,
            useFIPS: false
        )
        let resolver = try DefaultEndpointResolver()

        let actual = try resolver.resolve(params: endpointParams)

        let properties: [String: AnyHashable] =
            [:]

        let headers = SmithyHTTPAPI.Headers()
        let expected = try SmithyHTTPAPI.Endpoint(urlString: "https://routes.geo.us-gov-west-1.us-gov.amazonaws.com/v2", headers: headers, properties: properties)

        XCTAssertEqual(expected, actual)
    }

    /// For region us-iso-east-1 with FIPS enabled and DualStack enabled
    func testResolve16() throws {
        let endpointParams = EndpointParams(
            region: "us-iso-east-1",
            useDualStack: true,
            useFIPS: true
        )
        let resolver = try DefaultEndpointResolver()

        XCTAssertThrowsError(try resolver.resolve(params: endpointParams)) { error in
            switch error {
            case ClientRuntime.EndpointError.unresolved(let message):
                XCTAssertEqual("FIPS and DualStack are enabled, but this partition does not support one or both", message)
            default:
                XCTFail()
            }
        }
    }

    /// For region us-iso-east-1 with FIPS enabled and DualStack disabled
    func testResolve17() throws {
        let endpointParams = EndpointParams(
            region: "us-iso-east-1",
            useDualStack: false,
            useFIPS: true
        )
        let resolver = try DefaultEndpointResolver()

        let actual = try resolver.resolve(params: endpointParams)

        let properties: [String: AnyHashable] =
            [:]

        let headers = SmithyHTTPAPI.Headers()
        let expected = try SmithyHTTPAPI.Endpoint(urlString: "https://geo-routes-fips.us-iso-east-1.c2s.ic.gov", headers: headers, properties: properties)

        XCTAssertEqual(expected, actual)
    }

    /// For region us-iso-east-1 with FIPS disabled and DualStack enabled
    func testResolve18() throws {
        let endpointParams = EndpointParams(
            region: "us-iso-east-1",
            useDualStack: true,
            useFIPS: false
        )
        let resolver = try DefaultEndpointResolver()

        XCTAssertThrowsError(try resolver.resolve(params: endpointParams)) { error in
            switch error {
            case ClientRuntime.EndpointError.unresolved(let message):
                XCTAssertEqual("DualStack is enabled but this partition does not support DualStack", message)
            default:
                XCTFail()
            }
        }
    }

    /// For region us-iso-east-1 with FIPS disabled and DualStack disabled
    func testResolve19() throws {
        let endpointParams = EndpointParams(
            region: "us-iso-east-1",
            useDualStack: false,
            useFIPS: false
        )
        let resolver = try DefaultEndpointResolver()

        let actual = try resolver.resolve(params: endpointParams)

        let properties: [String: AnyHashable] =
            [:]

        let headers = SmithyHTTPAPI.Headers()
        let expected = try SmithyHTTPAPI.Endpoint(urlString: "https://geo-routes.us-iso-east-1.c2s.ic.gov", headers: headers, properties: properties)

        XCTAssertEqual(expected, actual)
    }

    /// For region us-isob-east-1 with FIPS enabled and DualStack enabled
    func testResolve20() throws {
        let endpointParams = EndpointParams(
            region: "us-isob-east-1",
            useDualStack: true,
            useFIPS: true
        )
        let resolver = try DefaultEndpointResolver()

        XCTAssertThrowsError(try resolver.resolve(params: endpointParams)) { error in
            switch error {
            case ClientRuntime.EndpointError.unresolved(let message):
                XCTAssertEqual("FIPS and DualStack are enabled, but this partition does not support one or both", message)
            default:
                XCTFail()
            }
        }
    }

    /// For region us-isob-east-1 with FIPS enabled and DualStack disabled
    func testResolve21() throws {
        let endpointParams = EndpointParams(
            region: "us-isob-east-1",
            useDualStack: false,
            useFIPS: true
        )
        let resolver = try DefaultEndpointResolver()

        let actual = try resolver.resolve(params: endpointParams)

        let properties: [String: AnyHashable] =
            [:]

        let headers = SmithyHTTPAPI.Headers()
        let expected = try SmithyHTTPAPI.Endpoint(urlString: "https://geo-routes-fips.us-isob-east-1.sc2s.sgov.gov", headers: headers, properties: properties)

        XCTAssertEqual(expected, actual)
    }

    /// For region us-isob-east-1 with FIPS disabled and DualStack enabled
    func testResolve22() throws {
        let endpointParams = EndpointParams(
            region: "us-isob-east-1",
            useDualStack: true,
            useFIPS: false
        )
        let resolver = try DefaultEndpointResolver()

        XCTAssertThrowsError(try resolver.resolve(params: endpointParams)) { error in
            switch error {
            case ClientRuntime.EndpointError.unresolved(let message):
                XCTAssertEqual("DualStack is enabled but this partition does not support DualStack", message)
            default:
                XCTFail()
            }
        }
    }

    /// For region us-isob-east-1 with FIPS disabled and DualStack disabled
    func testResolve23() throws {
        let endpointParams = EndpointParams(
            region: "us-isob-east-1",
            useDualStack: false,
            useFIPS: false
        )
        let resolver = try DefaultEndpointResolver()

        let actual = try resolver.resolve(params: endpointParams)

        let properties: [String: AnyHashable] =
            [:]

        let headers = SmithyHTTPAPI.Headers()
        let expected = try SmithyHTTPAPI.Endpoint(urlString: "https://geo-routes.us-isob-east-1.sc2s.sgov.gov", headers: headers, properties: properties)

        XCTAssertEqual(expected, actual)
    }

    /// For region eu-isoe-west-1 with FIPS enabled and DualStack enabled
    func testResolve24() throws {
        let endpointParams = EndpointParams(
            region: "eu-isoe-west-1",
            useDualStack: true,
            useFIPS: true
        )
        let resolver = try DefaultEndpointResolver()

        XCTAssertThrowsError(try resolver.resolve(params: endpointParams)) { error in
            switch error {
            case ClientRuntime.EndpointError.unresolved(let message):
                XCTAssertEqual("FIPS and DualStack are enabled, but this partition does not support one or both", message)
            default:
                XCTFail()
            }
        }
    }

    /// For region eu-isoe-west-1 with FIPS enabled and DualStack disabled
    func testResolve25() throws {
        let endpointParams = EndpointParams(
            region: "eu-isoe-west-1",
            useDualStack: false,
            useFIPS: true
        )
        let resolver = try DefaultEndpointResolver()

        let actual = try resolver.resolve(params: endpointParams)

        let properties: [String: AnyHashable] =
            [:]

        let headers = SmithyHTTPAPI.Headers()
        let expected = try SmithyHTTPAPI.Endpoint(urlString: "https://geo-routes-fips.eu-isoe-west-1.cloud.adc-e.uk", headers: headers, properties: properties)

        XCTAssertEqual(expected, actual)
    }

    /// For region eu-isoe-west-1 with FIPS disabled and DualStack enabled
    func testResolve26() throws {
        let endpointParams = EndpointParams(
            region: "eu-isoe-west-1",
            useDualStack: true,
            useFIPS: false
        )
        let resolver = try DefaultEndpointResolver()

        XCTAssertThrowsError(try resolver.resolve(params: endpointParams)) { error in
            switch error {
            case ClientRuntime.EndpointError.unresolved(let message):
                XCTAssertEqual("DualStack is enabled but this partition does not support DualStack", message)
            default:
                XCTFail()
            }
        }
    }

    /// For region eu-isoe-west-1 with FIPS disabled and DualStack disabled
    func testResolve27() throws {
        let endpointParams = EndpointParams(
            region: "eu-isoe-west-1",
            useDualStack: false,
            useFIPS: false
        )
        let resolver = try DefaultEndpointResolver()

        let actual = try resolver.resolve(params: endpointParams)

        let properties: [String: AnyHashable] =
            [:]

        let headers = SmithyHTTPAPI.Headers()
        let expected = try SmithyHTTPAPI.Endpoint(urlString: "https://geo-routes.eu-isoe-west-1.cloud.adc-e.uk", headers: headers, properties: properties)

        XCTAssertEqual(expected, actual)
    }

    /// For region us-isof-south-1 with FIPS enabled and DualStack enabled
    func testResolve28() throws {
        let endpointParams = EndpointParams(
            region: "us-isof-south-1",
            useDualStack: true,
            useFIPS: true
        )
        let resolver = try DefaultEndpointResolver()

        XCTAssertThrowsError(try resolver.resolve(params: endpointParams)) { error in
            switch error {
            case ClientRuntime.EndpointError.unresolved(let message):
                XCTAssertEqual("FIPS and DualStack are enabled, but this partition does not support one or both", message)
            default:
                XCTFail()
            }
        }
    }

    /// For region us-isof-south-1 with FIPS enabled and DualStack disabled
    func testResolve29() throws {
        let endpointParams = EndpointParams(
            region: "us-isof-south-1",
            useDualStack: false,
            useFIPS: true
        )
        let resolver = try DefaultEndpointResolver()

        let actual = try resolver.resolve(params: endpointParams)

        let properties: [String: AnyHashable] =
            [:]

        let headers = SmithyHTTPAPI.Headers()
        let expected = try SmithyHTTPAPI.Endpoint(urlString: "https://geo-routes-fips.us-isof-south-1.csp.hci.ic.gov", headers: headers, properties: properties)

        XCTAssertEqual(expected, actual)
    }

    /// For region us-isof-south-1 with FIPS disabled and DualStack enabled
    func testResolve30() throws {
        let endpointParams = EndpointParams(
            region: "us-isof-south-1",
            useDualStack: true,
            useFIPS: false
        )
        let resolver = try DefaultEndpointResolver()

        XCTAssertThrowsError(try resolver.resolve(params: endpointParams)) { error in
            switch error {
            case ClientRuntime.EndpointError.unresolved(let message):
                XCTAssertEqual("DualStack is enabled but this partition does not support DualStack", message)
            default:
                XCTFail()
            }
        }
    }

    /// For region us-isof-south-1 with FIPS disabled and DualStack disabled
    func testResolve31() throws {
        let endpointParams = EndpointParams(
            region: "us-isof-south-1",
            useDualStack: false,
            useFIPS: false
        )
        let resolver = try DefaultEndpointResolver()

        let actual = try resolver.resolve(params: endpointParams)

        let properties: [String: AnyHashable] =
            [:]

        let headers = SmithyHTTPAPI.Headers()
        let expected = try SmithyHTTPAPI.Endpoint(urlString: "https://geo-routes.us-isof-south-1.csp.hci.ic.gov", headers: headers, properties: properties)

        XCTAssertEqual(expected, actual)
    }

    /// Missing region
    func testResolve32() throws {
        let endpointParams = EndpointParams(
        )
        let resolver = try DefaultEndpointResolver()

        XCTAssertThrowsError(try resolver.resolve(params: endpointParams)) { error in
            switch error {
            case ClientRuntime.EndpointError.unresolved(let message):
                XCTAssertEqual("Invalid Configuration: Missing Region", message)
            default:
                XCTFail()
            }
        }
    }

}
