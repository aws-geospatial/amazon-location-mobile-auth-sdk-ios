//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

// Code generated by smithy-swift-codegen. DO NOT EDIT!

import protocol ClientRuntime.PaginateToken
import struct ClientRuntime.PaginatorSequence

extension ResourceExplorer2Client {
    /// Paginate over `[ListIndexesForMembersOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[ListIndexesForMembersInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `ListIndexesForMembersOutput`
    public func listIndexesForMembersPaginated(input: ListIndexesForMembersInput) -> ClientRuntime.PaginatorSequence<ListIndexesForMembersInput, ListIndexesForMembersOutput> {
        return ClientRuntime.PaginatorSequence<ListIndexesForMembersInput, ListIndexesForMembersOutput>(input: input, inputKey: \.nextToken, outputKey: \.nextToken, paginationFunction: self.listIndexesForMembers(input:))
    }
}

extension ListIndexesForMembersInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> ListIndexesForMembersInput {
        return ListIndexesForMembersInput(
            accountIdList: self.accountIdList,
            maxResults: self.maxResults,
            nextToken: token
        )}
}

extension PaginatorSequence where OperationStackInput == ListIndexesForMembersInput, OperationStackOutput == ListIndexesForMembersOutput {
    /// This paginator transforms the `AsyncSequence` returned by `listIndexesForMembersPaginated`
    /// to access the nested member `[ResourceExplorer2ClientTypes.MemberIndex]`
    /// - Returns: `[ResourceExplorer2ClientTypes.MemberIndex]`
    public func indexes() async throws -> [ResourceExplorer2ClientTypes.MemberIndex] {
        return try await self.asyncCompactMap { item in item.indexes }
    }
}
extension ResourceExplorer2Client {
    /// Paginate over `[ListResourcesOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[ListResourcesInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `ListResourcesOutput`
    public func listResourcesPaginated(input: ListResourcesInput) -> ClientRuntime.PaginatorSequence<ListResourcesInput, ListResourcesOutput> {
        return ClientRuntime.PaginatorSequence<ListResourcesInput, ListResourcesOutput>(input: input, inputKey: \.nextToken, outputKey: \.nextToken, paginationFunction: self.listResources(input:))
    }
}

extension ListResourcesInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> ListResourcesInput {
        return ListResourcesInput(
            filters: self.filters,
            maxResults: self.maxResults,
            nextToken: token,
            viewArn: self.viewArn
        )}
}

extension PaginatorSequence where OperationStackInput == ListResourcesInput, OperationStackOutput == ListResourcesOutput {
    /// This paginator transforms the `AsyncSequence` returned by `listResourcesPaginated`
    /// to access the nested member `[ResourceExplorer2ClientTypes.Resource]`
    /// - Returns: `[ResourceExplorer2ClientTypes.Resource]`
    public func resources() async throws -> [ResourceExplorer2ClientTypes.Resource] {
        return try await self.asyncCompactMap { item in item.resources }
    }
}
extension ResourceExplorer2Client {
    /// Paginate over `[ListSupportedResourceTypesOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[ListSupportedResourceTypesInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `ListSupportedResourceTypesOutput`
    public func listSupportedResourceTypesPaginated(input: ListSupportedResourceTypesInput) -> ClientRuntime.PaginatorSequence<ListSupportedResourceTypesInput, ListSupportedResourceTypesOutput> {
        return ClientRuntime.PaginatorSequence<ListSupportedResourceTypesInput, ListSupportedResourceTypesOutput>(input: input, inputKey: \.nextToken, outputKey: \.nextToken, paginationFunction: self.listSupportedResourceTypes(input:))
    }
}

extension ListSupportedResourceTypesInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> ListSupportedResourceTypesInput {
        return ListSupportedResourceTypesInput(
            maxResults: self.maxResults,
            nextToken: token
        )}
}

extension PaginatorSequence where OperationStackInput == ListSupportedResourceTypesInput, OperationStackOutput == ListSupportedResourceTypesOutput {
    /// This paginator transforms the `AsyncSequence` returned by `listSupportedResourceTypesPaginated`
    /// to access the nested member `[ResourceExplorer2ClientTypes.SupportedResourceType]`
    /// - Returns: `[ResourceExplorer2ClientTypes.SupportedResourceType]`
    public func resourceTypes() async throws -> [ResourceExplorer2ClientTypes.SupportedResourceType] {
        return try await self.asyncCompactMap { item in item.resourceTypes }
    }
}
extension ResourceExplorer2Client {
    /// Paginate over `[SearchOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[SearchInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `SearchOutput`
    public func searchPaginated(input: SearchInput) -> ClientRuntime.PaginatorSequence<SearchInput, SearchOutput> {
        return ClientRuntime.PaginatorSequence<SearchInput, SearchOutput>(input: input, inputKey: \.nextToken, outputKey: \.nextToken, paginationFunction: self.search(input:))
    }
}

extension SearchInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> SearchInput {
        return SearchInput(
            maxResults: self.maxResults,
            nextToken: token,
            queryString: self.queryString,
            viewArn: self.viewArn
        )}
}

extension PaginatorSequence where OperationStackInput == SearchInput, OperationStackOutput == SearchOutput {
    /// This paginator transforms the `AsyncSequence` returned by `searchPaginated`
    /// to access the nested member `[ResourceExplorer2ClientTypes.Resource]`
    /// - Returns: `[ResourceExplorer2ClientTypes.Resource]`
    public func resources() async throws -> [ResourceExplorer2ClientTypes.Resource] {
        return try await self.asyncCompactMap { item in item.resources }
    }
}
