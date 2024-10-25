//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

// Code generated by smithy-swift-codegen. DO NOT EDIT!

import protocol ClientRuntime.PaginateToken
import struct ClientRuntime.PaginatorSequence

extension AuditManagerClient {
    /// Paginate over `[GetChangeLogsOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[GetChangeLogsInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `GetChangeLogsOutput`
    public func getChangeLogsPaginated(input: GetChangeLogsInput) -> ClientRuntime.PaginatorSequence<GetChangeLogsInput, GetChangeLogsOutput> {
        return ClientRuntime.PaginatorSequence<GetChangeLogsInput, GetChangeLogsOutput>(input: input, inputKey: \.nextToken, outputKey: \.nextToken, paginationFunction: self.getChangeLogs(input:))
    }
}

extension GetChangeLogsInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> GetChangeLogsInput {
        return GetChangeLogsInput(
            assessmentId: self.assessmentId,
            controlId: self.controlId,
            controlSetId: self.controlSetId,
            maxResults: self.maxResults,
            nextToken: token
        )}
}
extension AuditManagerClient {
    /// Paginate over `[GetDelegationsOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[GetDelegationsInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `GetDelegationsOutput`
    public func getDelegationsPaginated(input: GetDelegationsInput) -> ClientRuntime.PaginatorSequence<GetDelegationsInput, GetDelegationsOutput> {
        return ClientRuntime.PaginatorSequence<GetDelegationsInput, GetDelegationsOutput>(input: input, inputKey: \.nextToken, outputKey: \.nextToken, paginationFunction: self.getDelegations(input:))
    }
}

extension GetDelegationsInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> GetDelegationsInput {
        return GetDelegationsInput(
            maxResults: self.maxResults,
            nextToken: token
        )}
}
extension AuditManagerClient {
    /// Paginate over `[GetEvidenceByEvidenceFolderOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[GetEvidenceByEvidenceFolderInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `GetEvidenceByEvidenceFolderOutput`
    public func getEvidenceByEvidenceFolderPaginated(input: GetEvidenceByEvidenceFolderInput) -> ClientRuntime.PaginatorSequence<GetEvidenceByEvidenceFolderInput, GetEvidenceByEvidenceFolderOutput> {
        return ClientRuntime.PaginatorSequence<GetEvidenceByEvidenceFolderInput, GetEvidenceByEvidenceFolderOutput>(input: input, inputKey: \.nextToken, outputKey: \.nextToken, paginationFunction: self.getEvidenceByEvidenceFolder(input:))
    }
}

extension GetEvidenceByEvidenceFolderInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> GetEvidenceByEvidenceFolderInput {
        return GetEvidenceByEvidenceFolderInput(
            assessmentId: self.assessmentId,
            controlSetId: self.controlSetId,
            evidenceFolderId: self.evidenceFolderId,
            maxResults: self.maxResults,
            nextToken: token
        )}
}
extension AuditManagerClient {
    /// Paginate over `[GetEvidenceFoldersByAssessmentOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[GetEvidenceFoldersByAssessmentInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `GetEvidenceFoldersByAssessmentOutput`
    public func getEvidenceFoldersByAssessmentPaginated(input: GetEvidenceFoldersByAssessmentInput) -> ClientRuntime.PaginatorSequence<GetEvidenceFoldersByAssessmentInput, GetEvidenceFoldersByAssessmentOutput> {
        return ClientRuntime.PaginatorSequence<GetEvidenceFoldersByAssessmentInput, GetEvidenceFoldersByAssessmentOutput>(input: input, inputKey: \.nextToken, outputKey: \.nextToken, paginationFunction: self.getEvidenceFoldersByAssessment(input:))
    }
}

extension GetEvidenceFoldersByAssessmentInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> GetEvidenceFoldersByAssessmentInput {
        return GetEvidenceFoldersByAssessmentInput(
            assessmentId: self.assessmentId,
            maxResults: self.maxResults,
            nextToken: token
        )}
}
extension AuditManagerClient {
    /// Paginate over `[GetEvidenceFoldersByAssessmentControlOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[GetEvidenceFoldersByAssessmentControlInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `GetEvidenceFoldersByAssessmentControlOutput`
    public func getEvidenceFoldersByAssessmentControlPaginated(input: GetEvidenceFoldersByAssessmentControlInput) -> ClientRuntime.PaginatorSequence<GetEvidenceFoldersByAssessmentControlInput, GetEvidenceFoldersByAssessmentControlOutput> {
        return ClientRuntime.PaginatorSequence<GetEvidenceFoldersByAssessmentControlInput, GetEvidenceFoldersByAssessmentControlOutput>(input: input, inputKey: \.nextToken, outputKey: \.nextToken, paginationFunction: self.getEvidenceFoldersByAssessmentControl(input:))
    }
}

extension GetEvidenceFoldersByAssessmentControlInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> GetEvidenceFoldersByAssessmentControlInput {
        return GetEvidenceFoldersByAssessmentControlInput(
            assessmentId: self.assessmentId,
            controlId: self.controlId,
            controlSetId: self.controlSetId,
            maxResults: self.maxResults,
            nextToken: token
        )}
}
extension AuditManagerClient {
    /// Paginate over `[ListAssessmentControlInsightsByControlDomainOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[ListAssessmentControlInsightsByControlDomainInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `ListAssessmentControlInsightsByControlDomainOutput`
    public func listAssessmentControlInsightsByControlDomainPaginated(input: ListAssessmentControlInsightsByControlDomainInput) -> ClientRuntime.PaginatorSequence<ListAssessmentControlInsightsByControlDomainInput, ListAssessmentControlInsightsByControlDomainOutput> {
        return ClientRuntime.PaginatorSequence<ListAssessmentControlInsightsByControlDomainInput, ListAssessmentControlInsightsByControlDomainOutput>(input: input, inputKey: \.nextToken, outputKey: \.nextToken, paginationFunction: self.listAssessmentControlInsightsByControlDomain(input:))
    }
}

extension ListAssessmentControlInsightsByControlDomainInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> ListAssessmentControlInsightsByControlDomainInput {
        return ListAssessmentControlInsightsByControlDomainInput(
            assessmentId: self.assessmentId,
            controlDomainId: self.controlDomainId,
            maxResults: self.maxResults,
            nextToken: token
        )}
}
extension AuditManagerClient {
    /// Paginate over `[ListAssessmentFrameworksOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[ListAssessmentFrameworksInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `ListAssessmentFrameworksOutput`
    public func listAssessmentFrameworksPaginated(input: ListAssessmentFrameworksInput) -> ClientRuntime.PaginatorSequence<ListAssessmentFrameworksInput, ListAssessmentFrameworksOutput> {
        return ClientRuntime.PaginatorSequence<ListAssessmentFrameworksInput, ListAssessmentFrameworksOutput>(input: input, inputKey: \.nextToken, outputKey: \.nextToken, paginationFunction: self.listAssessmentFrameworks(input:))
    }
}

extension ListAssessmentFrameworksInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> ListAssessmentFrameworksInput {
        return ListAssessmentFrameworksInput(
            frameworkType: self.frameworkType,
            maxResults: self.maxResults,
            nextToken: token
        )}
}
extension AuditManagerClient {
    /// Paginate over `[ListAssessmentFrameworkShareRequestsOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[ListAssessmentFrameworkShareRequestsInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `ListAssessmentFrameworkShareRequestsOutput`
    public func listAssessmentFrameworkShareRequestsPaginated(input: ListAssessmentFrameworkShareRequestsInput) -> ClientRuntime.PaginatorSequence<ListAssessmentFrameworkShareRequestsInput, ListAssessmentFrameworkShareRequestsOutput> {
        return ClientRuntime.PaginatorSequence<ListAssessmentFrameworkShareRequestsInput, ListAssessmentFrameworkShareRequestsOutput>(input: input, inputKey: \.nextToken, outputKey: \.nextToken, paginationFunction: self.listAssessmentFrameworkShareRequests(input:))
    }
}

extension ListAssessmentFrameworkShareRequestsInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> ListAssessmentFrameworkShareRequestsInput {
        return ListAssessmentFrameworkShareRequestsInput(
            maxResults: self.maxResults,
            nextToken: token,
            requestType: self.requestType
        )}
}
extension AuditManagerClient {
    /// Paginate over `[ListAssessmentReportsOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[ListAssessmentReportsInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `ListAssessmentReportsOutput`
    public func listAssessmentReportsPaginated(input: ListAssessmentReportsInput) -> ClientRuntime.PaginatorSequence<ListAssessmentReportsInput, ListAssessmentReportsOutput> {
        return ClientRuntime.PaginatorSequence<ListAssessmentReportsInput, ListAssessmentReportsOutput>(input: input, inputKey: \.nextToken, outputKey: \.nextToken, paginationFunction: self.listAssessmentReports(input:))
    }
}

extension ListAssessmentReportsInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> ListAssessmentReportsInput {
        return ListAssessmentReportsInput(
            maxResults: self.maxResults,
            nextToken: token
        )}
}
extension AuditManagerClient {
    /// Paginate over `[ListAssessmentsOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[ListAssessmentsInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `ListAssessmentsOutput`
    public func listAssessmentsPaginated(input: ListAssessmentsInput) -> ClientRuntime.PaginatorSequence<ListAssessmentsInput, ListAssessmentsOutput> {
        return ClientRuntime.PaginatorSequence<ListAssessmentsInput, ListAssessmentsOutput>(input: input, inputKey: \.nextToken, outputKey: \.nextToken, paginationFunction: self.listAssessments(input:))
    }
}

extension ListAssessmentsInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> ListAssessmentsInput {
        return ListAssessmentsInput(
            maxResults: self.maxResults,
            nextToken: token,
            status: self.status
        )}
}
extension AuditManagerClient {
    /// Paginate over `[ListControlDomainInsightsOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[ListControlDomainInsightsInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `ListControlDomainInsightsOutput`
    public func listControlDomainInsightsPaginated(input: ListControlDomainInsightsInput) -> ClientRuntime.PaginatorSequence<ListControlDomainInsightsInput, ListControlDomainInsightsOutput> {
        return ClientRuntime.PaginatorSequence<ListControlDomainInsightsInput, ListControlDomainInsightsOutput>(input: input, inputKey: \.nextToken, outputKey: \.nextToken, paginationFunction: self.listControlDomainInsights(input:))
    }
}

extension ListControlDomainInsightsInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> ListControlDomainInsightsInput {
        return ListControlDomainInsightsInput(
            maxResults: self.maxResults,
            nextToken: token
        )}
}
extension AuditManagerClient {
    /// Paginate over `[ListControlDomainInsightsByAssessmentOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[ListControlDomainInsightsByAssessmentInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `ListControlDomainInsightsByAssessmentOutput`
    public func listControlDomainInsightsByAssessmentPaginated(input: ListControlDomainInsightsByAssessmentInput) -> ClientRuntime.PaginatorSequence<ListControlDomainInsightsByAssessmentInput, ListControlDomainInsightsByAssessmentOutput> {
        return ClientRuntime.PaginatorSequence<ListControlDomainInsightsByAssessmentInput, ListControlDomainInsightsByAssessmentOutput>(input: input, inputKey: \.nextToken, outputKey: \.nextToken, paginationFunction: self.listControlDomainInsightsByAssessment(input:))
    }
}

extension ListControlDomainInsightsByAssessmentInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> ListControlDomainInsightsByAssessmentInput {
        return ListControlDomainInsightsByAssessmentInput(
            assessmentId: self.assessmentId,
            maxResults: self.maxResults,
            nextToken: token
        )}
}
extension AuditManagerClient {
    /// Paginate over `[ListControlInsightsByControlDomainOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[ListControlInsightsByControlDomainInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `ListControlInsightsByControlDomainOutput`
    public func listControlInsightsByControlDomainPaginated(input: ListControlInsightsByControlDomainInput) -> ClientRuntime.PaginatorSequence<ListControlInsightsByControlDomainInput, ListControlInsightsByControlDomainOutput> {
        return ClientRuntime.PaginatorSequence<ListControlInsightsByControlDomainInput, ListControlInsightsByControlDomainOutput>(input: input, inputKey: \.nextToken, outputKey: \.nextToken, paginationFunction: self.listControlInsightsByControlDomain(input:))
    }
}

extension ListControlInsightsByControlDomainInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> ListControlInsightsByControlDomainInput {
        return ListControlInsightsByControlDomainInput(
            controlDomainId: self.controlDomainId,
            maxResults: self.maxResults,
            nextToken: token
        )}
}
extension AuditManagerClient {
    /// Paginate over `[ListControlsOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[ListControlsInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `ListControlsOutput`
    public func listControlsPaginated(input: ListControlsInput) -> ClientRuntime.PaginatorSequence<ListControlsInput, ListControlsOutput> {
        return ClientRuntime.PaginatorSequence<ListControlsInput, ListControlsOutput>(input: input, inputKey: \.nextToken, outputKey: \.nextToken, paginationFunction: self.listControls(input:))
    }
}

extension ListControlsInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> ListControlsInput {
        return ListControlsInput(
            controlCatalogId: self.controlCatalogId,
            controlType: self.controlType,
            maxResults: self.maxResults,
            nextToken: token
        )}
}
extension AuditManagerClient {
    /// Paginate over `[ListKeywordsForDataSourceOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[ListKeywordsForDataSourceInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `ListKeywordsForDataSourceOutput`
    public func listKeywordsForDataSourcePaginated(input: ListKeywordsForDataSourceInput) -> ClientRuntime.PaginatorSequence<ListKeywordsForDataSourceInput, ListKeywordsForDataSourceOutput> {
        return ClientRuntime.PaginatorSequence<ListKeywordsForDataSourceInput, ListKeywordsForDataSourceOutput>(input: input, inputKey: \.nextToken, outputKey: \.nextToken, paginationFunction: self.listKeywordsForDataSource(input:))
    }
}

extension ListKeywordsForDataSourceInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> ListKeywordsForDataSourceInput {
        return ListKeywordsForDataSourceInput(
            maxResults: self.maxResults,
            nextToken: token,
            source: self.source
        )}
}
extension AuditManagerClient {
    /// Paginate over `[ListNotificationsOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[ListNotificationsInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `ListNotificationsOutput`
    public func listNotificationsPaginated(input: ListNotificationsInput) -> ClientRuntime.PaginatorSequence<ListNotificationsInput, ListNotificationsOutput> {
        return ClientRuntime.PaginatorSequence<ListNotificationsInput, ListNotificationsOutput>(input: input, inputKey: \.nextToken, outputKey: \.nextToken, paginationFunction: self.listNotifications(input:))
    }
}

extension ListNotificationsInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> ListNotificationsInput {
        return ListNotificationsInput(
            maxResults: self.maxResults,
            nextToken: token
        )}
}
