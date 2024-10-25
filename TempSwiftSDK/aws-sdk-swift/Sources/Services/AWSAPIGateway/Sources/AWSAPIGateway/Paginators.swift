//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

// Code generated by smithy-swift-codegen. DO NOT EDIT!

import protocol ClientRuntime.PaginateToken
import struct ClientRuntime.PaginatorSequence

extension APIGatewayClient {
    /// Paginate over `[GetApiKeysOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[GetApiKeysInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `GetApiKeysOutput`
    public func getApiKeysPaginated(input: GetApiKeysInput) -> ClientRuntime.PaginatorSequence<GetApiKeysInput, GetApiKeysOutput> {
        return ClientRuntime.PaginatorSequence<GetApiKeysInput, GetApiKeysOutput>(input: input, inputKey: \.position, outputKey: \.position, paginationFunction: self.getApiKeys(input:))
    }
}

extension GetApiKeysInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> GetApiKeysInput {
        return GetApiKeysInput(
            customerId: self.customerId,
            includeValues: self.includeValues,
            limit: self.limit,
            nameQuery: self.nameQuery,
            position: token
        )}
}

extension PaginatorSequence where OperationStackInput == GetApiKeysInput, OperationStackOutput == GetApiKeysOutput {
    /// This paginator transforms the `AsyncSequence` returned by `getApiKeysPaginated`
    /// to access the nested member `[APIGatewayClientTypes.ApiKey]`
    /// - Returns: `[APIGatewayClientTypes.ApiKey]`
    public func items() async throws -> [APIGatewayClientTypes.ApiKey] {
        return try await self.asyncCompactMap { item in item.items }
    }
}
extension APIGatewayClient {
    /// Paginate over `[GetBasePathMappingsOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[GetBasePathMappingsInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `GetBasePathMappingsOutput`
    public func getBasePathMappingsPaginated(input: GetBasePathMappingsInput) -> ClientRuntime.PaginatorSequence<GetBasePathMappingsInput, GetBasePathMappingsOutput> {
        return ClientRuntime.PaginatorSequence<GetBasePathMappingsInput, GetBasePathMappingsOutput>(input: input, inputKey: \.position, outputKey: \.position, paginationFunction: self.getBasePathMappings(input:))
    }
}

extension GetBasePathMappingsInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> GetBasePathMappingsInput {
        return GetBasePathMappingsInput(
            domainName: self.domainName,
            limit: self.limit,
            position: token
        )}
}

extension PaginatorSequence where OperationStackInput == GetBasePathMappingsInput, OperationStackOutput == GetBasePathMappingsOutput {
    /// This paginator transforms the `AsyncSequence` returned by `getBasePathMappingsPaginated`
    /// to access the nested member `[APIGatewayClientTypes.BasePathMapping]`
    /// - Returns: `[APIGatewayClientTypes.BasePathMapping]`
    public func items() async throws -> [APIGatewayClientTypes.BasePathMapping] {
        return try await self.asyncCompactMap { item in item.items }
    }
}
extension APIGatewayClient {
    /// Paginate over `[GetClientCertificatesOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[GetClientCertificatesInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `GetClientCertificatesOutput`
    public func getClientCertificatesPaginated(input: GetClientCertificatesInput) -> ClientRuntime.PaginatorSequence<GetClientCertificatesInput, GetClientCertificatesOutput> {
        return ClientRuntime.PaginatorSequence<GetClientCertificatesInput, GetClientCertificatesOutput>(input: input, inputKey: \.position, outputKey: \.position, paginationFunction: self.getClientCertificates(input:))
    }
}

extension GetClientCertificatesInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> GetClientCertificatesInput {
        return GetClientCertificatesInput(
            limit: self.limit,
            position: token
        )}
}

extension PaginatorSequence where OperationStackInput == GetClientCertificatesInput, OperationStackOutput == GetClientCertificatesOutput {
    /// This paginator transforms the `AsyncSequence` returned by `getClientCertificatesPaginated`
    /// to access the nested member `[APIGatewayClientTypes.ClientCertificate]`
    /// - Returns: `[APIGatewayClientTypes.ClientCertificate]`
    public func items() async throws -> [APIGatewayClientTypes.ClientCertificate] {
        return try await self.asyncCompactMap { item in item.items }
    }
}
extension APIGatewayClient {
    /// Paginate over `[GetDeploymentsOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[GetDeploymentsInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `GetDeploymentsOutput`
    public func getDeploymentsPaginated(input: GetDeploymentsInput) -> ClientRuntime.PaginatorSequence<GetDeploymentsInput, GetDeploymentsOutput> {
        return ClientRuntime.PaginatorSequence<GetDeploymentsInput, GetDeploymentsOutput>(input: input, inputKey: \.position, outputKey: \.position, paginationFunction: self.getDeployments(input:))
    }
}

extension GetDeploymentsInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> GetDeploymentsInput {
        return GetDeploymentsInput(
            limit: self.limit,
            position: token,
            restApiId: self.restApiId
        )}
}

extension PaginatorSequence where OperationStackInput == GetDeploymentsInput, OperationStackOutput == GetDeploymentsOutput {
    /// This paginator transforms the `AsyncSequence` returned by `getDeploymentsPaginated`
    /// to access the nested member `[APIGatewayClientTypes.Deployment]`
    /// - Returns: `[APIGatewayClientTypes.Deployment]`
    public func items() async throws -> [APIGatewayClientTypes.Deployment] {
        return try await self.asyncCompactMap { item in item.items }
    }
}
extension APIGatewayClient {
    /// Paginate over `[GetDomainNamesOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[GetDomainNamesInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `GetDomainNamesOutput`
    public func getDomainNamesPaginated(input: GetDomainNamesInput) -> ClientRuntime.PaginatorSequence<GetDomainNamesInput, GetDomainNamesOutput> {
        return ClientRuntime.PaginatorSequence<GetDomainNamesInput, GetDomainNamesOutput>(input: input, inputKey: \.position, outputKey: \.position, paginationFunction: self.getDomainNames(input:))
    }
}

extension GetDomainNamesInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> GetDomainNamesInput {
        return GetDomainNamesInput(
            limit: self.limit,
            position: token
        )}
}

extension PaginatorSequence where OperationStackInput == GetDomainNamesInput, OperationStackOutput == GetDomainNamesOutput {
    /// This paginator transforms the `AsyncSequence` returned by `getDomainNamesPaginated`
    /// to access the nested member `[APIGatewayClientTypes.DomainName]`
    /// - Returns: `[APIGatewayClientTypes.DomainName]`
    public func items() async throws -> [APIGatewayClientTypes.DomainName] {
        return try await self.asyncCompactMap { item in item.items }
    }
}
extension APIGatewayClient {
    /// Paginate over `[GetModelsOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[GetModelsInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `GetModelsOutput`
    public func getModelsPaginated(input: GetModelsInput) -> ClientRuntime.PaginatorSequence<GetModelsInput, GetModelsOutput> {
        return ClientRuntime.PaginatorSequence<GetModelsInput, GetModelsOutput>(input: input, inputKey: \.position, outputKey: \.position, paginationFunction: self.getModels(input:))
    }
}

extension GetModelsInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> GetModelsInput {
        return GetModelsInput(
            limit: self.limit,
            position: token,
            restApiId: self.restApiId
        )}
}

extension PaginatorSequence where OperationStackInput == GetModelsInput, OperationStackOutput == GetModelsOutput {
    /// This paginator transforms the `AsyncSequence` returned by `getModelsPaginated`
    /// to access the nested member `[APIGatewayClientTypes.Model]`
    /// - Returns: `[APIGatewayClientTypes.Model]`
    public func items() async throws -> [APIGatewayClientTypes.Model] {
        return try await self.asyncCompactMap { item in item.items }
    }
}
extension APIGatewayClient {
    /// Paginate over `[GetResourcesOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[GetResourcesInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `GetResourcesOutput`
    public func getResourcesPaginated(input: GetResourcesInput) -> ClientRuntime.PaginatorSequence<GetResourcesInput, GetResourcesOutput> {
        return ClientRuntime.PaginatorSequence<GetResourcesInput, GetResourcesOutput>(input: input, inputKey: \.position, outputKey: \.position, paginationFunction: self.getResources(input:))
    }
}

extension GetResourcesInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> GetResourcesInput {
        return GetResourcesInput(
            embed: self.embed,
            limit: self.limit,
            position: token,
            restApiId: self.restApiId
        )}
}

extension PaginatorSequence where OperationStackInput == GetResourcesInput, OperationStackOutput == GetResourcesOutput {
    /// This paginator transforms the `AsyncSequence` returned by `getResourcesPaginated`
    /// to access the nested member `[APIGatewayClientTypes.Resource]`
    /// - Returns: `[APIGatewayClientTypes.Resource]`
    public func items() async throws -> [APIGatewayClientTypes.Resource] {
        return try await self.asyncCompactMap { item in item.items }
    }
}
extension APIGatewayClient {
    /// Paginate over `[GetRestApisOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[GetRestApisInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `GetRestApisOutput`
    public func getRestApisPaginated(input: GetRestApisInput) -> ClientRuntime.PaginatorSequence<GetRestApisInput, GetRestApisOutput> {
        return ClientRuntime.PaginatorSequence<GetRestApisInput, GetRestApisOutput>(input: input, inputKey: \.position, outputKey: \.position, paginationFunction: self.getRestApis(input:))
    }
}

extension GetRestApisInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> GetRestApisInput {
        return GetRestApisInput(
            limit: self.limit,
            position: token
        )}
}

extension PaginatorSequence where OperationStackInput == GetRestApisInput, OperationStackOutput == GetRestApisOutput {
    /// This paginator transforms the `AsyncSequence` returned by `getRestApisPaginated`
    /// to access the nested member `[APIGatewayClientTypes.RestApi]`
    /// - Returns: `[APIGatewayClientTypes.RestApi]`
    public func items() async throws -> [APIGatewayClientTypes.RestApi] {
        return try await self.asyncCompactMap { item in item.items }
    }
}
extension APIGatewayClient {
    /// Paginate over `[GetUsageOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[GetUsageInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `GetUsageOutput`
    public func getUsagePaginated(input: GetUsageInput) -> ClientRuntime.PaginatorSequence<GetUsageInput, GetUsageOutput> {
        return ClientRuntime.PaginatorSequence<GetUsageInput, GetUsageOutput>(input: input, inputKey: \.position, outputKey: \.position, paginationFunction: self.getUsage(input:))
    }
}

extension GetUsageInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> GetUsageInput {
        return GetUsageInput(
            endDate: self.endDate,
            keyId: self.keyId,
            limit: self.limit,
            position: token,
            startDate: self.startDate,
            usagePlanId: self.usagePlanId
        )}
}

extension PaginatorSequence where OperationStackInput == GetUsageInput, OperationStackOutput == GetUsageOutput {
    /// This paginator transforms the `AsyncSequence` returned by `getUsagePaginated`
    /// to access the nested member `[(String, [[Swift.Int]])]`
    /// - Returns: `[(String, [[Swift.Int]])]`
    public func items() async throws -> [(String, [[Swift.Int]])] {
        return try await self.asyncCompactMap { item in item.items?.map { ($0, $1) } }
    }
}
extension APIGatewayClient {
    /// Paginate over `[GetUsagePlanKeysOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[GetUsagePlanKeysInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `GetUsagePlanKeysOutput`
    public func getUsagePlanKeysPaginated(input: GetUsagePlanKeysInput) -> ClientRuntime.PaginatorSequence<GetUsagePlanKeysInput, GetUsagePlanKeysOutput> {
        return ClientRuntime.PaginatorSequence<GetUsagePlanKeysInput, GetUsagePlanKeysOutput>(input: input, inputKey: \.position, outputKey: \.position, paginationFunction: self.getUsagePlanKeys(input:))
    }
}

extension GetUsagePlanKeysInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> GetUsagePlanKeysInput {
        return GetUsagePlanKeysInput(
            limit: self.limit,
            nameQuery: self.nameQuery,
            position: token,
            usagePlanId: self.usagePlanId
        )}
}

extension PaginatorSequence where OperationStackInput == GetUsagePlanKeysInput, OperationStackOutput == GetUsagePlanKeysOutput {
    /// This paginator transforms the `AsyncSequence` returned by `getUsagePlanKeysPaginated`
    /// to access the nested member `[APIGatewayClientTypes.UsagePlanKey]`
    /// - Returns: `[APIGatewayClientTypes.UsagePlanKey]`
    public func items() async throws -> [APIGatewayClientTypes.UsagePlanKey] {
        return try await self.asyncCompactMap { item in item.items }
    }
}
extension APIGatewayClient {
    /// Paginate over `[GetUsagePlansOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[GetUsagePlansInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `GetUsagePlansOutput`
    public func getUsagePlansPaginated(input: GetUsagePlansInput) -> ClientRuntime.PaginatorSequence<GetUsagePlansInput, GetUsagePlansOutput> {
        return ClientRuntime.PaginatorSequence<GetUsagePlansInput, GetUsagePlansOutput>(input: input, inputKey: \.position, outputKey: \.position, paginationFunction: self.getUsagePlans(input:))
    }
}

extension GetUsagePlansInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> GetUsagePlansInput {
        return GetUsagePlansInput(
            keyId: self.keyId,
            limit: self.limit,
            position: token
        )}
}

extension PaginatorSequence where OperationStackInput == GetUsagePlansInput, OperationStackOutput == GetUsagePlansOutput {
    /// This paginator transforms the `AsyncSequence` returned by `getUsagePlansPaginated`
    /// to access the nested member `[APIGatewayClientTypes.UsagePlan]`
    /// - Returns: `[APIGatewayClientTypes.UsagePlan]`
    public func items() async throws -> [APIGatewayClientTypes.UsagePlan] {
        return try await self.asyncCompactMap { item in item.items }
    }
}
extension APIGatewayClient {
    /// Paginate over `[GetVpcLinksOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[GetVpcLinksInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `GetVpcLinksOutput`
    public func getVpcLinksPaginated(input: GetVpcLinksInput) -> ClientRuntime.PaginatorSequence<GetVpcLinksInput, GetVpcLinksOutput> {
        return ClientRuntime.PaginatorSequence<GetVpcLinksInput, GetVpcLinksOutput>(input: input, inputKey: \.position, outputKey: \.position, paginationFunction: self.getVpcLinks(input:))
    }
}

extension GetVpcLinksInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> GetVpcLinksInput {
        return GetVpcLinksInput(
            limit: self.limit,
            position: token
        )}
}

extension PaginatorSequence where OperationStackInput == GetVpcLinksInput, OperationStackOutput == GetVpcLinksOutput {
    /// This paginator transforms the `AsyncSequence` returned by `getVpcLinksPaginated`
    /// to access the nested member `[APIGatewayClientTypes.VpcLink]`
    /// - Returns: `[APIGatewayClientTypes.VpcLink]`
    public func items() async throws -> [APIGatewayClientTypes.VpcLink] {
        return try await self.asyncCompactMap { item in item.items }
    }
}
