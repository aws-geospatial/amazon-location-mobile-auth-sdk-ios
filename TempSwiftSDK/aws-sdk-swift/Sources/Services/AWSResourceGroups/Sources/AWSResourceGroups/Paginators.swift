//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

// Code generated by smithy-swift-codegen. DO NOT EDIT!

import protocol ClientRuntime.PaginateToken
import struct ClientRuntime.PaginatorSequence

extension ResourceGroupsClient {
    /// Paginate over `[ListGroupingStatusesOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[ListGroupingStatusesInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `ListGroupingStatusesOutput`
    public func listGroupingStatusesPaginated(input: ListGroupingStatusesInput) -> ClientRuntime.PaginatorSequence<ListGroupingStatusesInput, ListGroupingStatusesOutput> {
        return ClientRuntime.PaginatorSequence<ListGroupingStatusesInput, ListGroupingStatusesOutput>(input: input, inputKey: \.nextToken, outputKey: \.nextToken, paginationFunction: self.listGroupingStatuses(input:))
    }
}

extension ListGroupingStatusesInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> ListGroupingStatusesInput {
        return ListGroupingStatusesInput(
            filters: self.filters,
            group: self.group,
            maxResults: self.maxResults,
            nextToken: token
        )}
}

extension PaginatorSequence where OperationStackInput == ListGroupingStatusesInput, OperationStackOutput == ListGroupingStatusesOutput {
    /// This paginator transforms the `AsyncSequence` returned by `listGroupingStatusesPaginated`
    /// to access the nested member `[ResourceGroupsClientTypes.GroupingStatusesItem]`
    /// - Returns: `[ResourceGroupsClientTypes.GroupingStatusesItem]`
    public func groupingStatuses() async throws -> [ResourceGroupsClientTypes.GroupingStatusesItem] {
        return try await self.asyncCompactMap { item in item.groupingStatuses }
    }
}
extension ResourceGroupsClient {
    /// Paginate over `[ListGroupResourcesOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[ListGroupResourcesInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `ListGroupResourcesOutput`
    public func listGroupResourcesPaginated(input: ListGroupResourcesInput) -> ClientRuntime.PaginatorSequence<ListGroupResourcesInput, ListGroupResourcesOutput> {
        return ClientRuntime.PaginatorSequence<ListGroupResourcesInput, ListGroupResourcesOutput>(input: input, inputKey: \.nextToken, outputKey: \.nextToken, paginationFunction: self.listGroupResources(input:))
    }
}

extension ListGroupResourcesInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> ListGroupResourcesInput {
        return ListGroupResourcesInput(
            filters: self.filters,
            group: self.group,
            groupName: self.groupName,
            maxResults: self.maxResults,
            nextToken: token
        )}
}

extension PaginatorSequence where OperationStackInput == ListGroupResourcesInput, OperationStackOutput == ListGroupResourcesOutput {
    /// This paginator transforms the `AsyncSequence` returned by `listGroupResourcesPaginated`
    /// to access the nested member `[ResourceGroupsClientTypes.ResourceIdentifier]`
    /// - Returns: `[ResourceGroupsClientTypes.ResourceIdentifier]`
    public func resourceIdentifiers() async throws -> [ResourceGroupsClientTypes.ResourceIdentifier] {
        return try await self.asyncCompactMap { item in item.resourceIdentifiers }
    }
}
extension ResourceGroupsClient {
    /// Paginate over `[ListGroupsOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[ListGroupsInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `ListGroupsOutput`
    public func listGroupsPaginated(input: ListGroupsInput) -> ClientRuntime.PaginatorSequence<ListGroupsInput, ListGroupsOutput> {
        return ClientRuntime.PaginatorSequence<ListGroupsInput, ListGroupsOutput>(input: input, inputKey: \.nextToken, outputKey: \.nextToken, paginationFunction: self.listGroups(input:))
    }
}

extension ListGroupsInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> ListGroupsInput {
        return ListGroupsInput(
            filters: self.filters,
            maxResults: self.maxResults,
            nextToken: token
        )}
}

extension PaginatorSequence where OperationStackInput == ListGroupsInput, OperationStackOutput == ListGroupsOutput {
    /// This paginator transforms the `AsyncSequence` returned by `listGroupsPaginated`
    /// to access the nested member `[ResourceGroupsClientTypes.GroupIdentifier]`
    /// - Returns: `[ResourceGroupsClientTypes.GroupIdentifier]`
    public func groupIdentifiers() async throws -> [ResourceGroupsClientTypes.GroupIdentifier] {
        return try await self.asyncCompactMap { item in item.groupIdentifiers }
    }
}
extension ResourceGroupsClient {
    /// Paginate over `[ListTagSyncTasksOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[ListTagSyncTasksInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `ListTagSyncTasksOutput`
    public func listTagSyncTasksPaginated(input: ListTagSyncTasksInput) -> ClientRuntime.PaginatorSequence<ListTagSyncTasksInput, ListTagSyncTasksOutput> {
        return ClientRuntime.PaginatorSequence<ListTagSyncTasksInput, ListTagSyncTasksOutput>(input: input, inputKey: \.nextToken, outputKey: \.nextToken, paginationFunction: self.listTagSyncTasks(input:))
    }
}

extension ListTagSyncTasksInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> ListTagSyncTasksInput {
        return ListTagSyncTasksInput(
            filters: self.filters,
            maxResults: self.maxResults,
            nextToken: token
        )}
}

extension PaginatorSequence where OperationStackInput == ListTagSyncTasksInput, OperationStackOutput == ListTagSyncTasksOutput {
    /// This paginator transforms the `AsyncSequence` returned by `listTagSyncTasksPaginated`
    /// to access the nested member `[ResourceGroupsClientTypes.TagSyncTaskItem]`
    /// - Returns: `[ResourceGroupsClientTypes.TagSyncTaskItem]`
    public func tagSyncTasks() async throws -> [ResourceGroupsClientTypes.TagSyncTaskItem] {
        return try await self.asyncCompactMap { item in item.tagSyncTasks }
    }
}
extension ResourceGroupsClient {
    /// Paginate over `[SearchResourcesOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[SearchResourcesInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `SearchResourcesOutput`
    public func searchResourcesPaginated(input: SearchResourcesInput) -> ClientRuntime.PaginatorSequence<SearchResourcesInput, SearchResourcesOutput> {
        return ClientRuntime.PaginatorSequence<SearchResourcesInput, SearchResourcesOutput>(input: input, inputKey: \.nextToken, outputKey: \.nextToken, paginationFunction: self.searchResources(input:))
    }
}

extension SearchResourcesInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> SearchResourcesInput {
        return SearchResourcesInput(
            maxResults: self.maxResults,
            nextToken: token,
            resourceQuery: self.resourceQuery
        )}
}

extension PaginatorSequence where OperationStackInput == SearchResourcesInput, OperationStackOutput == SearchResourcesOutput {
    /// This paginator transforms the `AsyncSequence` returned by `searchResourcesPaginated`
    /// to access the nested member `[ResourceGroupsClientTypes.ResourceIdentifier]`
    /// - Returns: `[ResourceGroupsClientTypes.ResourceIdentifier]`
    public func resourceIdentifiers() async throws -> [ResourceGroupsClientTypes.ResourceIdentifier] {
        return try await self.asyncCompactMap { item in item.resourceIdentifiers }
    }
}
