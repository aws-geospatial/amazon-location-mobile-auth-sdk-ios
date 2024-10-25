//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

// Code generated by smithy-swift-codegen. DO NOT EDIT!

import protocol ClientRuntime.PaginateToken
import struct ClientRuntime.PaginatorSequence

extension DynamoDBClient {
    /// Paginate over `[ListContributorInsightsOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[ListContributorInsightsInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `ListContributorInsightsOutput`
    public func listContributorInsightsPaginated(input: ListContributorInsightsInput) -> ClientRuntime.PaginatorSequence<ListContributorInsightsInput, ListContributorInsightsOutput> {
        return ClientRuntime.PaginatorSequence<ListContributorInsightsInput, ListContributorInsightsOutput>(input: input, inputKey: \.nextToken, outputKey: \.nextToken, paginationFunction: self.listContributorInsights(input:))
    }
}

extension ListContributorInsightsInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> ListContributorInsightsInput {
        return ListContributorInsightsInput(
            maxResults: self.maxResults,
            nextToken: token,
            tableName: self.tableName
        )}
}
extension DynamoDBClient {
    /// Paginate over `[ListExportsOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[ListExportsInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `ListExportsOutput`
    public func listExportsPaginated(input: ListExportsInput) -> ClientRuntime.PaginatorSequence<ListExportsInput, ListExportsOutput> {
        return ClientRuntime.PaginatorSequence<ListExportsInput, ListExportsOutput>(input: input, inputKey: \.nextToken, outputKey: \.nextToken, paginationFunction: self.listExports(input:))
    }
}

extension ListExportsInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> ListExportsInput {
        return ListExportsInput(
            maxResults: self.maxResults,
            nextToken: token,
            tableArn: self.tableArn
        )}
}
extension DynamoDBClient {
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
            nextToken: token,
            pageSize: self.pageSize,
            tableArn: self.tableArn
        )}
}
extension DynamoDBClient {
    /// Paginate over `[ListTablesOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[ListTablesInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `ListTablesOutput`
    public func listTablesPaginated(input: ListTablesInput) -> ClientRuntime.PaginatorSequence<ListTablesInput, ListTablesOutput> {
        return ClientRuntime.PaginatorSequence<ListTablesInput, ListTablesOutput>(input: input, inputKey: \.exclusiveStartTableName, outputKey: \.lastEvaluatedTableName, paginationFunction: self.listTables(input:))
    }
}

extension ListTablesInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> ListTablesInput {
        return ListTablesInput(
            exclusiveStartTableName: token,
            limit: self.limit
        )}
}

extension PaginatorSequence where OperationStackInput == ListTablesInput, OperationStackOutput == ListTablesOutput {
    /// This paginator transforms the `AsyncSequence` returned by `listTablesPaginated`
    /// to access the nested member `[Swift.String]`
    /// - Returns: `[Swift.String]`
    public func tableNames() async throws -> [Swift.String] {
        return try await self.asyncCompactMap { item in item.tableNames }
    }
}
extension DynamoDBClient {
    /// Paginate over `[QueryOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[QueryInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `QueryOutput`
    public func queryPaginated(input: QueryInput) -> ClientRuntime.PaginatorSequence<QueryInput, QueryOutput> {
        return ClientRuntime.PaginatorSequence<QueryInput, QueryOutput>(input: input, inputKey: \.exclusiveStartKey, outputKey: \.lastEvaluatedKey, paginationFunction: self.query(input:))
    }
}

extension QueryInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: [Swift.String: DynamoDBClientTypes.AttributeValue]) -> QueryInput {
        return QueryInput(
            attributesToGet: self.attributesToGet,
            conditionalOperator: self.conditionalOperator,
            consistentRead: self.consistentRead,
            exclusiveStartKey: token,
            expressionAttributeNames: self.expressionAttributeNames,
            expressionAttributeValues: self.expressionAttributeValues,
            filterExpression: self.filterExpression,
            indexName: self.indexName,
            keyConditionExpression: self.keyConditionExpression,
            keyConditions: self.keyConditions,
            limit: self.limit,
            projectionExpression: self.projectionExpression,
            queryFilter: self.queryFilter,
            returnConsumedCapacity: self.returnConsumedCapacity,
            scanIndexForward: self.scanIndexForward,
            select: self.select,
            tableName: self.tableName
        )}
}

extension PaginatorSequence where OperationStackInput == QueryInput, OperationStackOutput == QueryOutput {
    /// This paginator transforms the `AsyncSequence` returned by `queryPaginated`
    /// to access the nested member `[[Swift.String: DynamoDBClientTypes.AttributeValue]]`
    /// - Returns: `[[Swift.String: DynamoDBClientTypes.AttributeValue]]`
    public func items() async throws -> [[Swift.String: DynamoDBClientTypes.AttributeValue]] {
        return try await self.asyncCompactMap { item in item.items }
    }
}
extension DynamoDBClient {
    /// Paginate over `[ScanOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[ScanInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `ScanOutput`
    public func scanPaginated(input: ScanInput) -> ClientRuntime.PaginatorSequence<ScanInput, ScanOutput> {
        return ClientRuntime.PaginatorSequence<ScanInput, ScanOutput>(input: input, inputKey: \.exclusiveStartKey, outputKey: \.lastEvaluatedKey, paginationFunction: self.scan(input:))
    }
}

extension ScanInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: [Swift.String: DynamoDBClientTypes.AttributeValue]) -> ScanInput {
        return ScanInput(
            attributesToGet: self.attributesToGet,
            conditionalOperator: self.conditionalOperator,
            consistentRead: self.consistentRead,
            exclusiveStartKey: token,
            expressionAttributeNames: self.expressionAttributeNames,
            expressionAttributeValues: self.expressionAttributeValues,
            filterExpression: self.filterExpression,
            indexName: self.indexName,
            limit: self.limit,
            projectionExpression: self.projectionExpression,
            returnConsumedCapacity: self.returnConsumedCapacity,
            scanFilter: self.scanFilter,
            segment: self.segment,
            select: self.select,
            tableName: self.tableName,
            totalSegments: self.totalSegments
        )}
}

extension PaginatorSequence where OperationStackInput == ScanInput, OperationStackOutput == ScanOutput {
    /// This paginator transforms the `AsyncSequence` returned by `scanPaginated`
    /// to access the nested member `[[Swift.String: DynamoDBClientTypes.AttributeValue]]`
    /// - Returns: `[[Swift.String: DynamoDBClientTypes.AttributeValue]]`
    public func items() async throws -> [[Swift.String: DynamoDBClientTypes.AttributeValue]] {
        return try await self.asyncCompactMap { item in item.items }
    }
}
