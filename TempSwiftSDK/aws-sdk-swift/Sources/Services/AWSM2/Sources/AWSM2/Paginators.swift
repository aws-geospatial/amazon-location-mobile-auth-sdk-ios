//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

// Code generated by smithy-swift-codegen. DO NOT EDIT!

import protocol ClientRuntime.PaginateToken
import struct ClientRuntime.PaginatorSequence

extension M2Client {
    /// Paginate over `[ListEngineVersionsOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[ListEngineVersionsInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `ListEngineVersionsOutput`
    public func listEngineVersionsPaginated(input: ListEngineVersionsInput) -> ClientRuntime.PaginatorSequence<ListEngineVersionsInput, ListEngineVersionsOutput> {
        return ClientRuntime.PaginatorSequence<ListEngineVersionsInput, ListEngineVersionsOutput>(input: input, inputKey: \.nextToken, outputKey: \.nextToken, paginationFunction: self.listEngineVersions(input:))
    }
}

extension ListEngineVersionsInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> ListEngineVersionsInput {
        return ListEngineVersionsInput(
            engineType: self.engineType,
            maxResults: self.maxResults,
            nextToken: token
        )}
}

extension PaginatorSequence where OperationStackInput == ListEngineVersionsInput, OperationStackOutput == ListEngineVersionsOutput {
    /// This paginator transforms the `AsyncSequence` returned by `listEngineVersionsPaginated`
    /// to access the nested member `[M2ClientTypes.EngineVersionsSummary]`
    /// - Returns: `[M2ClientTypes.EngineVersionsSummary]`
    public func engineVersions() async throws -> [M2ClientTypes.EngineVersionsSummary] {
        return try await self.asyncCompactMap { item in item.engineVersions }
    }
}
