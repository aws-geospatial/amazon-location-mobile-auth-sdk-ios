//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

// Code generated by smithy-swift-codegen. DO NOT EDIT!

import protocol ClientRuntime.PaginateToken
import struct ClientRuntime.PaginatorSequence

extension WorkSpacesWebClient {
    /// Paginate over `[ListSessionsOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[ListSessionsInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `ListSessionsOutput`
    public func listSessionsPaginated(input: ListSessionsInput) -> ClientRuntime.PaginatorSequence<ListSessionsInput, ListSessionsOutput> {
        return ClientRuntime.PaginatorSequence<ListSessionsInput, ListSessionsOutput>(input: input, inputKey: \.nextToken, outputKey: \.nextToken, paginationFunction: self.listSessions(input:))
    }
}

extension ListSessionsInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> ListSessionsInput {
        return ListSessionsInput(
            maxResults: self.maxResults,
            nextToken: token,
            portalId: self.portalId,
            sessionId: self.sessionId,
            sortBy: self.sortBy,
            status: self.status,
            username: self.username
        )}
}

extension PaginatorSequence where OperationStackInput == ListSessionsInput, OperationStackOutput == ListSessionsOutput {
    /// This paginator transforms the `AsyncSequence` returned by `listSessionsPaginated`
    /// to access the nested member `[WorkSpacesWebClientTypes.SessionSummary]`
    /// - Returns: `[WorkSpacesWebClientTypes.SessionSummary]`
    public func sessions() async throws -> [WorkSpacesWebClientTypes.SessionSummary] {
        return try await self.asyncCompactMap { item in item.sessions }
    }
}
