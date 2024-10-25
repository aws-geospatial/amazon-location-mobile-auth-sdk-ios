//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

// Code generated by smithy-swift-codegen. DO NOT EDIT!

import Foundation
import protocol ClientRuntime.PaginateToken
import struct ClientRuntime.PaginatorSequence

extension CloudTrailClient {
    /// Paginate over `[GetQueryResultsOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[GetQueryResultsInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `GetQueryResultsOutput`
    public func getQueryResultsPaginated(input: GetQueryResultsInput) -> ClientRuntime.PaginatorSequence<GetQueryResultsInput, GetQueryResultsOutput> {
        return ClientRuntime.PaginatorSequence<GetQueryResultsInput, GetQueryResultsOutput>(input: input, inputKey: \.nextToken, outputKey: \.nextToken, paginationFunction: self.getQueryResults(input:))
    }
}

extension GetQueryResultsInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> GetQueryResultsInput {
        return GetQueryResultsInput(
            eventDataStore: self.eventDataStore,
            maxQueryResults: self.maxQueryResults,
            nextToken: token,
            queryId: self.queryId
        )}
}
extension CloudTrailClient {
    /// Paginate over `[ListChannelsOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[ListChannelsInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `ListChannelsOutput`
    public func listChannelsPaginated(input: ListChannelsInput) -> ClientRuntime.PaginatorSequence<ListChannelsInput, ListChannelsOutput> {
        return ClientRuntime.PaginatorSequence<ListChannelsInput, ListChannelsOutput>(input: input, inputKey: \.nextToken, outputKey: \.nextToken, paginationFunction: self.listChannels(input:))
    }
}

extension ListChannelsInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> ListChannelsInput {
        return ListChannelsInput(
            maxResults: self.maxResults,
            nextToken: token
        )}
}
extension CloudTrailClient {
    /// Paginate over `[ListEventDataStoresOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[ListEventDataStoresInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `ListEventDataStoresOutput`
    public func listEventDataStoresPaginated(input: ListEventDataStoresInput) -> ClientRuntime.PaginatorSequence<ListEventDataStoresInput, ListEventDataStoresOutput> {
        return ClientRuntime.PaginatorSequence<ListEventDataStoresInput, ListEventDataStoresOutput>(input: input, inputKey: \.nextToken, outputKey: \.nextToken, paginationFunction: self.listEventDataStores(input:))
    }
}

extension ListEventDataStoresInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> ListEventDataStoresInput {
        return ListEventDataStoresInput(
            maxResults: self.maxResults,
            nextToken: token
        )}
}
extension CloudTrailClient {
    /// Paginate over `[ListImportFailuresOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[ListImportFailuresInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `ListImportFailuresOutput`
    public func listImportFailuresPaginated(input: ListImportFailuresInput) -> ClientRuntime.PaginatorSequence<ListImportFailuresInput, ListImportFailuresOutput> {
        return ClientRuntime.PaginatorSequence<ListImportFailuresInput, ListImportFailuresOutput>(input: input, inputKey: \.nextToken, outputKey: \.nextToken, paginationFunction: self.listImportFailures(input:))
    }
}

extension ListImportFailuresInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> ListImportFailuresInput {
        return ListImportFailuresInput(
            importId: self.importId,
            maxResults: self.maxResults,
            nextToken: token
        )}
}

extension PaginatorSequence where OperationStackInput == ListImportFailuresInput, OperationStackOutput == ListImportFailuresOutput {
    /// This paginator transforms the `AsyncSequence` returned by `listImportFailuresPaginated`
    /// to access the nested member `[CloudTrailClientTypes.ImportFailureListItem]`
    /// - Returns: `[CloudTrailClientTypes.ImportFailureListItem]`
    public func failures() async throws -> [CloudTrailClientTypes.ImportFailureListItem] {
        return try await self.asyncCompactMap { item in item.failures }
    }
}
extension CloudTrailClient {
    /// Paginate over `[ListImportsOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[ListImportsInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `ListImportsOutput`
    public func listImportsPaginated(input: ListImportsInput) -> ClientRuntime.PaginatorSequence<ListImportsInput, ListImportsOutput> {
        return ClientRuntime.PaginatorSequence<ListImportsInput, ListImportsOutput>(input: input, inputKey: \.nextToken, outputKey: \.nextToken, paginationFunction: self.listImports(input:))
    }
}

extension ListImportsInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> ListImportsInput {
        return ListImportsInput(
            destination: self.destination,
            importStatus: self.importStatus,
            maxResults: self.maxResults,
            nextToken: token
        )}
}

extension PaginatorSequence where OperationStackInput == ListImportsInput, OperationStackOutput == ListImportsOutput {
    /// This paginator transforms the `AsyncSequence` returned by `listImportsPaginated`
    /// to access the nested member `[CloudTrailClientTypes.ImportsListItem]`
    /// - Returns: `[CloudTrailClientTypes.ImportsListItem]`
    public func imports() async throws -> [CloudTrailClientTypes.ImportsListItem] {
        return try await self.asyncCompactMap { item in item.imports }
    }
}
extension CloudTrailClient {
    /// Paginate over `[ListInsightsMetricDataOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[ListInsightsMetricDataInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `ListInsightsMetricDataOutput`
    public func listInsightsMetricDataPaginated(input: ListInsightsMetricDataInput) -> ClientRuntime.PaginatorSequence<ListInsightsMetricDataInput, ListInsightsMetricDataOutput> {
        return ClientRuntime.PaginatorSequence<ListInsightsMetricDataInput, ListInsightsMetricDataOutput>(input: input, inputKey: \.nextToken, outputKey: \.nextToken, paginationFunction: self.listInsightsMetricData(input:))
    }
}

extension ListInsightsMetricDataInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> ListInsightsMetricDataInput {
        return ListInsightsMetricDataInput(
            dataType: self.dataType,
            endTime: self.endTime,
            errorCode: self.errorCode,
            eventName: self.eventName,
            eventSource: self.eventSource,
            insightType: self.insightType,
            maxResults: self.maxResults,
            nextToken: token,
            period: self.period,
            startTime: self.startTime
        )}
}
extension CloudTrailClient {
    /// Paginate over `[ListPublicKeysOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[ListPublicKeysInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `ListPublicKeysOutput`
    public func listPublicKeysPaginated(input: ListPublicKeysInput) -> ClientRuntime.PaginatorSequence<ListPublicKeysInput, ListPublicKeysOutput> {
        return ClientRuntime.PaginatorSequence<ListPublicKeysInput, ListPublicKeysOutput>(input: input, inputKey: \.nextToken, outputKey: \.nextToken, paginationFunction: self.listPublicKeys(input:))
    }
}

extension ListPublicKeysInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> ListPublicKeysInput {
        return ListPublicKeysInput(
            endTime: self.endTime,
            nextToken: token,
            startTime: self.startTime
        )}
}

extension PaginatorSequence where OperationStackInput == ListPublicKeysInput, OperationStackOutput == ListPublicKeysOutput {
    /// This paginator transforms the `AsyncSequence` returned by `listPublicKeysPaginated`
    /// to access the nested member `[CloudTrailClientTypes.PublicKey]`
    /// - Returns: `[CloudTrailClientTypes.PublicKey]`
    public func publicKeyList() async throws -> [CloudTrailClientTypes.PublicKey] {
        return try await self.asyncCompactMap { item in item.publicKeyList }
    }
}
extension CloudTrailClient {
    /// Paginate over `[ListQueriesOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[ListQueriesInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `ListQueriesOutput`
    public func listQueriesPaginated(input: ListQueriesInput) -> ClientRuntime.PaginatorSequence<ListQueriesInput, ListQueriesOutput> {
        return ClientRuntime.PaginatorSequence<ListQueriesInput, ListQueriesOutput>(input: input, inputKey: \.nextToken, outputKey: \.nextToken, paginationFunction: self.listQueries(input:))
    }
}

extension ListQueriesInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> ListQueriesInput {
        return ListQueriesInput(
            endTime: self.endTime,
            eventDataStore: self.eventDataStore,
            maxResults: self.maxResults,
            nextToken: token,
            queryStatus: self.queryStatus,
            startTime: self.startTime
        )}
}
extension CloudTrailClient {
    /// Paginate over `[ListTagsOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[ListTagsInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `ListTagsOutput`
    public func listTagsPaginated(input: ListTagsInput) -> ClientRuntime.PaginatorSequence<ListTagsInput, ListTagsOutput> {
        return ClientRuntime.PaginatorSequence<ListTagsInput, ListTagsOutput>(input: input, inputKey: \.nextToken, outputKey: \.nextToken, paginationFunction: self.listTags(input:))
    }
}

extension ListTagsInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> ListTagsInput {
        return ListTagsInput(
            nextToken: token,
            resourceIdList: self.resourceIdList
        )}
}

extension PaginatorSequence where OperationStackInput == ListTagsInput, OperationStackOutput == ListTagsOutput {
    /// This paginator transforms the `AsyncSequence` returned by `listTagsPaginated`
    /// to access the nested member `[CloudTrailClientTypes.ResourceTag]`
    /// - Returns: `[CloudTrailClientTypes.ResourceTag]`
    public func resourceTagList() async throws -> [CloudTrailClientTypes.ResourceTag] {
        return try await self.asyncCompactMap { item in item.resourceTagList }
    }
}
extension CloudTrailClient {
    /// Paginate over `[ListTrailsOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[ListTrailsInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `ListTrailsOutput`
    public func listTrailsPaginated(input: ListTrailsInput) -> ClientRuntime.PaginatorSequence<ListTrailsInput, ListTrailsOutput> {
        return ClientRuntime.PaginatorSequence<ListTrailsInput, ListTrailsOutput>(input: input, inputKey: \.nextToken, outputKey: \.nextToken, paginationFunction: self.listTrails(input:))
    }
}

extension ListTrailsInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> ListTrailsInput {
        return ListTrailsInput(
            nextToken: token
        )}
}

extension PaginatorSequence where OperationStackInput == ListTrailsInput, OperationStackOutput == ListTrailsOutput {
    /// This paginator transforms the `AsyncSequence` returned by `listTrailsPaginated`
    /// to access the nested member `[CloudTrailClientTypes.TrailInfo]`
    /// - Returns: `[CloudTrailClientTypes.TrailInfo]`
    public func trails() async throws -> [CloudTrailClientTypes.TrailInfo] {
        return try await self.asyncCompactMap { item in item.trails }
    }
}
extension CloudTrailClient {
    /// Paginate over `[LookupEventsOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[LookupEventsInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `LookupEventsOutput`
    public func lookupEventsPaginated(input: LookupEventsInput) -> ClientRuntime.PaginatorSequence<LookupEventsInput, LookupEventsOutput> {
        return ClientRuntime.PaginatorSequence<LookupEventsInput, LookupEventsOutput>(input: input, inputKey: \.nextToken, outputKey: \.nextToken, paginationFunction: self.lookupEvents(input:))
    }
}

extension LookupEventsInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> LookupEventsInput {
        return LookupEventsInput(
            endTime: self.endTime,
            eventCategory: self.eventCategory,
            lookupAttributes: self.lookupAttributes,
            maxResults: self.maxResults,
            nextToken: token,
            startTime: self.startTime
        )}
}

extension PaginatorSequence where OperationStackInput == LookupEventsInput, OperationStackOutput == LookupEventsOutput {
    /// This paginator transforms the `AsyncSequence` returned by `lookupEventsPaginated`
    /// to access the nested member `[CloudTrailClientTypes.Event]`
    /// - Returns: `[CloudTrailClientTypes.Event]`
    public func events() async throws -> [CloudTrailClientTypes.Event] {
        return try await self.asyncCompactMap { item in item.events }
    }
}
