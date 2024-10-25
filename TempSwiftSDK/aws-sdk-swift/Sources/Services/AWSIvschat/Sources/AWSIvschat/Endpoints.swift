//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

// Code generated by smithy-swift-codegen. DO NOT EDIT!

import class ClientRuntime.EndpointsRequestContext
import let AWSClientRuntime.awsPartitionJSON
import protocol ClientRuntime.EndpointsRequestContextProviding
import struct ClientRuntime.DefaultEndpointResolver
import struct ClientRuntime.StaticEndpointResolver
import struct SmithyHTTPAPI.Endpoint

public struct EndpointParams {
    /// Override the endpoint used to send this request
    public let endpoint: Swift.String?
    /// The AWS region used to dispatch the request.
    public let region: Swift.String?
    /// When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.
    public let useDualStack: Swift.Bool
    /// When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.
    public let useFIPS: Swift.Bool

    public init(
        endpoint: Swift.String? = nil,
        region: Swift.String? = nil,
        useDualStack: Swift.Bool = false,
        useFIPS: Swift.Bool = false
    )
    {
        self.endpoint = endpoint
        self.region = region
        self.useDualStack = useDualStack
        self.useFIPS = useFIPS
    }
}

extension EndpointParams: ClientRuntime.EndpointsRequestContextProviding {

    public var context: ClientRuntime.EndpointsRequestContext {
        get throws {
            let context = try ClientRuntime.EndpointsRequestContext()
            try context.add(name: "Endpoint", value: self.endpoint)
            try context.add(name: "Region", value: self.region)
            try context.add(name: "UseDualStack", value: self.useDualStack)
            try context.add(name: "UseFIPS", value: self.useFIPS)
            return context
        }
    }
}

public protocol EndpointResolver {
    func resolve(params: EndpointParams) throws -> SmithyHTTPAPI.Endpoint
}

typealias DefaultEndpointResolver = ClientRuntime.DefaultEndpointResolver<EndpointParams>

extension DefaultEndpointResolver {
    private static let ruleSet = "{\"version\":\"1.0\",\"parameters\":{\"Region\":{\"builtIn\":\"AWS::Region\",\"required\":false,\"documentation\":\"The AWS region used to dispatch the request.\",\"type\":\"String\"},\"UseDualStack\":{\"builtIn\":\"AWS::UseDualStack\",\"required\":true,\"default\":false,\"documentation\":\"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.\",\"type\":\"Boolean\"},\"UseFIPS\":{\"builtIn\":\"AWS::UseFIPS\",\"required\":true,\"default\":false,\"documentation\":\"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.\",\"type\":\"Boolean\"},\"Endpoint\":{\"builtIn\":\"SDK::Endpoint\",\"required\":false,\"documentation\":\"Override the endpoint used to send this request\",\"type\":\"String\"}},\"rules\":[{\"conditions\":[{\"fn\":\"isSet\",\"argv\":[{\"ref\":\"Endpoint\"}]}],\"rules\":[{\"conditions\":[{\"fn\":\"booleanEquals\",\"argv\":[{\"ref\":\"UseFIPS\"},true]}],\"error\":\"Invalid Configuration: FIPS and custom endpoint are not supported\",\"type\":\"error\"},{\"conditions\":[{\"fn\":\"booleanEquals\",\"argv\":[{\"ref\":\"UseDualStack\"},true]}],\"error\":\"Invalid Configuration: Dualstack and custom endpoint are not supported\",\"type\":\"error\"},{\"conditions\":[],\"endpoint\":{\"url\":{\"ref\":\"Endpoint\"},\"properties\":{},\"headers\":{}},\"type\":\"endpoint\"}],\"type\":\"tree\"},{\"conditions\":[{\"fn\":\"isSet\",\"argv\":[{\"ref\":\"Region\"}]}],\"rules\":[{\"conditions\":[{\"fn\":\"aws.partition\",\"argv\":[{\"ref\":\"Region\"}],\"assign\":\"PartitionResult\"}],\"rules\":[{\"conditions\":[{\"fn\":\"booleanEquals\",\"argv\":[{\"ref\":\"UseFIPS\"},true]},{\"fn\":\"booleanEquals\",\"argv\":[{\"ref\":\"UseDualStack\"},true]}],\"rules\":[{\"conditions\":[{\"fn\":\"booleanEquals\",\"argv\":[true,{\"fn\":\"getAttr\",\"argv\":[{\"ref\":\"PartitionResult\"},\"supportsFIPS\"]}]},{\"fn\":\"booleanEquals\",\"argv\":[true,{\"fn\":\"getAttr\",\"argv\":[{\"ref\":\"PartitionResult\"},\"supportsDualStack\"]}]}],\"rules\":[{\"conditions\":[],\"endpoint\":{\"url\":\"https://ivschat-fips.{Region}.{PartitionResult#dualStackDnsSuffix}\",\"properties\":{},\"headers\":{}},\"type\":\"endpoint\"}],\"type\":\"tree\"},{\"conditions\":[],\"error\":\"FIPS and DualStack are enabled, but this partition does not support one or both\",\"type\":\"error\"}],\"type\":\"tree\"},{\"conditions\":[{\"fn\":\"booleanEquals\",\"argv\":[{\"ref\":\"UseFIPS\"},true]}],\"rules\":[{\"conditions\":[{\"fn\":\"booleanEquals\",\"argv\":[{\"fn\":\"getAttr\",\"argv\":[{\"ref\":\"PartitionResult\"},\"supportsFIPS\"]},true]}],\"rules\":[{\"conditions\":[],\"endpoint\":{\"url\":\"https://ivschat-fips.{Region}.{PartitionResult#dnsSuffix}\",\"properties\":{},\"headers\":{}},\"type\":\"endpoint\"}],\"type\":\"tree\"},{\"conditions\":[],\"error\":\"FIPS is enabled but this partition does not support FIPS\",\"type\":\"error\"}],\"type\":\"tree\"},{\"conditions\":[{\"fn\":\"booleanEquals\",\"argv\":[{\"ref\":\"UseDualStack\"},true]}],\"rules\":[{\"conditions\":[{\"fn\":\"booleanEquals\",\"argv\":[true,{\"fn\":\"getAttr\",\"argv\":[{\"ref\":\"PartitionResult\"},\"supportsDualStack\"]}]}],\"rules\":[{\"conditions\":[],\"endpoint\":{\"url\":\"https://ivschat.{Region}.{PartitionResult#dualStackDnsSuffix}\",\"properties\":{},\"headers\":{}},\"type\":\"endpoint\"}],\"type\":\"tree\"},{\"conditions\":[],\"error\":\"DualStack is enabled but this partition does not support DualStack\",\"type\":\"error\"}],\"type\":\"tree\"},{\"conditions\":[],\"endpoint\":{\"url\":\"https://ivschat.{Region}.{PartitionResult#dnsSuffix}\",\"properties\":{},\"headers\":{}},\"type\":\"endpoint\"}],\"type\":\"tree\"}],\"type\":\"tree\"},{\"conditions\":[],\"error\":\"Invalid Configuration: Missing Region\",\"type\":\"error\"}]}"

    init() throws {
        try self.init(partitions: AWSClientRuntime.awsPartitionJSON, ruleSet: Self.ruleSet)
    }
}

extension DefaultEndpointResolver: EndpointResolver {}

typealias StaticEndpointResolver = ClientRuntime.StaticEndpointResolver<EndpointParams>

extension StaticEndpointResolver: EndpointResolver {}
