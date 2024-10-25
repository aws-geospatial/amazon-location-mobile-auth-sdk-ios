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

extension LakeFormationClient {
    /// Paginate over `[GetEffectivePermissionsForPathOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[GetEffectivePermissionsForPathInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `GetEffectivePermissionsForPathOutput`
    public func getEffectivePermissionsForPathPaginated(input: GetEffectivePermissionsForPathInput) -> ClientRuntime.PaginatorSequence<GetEffectivePermissionsForPathInput, GetEffectivePermissionsForPathOutput> {
        return ClientRuntime.PaginatorSequence<GetEffectivePermissionsForPathInput, GetEffectivePermissionsForPathOutput>(input: input, inputKey: \.nextToken, outputKey: \.nextToken, paginationFunction: self.getEffectivePermissionsForPath(input:))
    }
}

extension GetEffectivePermissionsForPathInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> GetEffectivePermissionsForPathInput {
        return GetEffectivePermissionsForPathInput(
            catalogId: self.catalogId,
            maxResults: self.maxResults,
            nextToken: token,
            resourceArn: self.resourceArn
        )}
}
extension LakeFormationClient {
    /// Paginate over `[GetTableObjectsOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[GetTableObjectsInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `GetTableObjectsOutput`
    public func getTableObjectsPaginated(input: GetTableObjectsInput) -> ClientRuntime.PaginatorSequence<GetTableObjectsInput, GetTableObjectsOutput> {
        return ClientRuntime.PaginatorSequence<GetTableObjectsInput, GetTableObjectsOutput>(input: input, inputKey: \.nextToken, outputKey: \.nextToken, paginationFunction: self.getTableObjects(input:))
    }
}

extension GetTableObjectsInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> GetTableObjectsInput {
        return GetTableObjectsInput(
            catalogId: self.catalogId,
            databaseName: self.databaseName,
            maxResults: self.maxResults,
            nextToken: token,
            partitionPredicate: self.partitionPredicate,
            queryAsOfTime: self.queryAsOfTime,
            tableName: self.tableName,
            transactionId: self.transactionId
        )}
}
extension LakeFormationClient {
    /// Paginate over `[GetWorkUnitsOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[GetWorkUnitsInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `GetWorkUnitsOutput`
    public func getWorkUnitsPaginated(input: GetWorkUnitsInput) -> ClientRuntime.PaginatorSequence<GetWorkUnitsInput, GetWorkUnitsOutput> {
        return ClientRuntime.PaginatorSequence<GetWorkUnitsInput, GetWorkUnitsOutput>(input: input, inputKey: \.nextToken, outputKey: \.nextToken, paginationFunction: self.getWorkUnits(input:))
    }
}

extension GetWorkUnitsInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> GetWorkUnitsInput {
        return GetWorkUnitsInput(
            nextToken: token,
            pageSize: self.pageSize,
            queryId: self.queryId
        )}
}

extension PaginatorSequence where OperationStackInput == GetWorkUnitsInput, OperationStackOutput == GetWorkUnitsOutput {
    /// This paginator transforms the `AsyncSequence` returned by `getWorkUnitsPaginated`
    /// to access the nested member `[LakeFormationClientTypes.WorkUnitRange]`
    /// - Returns: `[LakeFormationClientTypes.WorkUnitRange]`
    public func workUnitRanges() async throws -> [LakeFormationClientTypes.WorkUnitRange] {
        return try await self.asyncCompactMap { item in item.workUnitRanges }
    }
}
extension LakeFormationClient {
    /// Paginate over `[ListDataCellsFilterOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[ListDataCellsFilterInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `ListDataCellsFilterOutput`
    public func listDataCellsFilterPaginated(input: ListDataCellsFilterInput) -> ClientRuntime.PaginatorSequence<ListDataCellsFilterInput, ListDataCellsFilterOutput> {
        return ClientRuntime.PaginatorSequence<ListDataCellsFilterInput, ListDataCellsFilterOutput>(input: input, inputKey: \.nextToken, outputKey: \.nextToken, paginationFunction: self.listDataCellsFilter(input:))
    }
}

extension ListDataCellsFilterInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> ListDataCellsFilterInput {
        return ListDataCellsFilterInput(
            maxResults: self.maxResults,
            nextToken: token,
            table: self.table
        )}
}

extension PaginatorSequence where OperationStackInput == ListDataCellsFilterInput, OperationStackOutput == ListDataCellsFilterOutput {
    /// This paginator transforms the `AsyncSequence` returned by `listDataCellsFilterPaginated`
    /// to access the nested member `[LakeFormationClientTypes.DataCellsFilter]`
    /// - Returns: `[LakeFormationClientTypes.DataCellsFilter]`
    public func dataCellsFilters() async throws -> [LakeFormationClientTypes.DataCellsFilter] {
        return try await self.asyncCompactMap { item in item.dataCellsFilters }
    }
}
extension LakeFormationClient {
    /// Paginate over `[ListLakeFormationOptInsOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[ListLakeFormationOptInsInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `ListLakeFormationOptInsOutput`
    public func listLakeFormationOptInsPaginated(input: ListLakeFormationOptInsInput) -> ClientRuntime.PaginatorSequence<ListLakeFormationOptInsInput, ListLakeFormationOptInsOutput> {
        return ClientRuntime.PaginatorSequence<ListLakeFormationOptInsInput, ListLakeFormationOptInsOutput>(input: input, inputKey: \.nextToken, outputKey: \.nextToken, paginationFunction: self.listLakeFormationOptIns(input:))
    }
}

extension ListLakeFormationOptInsInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> ListLakeFormationOptInsInput {
        return ListLakeFormationOptInsInput(
            maxResults: self.maxResults,
            nextToken: token,
            principal: self.principal,
            resource: self.resource
        )}
}
extension LakeFormationClient {
    /// Paginate over `[ListLFTagsOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[ListLFTagsInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `ListLFTagsOutput`
    public func listLFTagsPaginated(input: ListLFTagsInput) -> ClientRuntime.PaginatorSequence<ListLFTagsInput, ListLFTagsOutput> {
        return ClientRuntime.PaginatorSequence<ListLFTagsInput, ListLFTagsOutput>(input: input, inputKey: \.nextToken, outputKey: \.nextToken, paginationFunction: self.listLFTags(input:))
    }
}

extension ListLFTagsInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> ListLFTagsInput {
        return ListLFTagsInput(
            catalogId: self.catalogId,
            maxResults: self.maxResults,
            nextToken: token,
            resourceShareType: self.resourceShareType
        )}
}

extension PaginatorSequence where OperationStackInput == ListLFTagsInput, OperationStackOutput == ListLFTagsOutput {
    /// This paginator transforms the `AsyncSequence` returned by `listLFTagsPaginated`
    /// to access the nested member `[LakeFormationClientTypes.LFTagPair]`
    /// - Returns: `[LakeFormationClientTypes.LFTagPair]`
    public func lfTags() async throws -> [LakeFormationClientTypes.LFTagPair] {
        return try await self.asyncCompactMap { item in item.lfTags }
    }
}
extension LakeFormationClient {
    /// Paginate over `[ListPermissionsOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[ListPermissionsInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `ListPermissionsOutput`
    public func listPermissionsPaginated(input: ListPermissionsInput) -> ClientRuntime.PaginatorSequence<ListPermissionsInput, ListPermissionsOutput> {
        return ClientRuntime.PaginatorSequence<ListPermissionsInput, ListPermissionsOutput>(input: input, inputKey: \.nextToken, outputKey: \.nextToken, paginationFunction: self.listPermissions(input:))
    }
}

extension ListPermissionsInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> ListPermissionsInput {
        return ListPermissionsInput(
            catalogId: self.catalogId,
            includeRelated: self.includeRelated,
            maxResults: self.maxResults,
            nextToken: token,
            principal: self.principal,
            resource: self.resource,
            resourceType: self.resourceType
        )}
}
extension LakeFormationClient {
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
            filterConditionList: self.filterConditionList,
            maxResults: self.maxResults,
            nextToken: token
        )}
}
extension LakeFormationClient {
    /// Paginate over `[ListTableStorageOptimizersOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[ListTableStorageOptimizersInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `ListTableStorageOptimizersOutput`
    public func listTableStorageOptimizersPaginated(input: ListTableStorageOptimizersInput) -> ClientRuntime.PaginatorSequence<ListTableStorageOptimizersInput, ListTableStorageOptimizersOutput> {
        return ClientRuntime.PaginatorSequence<ListTableStorageOptimizersInput, ListTableStorageOptimizersOutput>(input: input, inputKey: \.nextToken, outputKey: \.nextToken, paginationFunction: self.listTableStorageOptimizers(input:))
    }
}

extension ListTableStorageOptimizersInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> ListTableStorageOptimizersInput {
        return ListTableStorageOptimizersInput(
            catalogId: self.catalogId,
            databaseName: self.databaseName,
            maxResults: self.maxResults,
            nextToken: token,
            storageOptimizerType: self.storageOptimizerType,
            tableName: self.tableName
        )}
}
extension LakeFormationClient {
    /// Paginate over `[ListTransactionsOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[ListTransactionsInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `ListTransactionsOutput`
    public func listTransactionsPaginated(input: ListTransactionsInput) -> ClientRuntime.PaginatorSequence<ListTransactionsInput, ListTransactionsOutput> {
        return ClientRuntime.PaginatorSequence<ListTransactionsInput, ListTransactionsOutput>(input: input, inputKey: \.nextToken, outputKey: \.nextToken, paginationFunction: self.listTransactions(input:))
    }
}

extension ListTransactionsInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> ListTransactionsInput {
        return ListTransactionsInput(
            catalogId: self.catalogId,
            maxResults: self.maxResults,
            nextToken: token,
            statusFilter: self.statusFilter
        )}
}
extension LakeFormationClient {
    /// Paginate over `[SearchDatabasesByLFTagsOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[SearchDatabasesByLFTagsInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `SearchDatabasesByLFTagsOutput`
    public func searchDatabasesByLFTagsPaginated(input: SearchDatabasesByLFTagsInput) -> ClientRuntime.PaginatorSequence<SearchDatabasesByLFTagsInput, SearchDatabasesByLFTagsOutput> {
        return ClientRuntime.PaginatorSequence<SearchDatabasesByLFTagsInput, SearchDatabasesByLFTagsOutput>(input: input, inputKey: \.nextToken, outputKey: \.nextToken, paginationFunction: self.searchDatabasesByLFTags(input:))
    }
}

extension SearchDatabasesByLFTagsInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> SearchDatabasesByLFTagsInput {
        return SearchDatabasesByLFTagsInput(
            catalogId: self.catalogId,
            expression: self.expression,
            maxResults: self.maxResults,
            nextToken: token
        )}
}

extension PaginatorSequence where OperationStackInput == SearchDatabasesByLFTagsInput, OperationStackOutput == SearchDatabasesByLFTagsOutput {
    /// This paginator transforms the `AsyncSequence` returned by `searchDatabasesByLFTagsPaginated`
    /// to access the nested member `[LakeFormationClientTypes.TaggedDatabase]`
    /// - Returns: `[LakeFormationClientTypes.TaggedDatabase]`
    public func databaseList() async throws -> [LakeFormationClientTypes.TaggedDatabase] {
        return try await self.asyncCompactMap { item in item.databaseList }
    }
}
extension LakeFormationClient {
    /// Paginate over `[SearchTablesByLFTagsOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[SearchTablesByLFTagsInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `SearchTablesByLFTagsOutput`
    public func searchTablesByLFTagsPaginated(input: SearchTablesByLFTagsInput) -> ClientRuntime.PaginatorSequence<SearchTablesByLFTagsInput, SearchTablesByLFTagsOutput> {
        return ClientRuntime.PaginatorSequence<SearchTablesByLFTagsInput, SearchTablesByLFTagsOutput>(input: input, inputKey: \.nextToken, outputKey: \.nextToken, paginationFunction: self.searchTablesByLFTags(input:))
    }
}

extension SearchTablesByLFTagsInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> SearchTablesByLFTagsInput {
        return SearchTablesByLFTagsInput(
            catalogId: self.catalogId,
            expression: self.expression,
            maxResults: self.maxResults,
            nextToken: token
        )}
}

extension PaginatorSequence where OperationStackInput == SearchTablesByLFTagsInput, OperationStackOutput == SearchTablesByLFTagsOutput {
    /// This paginator transforms the `AsyncSequence` returned by `searchTablesByLFTagsPaginated`
    /// to access the nested member `[LakeFormationClientTypes.TaggedTable]`
    /// - Returns: `[LakeFormationClientTypes.TaggedTable]`
    public func tableList() async throws -> [LakeFormationClientTypes.TaggedTable] {
        return try await self.asyncCompactMap { item in item.tableList }
    }
}
