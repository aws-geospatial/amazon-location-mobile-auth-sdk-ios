//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

// Code generated by smithy-swift-codegen. DO NOT EDIT!

import protocol ClientRuntime.PaginateToken
import struct ClientRuntime.PaginatorSequence

extension KendraRankingClient {
    /// Paginate over `[ListRescoreExecutionPlansOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[ListRescoreExecutionPlansInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `ListRescoreExecutionPlansOutput`
    public func listRescoreExecutionPlansPaginated(input: ListRescoreExecutionPlansInput) -> ClientRuntime.PaginatorSequence<ListRescoreExecutionPlansInput, ListRescoreExecutionPlansOutput> {
        return ClientRuntime.PaginatorSequence<ListRescoreExecutionPlansInput, ListRescoreExecutionPlansOutput>(input: input, inputKey: \.nextToken, outputKey: \.nextToken, paginationFunction: self.listRescoreExecutionPlans(input:))
    }
}

extension ListRescoreExecutionPlansInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> ListRescoreExecutionPlansInput {
        return ListRescoreExecutionPlansInput(
            maxResults: self.maxResults,
            nextToken: token
        )}
}
