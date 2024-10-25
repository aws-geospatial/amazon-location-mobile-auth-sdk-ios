//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

// Code generated by smithy-swift-codegen. DO NOT EDIT!

import protocol ClientRuntime.PaginateToken
import struct ClientRuntime.PaginatorSequence

extension SSOAdminClient {
    /// Paginate over `[ListAccountAssignmentCreationStatusOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[ListAccountAssignmentCreationStatusInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `ListAccountAssignmentCreationStatusOutput`
    public func listAccountAssignmentCreationStatusPaginated(input: ListAccountAssignmentCreationStatusInput) -> ClientRuntime.PaginatorSequence<ListAccountAssignmentCreationStatusInput, ListAccountAssignmentCreationStatusOutput> {
        return ClientRuntime.PaginatorSequence<ListAccountAssignmentCreationStatusInput, ListAccountAssignmentCreationStatusOutput>(input: input, inputKey: \.nextToken, outputKey: \.nextToken, paginationFunction: self.listAccountAssignmentCreationStatus(input:))
    }
}

extension ListAccountAssignmentCreationStatusInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> ListAccountAssignmentCreationStatusInput {
        return ListAccountAssignmentCreationStatusInput(
            filter: self.filter,
            instanceArn: self.instanceArn,
            maxResults: self.maxResults,
            nextToken: token
        )}
}

extension PaginatorSequence where OperationStackInput == ListAccountAssignmentCreationStatusInput, OperationStackOutput == ListAccountAssignmentCreationStatusOutput {
    /// This paginator transforms the `AsyncSequence` returned by `listAccountAssignmentCreationStatusPaginated`
    /// to access the nested member `[SSOAdminClientTypes.AccountAssignmentOperationStatusMetadata]`
    /// - Returns: `[SSOAdminClientTypes.AccountAssignmentOperationStatusMetadata]`
    public func accountAssignmentsCreationStatus() async throws -> [SSOAdminClientTypes.AccountAssignmentOperationStatusMetadata] {
        return try await self.asyncCompactMap { item in item.accountAssignmentsCreationStatus }
    }
}
extension SSOAdminClient {
    /// Paginate over `[ListAccountAssignmentDeletionStatusOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[ListAccountAssignmentDeletionStatusInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `ListAccountAssignmentDeletionStatusOutput`
    public func listAccountAssignmentDeletionStatusPaginated(input: ListAccountAssignmentDeletionStatusInput) -> ClientRuntime.PaginatorSequence<ListAccountAssignmentDeletionStatusInput, ListAccountAssignmentDeletionStatusOutput> {
        return ClientRuntime.PaginatorSequence<ListAccountAssignmentDeletionStatusInput, ListAccountAssignmentDeletionStatusOutput>(input: input, inputKey: \.nextToken, outputKey: \.nextToken, paginationFunction: self.listAccountAssignmentDeletionStatus(input:))
    }
}

extension ListAccountAssignmentDeletionStatusInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> ListAccountAssignmentDeletionStatusInput {
        return ListAccountAssignmentDeletionStatusInput(
            filter: self.filter,
            instanceArn: self.instanceArn,
            maxResults: self.maxResults,
            nextToken: token
        )}
}

extension PaginatorSequence where OperationStackInput == ListAccountAssignmentDeletionStatusInput, OperationStackOutput == ListAccountAssignmentDeletionStatusOutput {
    /// This paginator transforms the `AsyncSequence` returned by `listAccountAssignmentDeletionStatusPaginated`
    /// to access the nested member `[SSOAdminClientTypes.AccountAssignmentOperationStatusMetadata]`
    /// - Returns: `[SSOAdminClientTypes.AccountAssignmentOperationStatusMetadata]`
    public func accountAssignmentsDeletionStatus() async throws -> [SSOAdminClientTypes.AccountAssignmentOperationStatusMetadata] {
        return try await self.asyncCompactMap { item in item.accountAssignmentsDeletionStatus }
    }
}
extension SSOAdminClient {
    /// Paginate over `[ListAccountAssignmentsOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[ListAccountAssignmentsInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `ListAccountAssignmentsOutput`
    public func listAccountAssignmentsPaginated(input: ListAccountAssignmentsInput) -> ClientRuntime.PaginatorSequence<ListAccountAssignmentsInput, ListAccountAssignmentsOutput> {
        return ClientRuntime.PaginatorSequence<ListAccountAssignmentsInput, ListAccountAssignmentsOutput>(input: input, inputKey: \.nextToken, outputKey: \.nextToken, paginationFunction: self.listAccountAssignments(input:))
    }
}

extension ListAccountAssignmentsInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> ListAccountAssignmentsInput {
        return ListAccountAssignmentsInput(
            accountId: self.accountId,
            instanceArn: self.instanceArn,
            maxResults: self.maxResults,
            nextToken: token,
            permissionSetArn: self.permissionSetArn
        )}
}

extension PaginatorSequence where OperationStackInput == ListAccountAssignmentsInput, OperationStackOutput == ListAccountAssignmentsOutput {
    /// This paginator transforms the `AsyncSequence` returned by `listAccountAssignmentsPaginated`
    /// to access the nested member `[SSOAdminClientTypes.AccountAssignment]`
    /// - Returns: `[SSOAdminClientTypes.AccountAssignment]`
    public func accountAssignments() async throws -> [SSOAdminClientTypes.AccountAssignment] {
        return try await self.asyncCompactMap { item in item.accountAssignments }
    }
}
extension SSOAdminClient {
    /// Paginate over `[ListAccountAssignmentsForPrincipalOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[ListAccountAssignmentsForPrincipalInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `ListAccountAssignmentsForPrincipalOutput`
    public func listAccountAssignmentsForPrincipalPaginated(input: ListAccountAssignmentsForPrincipalInput) -> ClientRuntime.PaginatorSequence<ListAccountAssignmentsForPrincipalInput, ListAccountAssignmentsForPrincipalOutput> {
        return ClientRuntime.PaginatorSequence<ListAccountAssignmentsForPrincipalInput, ListAccountAssignmentsForPrincipalOutput>(input: input, inputKey: \.nextToken, outputKey: \.nextToken, paginationFunction: self.listAccountAssignmentsForPrincipal(input:))
    }
}

extension ListAccountAssignmentsForPrincipalInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> ListAccountAssignmentsForPrincipalInput {
        return ListAccountAssignmentsForPrincipalInput(
            filter: self.filter,
            instanceArn: self.instanceArn,
            maxResults: self.maxResults,
            nextToken: token,
            principalId: self.principalId,
            principalType: self.principalType
        )}
}

extension PaginatorSequence where OperationStackInput == ListAccountAssignmentsForPrincipalInput, OperationStackOutput == ListAccountAssignmentsForPrincipalOutput {
    /// This paginator transforms the `AsyncSequence` returned by `listAccountAssignmentsForPrincipalPaginated`
    /// to access the nested member `[SSOAdminClientTypes.AccountAssignmentForPrincipal]`
    /// - Returns: `[SSOAdminClientTypes.AccountAssignmentForPrincipal]`
    public func accountAssignments() async throws -> [SSOAdminClientTypes.AccountAssignmentForPrincipal] {
        return try await self.asyncCompactMap { item in item.accountAssignments }
    }
}
extension SSOAdminClient {
    /// Paginate over `[ListAccountsForProvisionedPermissionSetOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[ListAccountsForProvisionedPermissionSetInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `ListAccountsForProvisionedPermissionSetOutput`
    public func listAccountsForProvisionedPermissionSetPaginated(input: ListAccountsForProvisionedPermissionSetInput) -> ClientRuntime.PaginatorSequence<ListAccountsForProvisionedPermissionSetInput, ListAccountsForProvisionedPermissionSetOutput> {
        return ClientRuntime.PaginatorSequence<ListAccountsForProvisionedPermissionSetInput, ListAccountsForProvisionedPermissionSetOutput>(input: input, inputKey: \.nextToken, outputKey: \.nextToken, paginationFunction: self.listAccountsForProvisionedPermissionSet(input:))
    }
}

extension ListAccountsForProvisionedPermissionSetInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> ListAccountsForProvisionedPermissionSetInput {
        return ListAccountsForProvisionedPermissionSetInput(
            instanceArn: self.instanceArn,
            maxResults: self.maxResults,
            nextToken: token,
            permissionSetArn: self.permissionSetArn,
            provisioningStatus: self.provisioningStatus
        )}
}

extension PaginatorSequence where OperationStackInput == ListAccountsForProvisionedPermissionSetInput, OperationStackOutput == ListAccountsForProvisionedPermissionSetOutput {
    /// This paginator transforms the `AsyncSequence` returned by `listAccountsForProvisionedPermissionSetPaginated`
    /// to access the nested member `[Swift.String]`
    /// - Returns: `[Swift.String]`
    public func accountIds() async throws -> [Swift.String] {
        return try await self.asyncCompactMap { item in item.accountIds }
    }
}
extension SSOAdminClient {
    /// Paginate over `[ListApplicationAssignmentsOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[ListApplicationAssignmentsInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `ListApplicationAssignmentsOutput`
    public func listApplicationAssignmentsPaginated(input: ListApplicationAssignmentsInput) -> ClientRuntime.PaginatorSequence<ListApplicationAssignmentsInput, ListApplicationAssignmentsOutput> {
        return ClientRuntime.PaginatorSequence<ListApplicationAssignmentsInput, ListApplicationAssignmentsOutput>(input: input, inputKey: \.nextToken, outputKey: \.nextToken, paginationFunction: self.listApplicationAssignments(input:))
    }
}

extension ListApplicationAssignmentsInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> ListApplicationAssignmentsInput {
        return ListApplicationAssignmentsInput(
            applicationArn: self.applicationArn,
            maxResults: self.maxResults,
            nextToken: token
        )}
}

extension PaginatorSequence where OperationStackInput == ListApplicationAssignmentsInput, OperationStackOutput == ListApplicationAssignmentsOutput {
    /// This paginator transforms the `AsyncSequence` returned by `listApplicationAssignmentsPaginated`
    /// to access the nested member `[SSOAdminClientTypes.ApplicationAssignment]`
    /// - Returns: `[SSOAdminClientTypes.ApplicationAssignment]`
    public func applicationAssignments() async throws -> [SSOAdminClientTypes.ApplicationAssignment] {
        return try await self.asyncCompactMap { item in item.applicationAssignments }
    }
}
extension SSOAdminClient {
    /// Paginate over `[ListApplicationAssignmentsForPrincipalOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[ListApplicationAssignmentsForPrincipalInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `ListApplicationAssignmentsForPrincipalOutput`
    public func listApplicationAssignmentsForPrincipalPaginated(input: ListApplicationAssignmentsForPrincipalInput) -> ClientRuntime.PaginatorSequence<ListApplicationAssignmentsForPrincipalInput, ListApplicationAssignmentsForPrincipalOutput> {
        return ClientRuntime.PaginatorSequence<ListApplicationAssignmentsForPrincipalInput, ListApplicationAssignmentsForPrincipalOutput>(input: input, inputKey: \.nextToken, outputKey: \.nextToken, paginationFunction: self.listApplicationAssignmentsForPrincipal(input:))
    }
}

extension ListApplicationAssignmentsForPrincipalInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> ListApplicationAssignmentsForPrincipalInput {
        return ListApplicationAssignmentsForPrincipalInput(
            filter: self.filter,
            instanceArn: self.instanceArn,
            maxResults: self.maxResults,
            nextToken: token,
            principalId: self.principalId,
            principalType: self.principalType
        )}
}

extension PaginatorSequence where OperationStackInput == ListApplicationAssignmentsForPrincipalInput, OperationStackOutput == ListApplicationAssignmentsForPrincipalOutput {
    /// This paginator transforms the `AsyncSequence` returned by `listApplicationAssignmentsForPrincipalPaginated`
    /// to access the nested member `[SSOAdminClientTypes.ApplicationAssignmentForPrincipal]`
    /// - Returns: `[SSOAdminClientTypes.ApplicationAssignmentForPrincipal]`
    public func applicationAssignments() async throws -> [SSOAdminClientTypes.ApplicationAssignmentForPrincipal] {
        return try await self.asyncCompactMap { item in item.applicationAssignments }
    }
}
extension SSOAdminClient {
    /// Paginate over `[ListApplicationProvidersOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[ListApplicationProvidersInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `ListApplicationProvidersOutput`
    public func listApplicationProvidersPaginated(input: ListApplicationProvidersInput) -> ClientRuntime.PaginatorSequence<ListApplicationProvidersInput, ListApplicationProvidersOutput> {
        return ClientRuntime.PaginatorSequence<ListApplicationProvidersInput, ListApplicationProvidersOutput>(input: input, inputKey: \.nextToken, outputKey: \.nextToken, paginationFunction: self.listApplicationProviders(input:))
    }
}

extension ListApplicationProvidersInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> ListApplicationProvidersInput {
        return ListApplicationProvidersInput(
            maxResults: self.maxResults,
            nextToken: token
        )}
}

extension PaginatorSequence where OperationStackInput == ListApplicationProvidersInput, OperationStackOutput == ListApplicationProvidersOutput {
    /// This paginator transforms the `AsyncSequence` returned by `listApplicationProvidersPaginated`
    /// to access the nested member `[SSOAdminClientTypes.ApplicationProvider]`
    /// - Returns: `[SSOAdminClientTypes.ApplicationProvider]`
    public func applicationProviders() async throws -> [SSOAdminClientTypes.ApplicationProvider] {
        return try await self.asyncCompactMap { item in item.applicationProviders }
    }
}
extension SSOAdminClient {
    /// Paginate over `[ListApplicationsOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[ListApplicationsInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `ListApplicationsOutput`
    public func listApplicationsPaginated(input: ListApplicationsInput) -> ClientRuntime.PaginatorSequence<ListApplicationsInput, ListApplicationsOutput> {
        return ClientRuntime.PaginatorSequence<ListApplicationsInput, ListApplicationsOutput>(input: input, inputKey: \.nextToken, outputKey: \.nextToken, paginationFunction: self.listApplications(input:))
    }
}

extension ListApplicationsInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> ListApplicationsInput {
        return ListApplicationsInput(
            filter: self.filter,
            instanceArn: self.instanceArn,
            maxResults: self.maxResults,
            nextToken: token
        )}
}

extension PaginatorSequence where OperationStackInput == ListApplicationsInput, OperationStackOutput == ListApplicationsOutput {
    /// This paginator transforms the `AsyncSequence` returned by `listApplicationsPaginated`
    /// to access the nested member `[SSOAdminClientTypes.Application]`
    /// - Returns: `[SSOAdminClientTypes.Application]`
    public func applications() async throws -> [SSOAdminClientTypes.Application] {
        return try await self.asyncCompactMap { item in item.applications }
    }
}
extension SSOAdminClient {
    /// Paginate over `[ListCustomerManagedPolicyReferencesInPermissionSetOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[ListCustomerManagedPolicyReferencesInPermissionSetInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `ListCustomerManagedPolicyReferencesInPermissionSetOutput`
    public func listCustomerManagedPolicyReferencesInPermissionSetPaginated(input: ListCustomerManagedPolicyReferencesInPermissionSetInput) -> ClientRuntime.PaginatorSequence<ListCustomerManagedPolicyReferencesInPermissionSetInput, ListCustomerManagedPolicyReferencesInPermissionSetOutput> {
        return ClientRuntime.PaginatorSequence<ListCustomerManagedPolicyReferencesInPermissionSetInput, ListCustomerManagedPolicyReferencesInPermissionSetOutput>(input: input, inputKey: \.nextToken, outputKey: \.nextToken, paginationFunction: self.listCustomerManagedPolicyReferencesInPermissionSet(input:))
    }
}

extension ListCustomerManagedPolicyReferencesInPermissionSetInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> ListCustomerManagedPolicyReferencesInPermissionSetInput {
        return ListCustomerManagedPolicyReferencesInPermissionSetInput(
            instanceArn: self.instanceArn,
            maxResults: self.maxResults,
            nextToken: token,
            permissionSetArn: self.permissionSetArn
        )}
}

extension PaginatorSequence where OperationStackInput == ListCustomerManagedPolicyReferencesInPermissionSetInput, OperationStackOutput == ListCustomerManagedPolicyReferencesInPermissionSetOutput {
    /// This paginator transforms the `AsyncSequence` returned by `listCustomerManagedPolicyReferencesInPermissionSetPaginated`
    /// to access the nested member `[SSOAdminClientTypes.CustomerManagedPolicyReference]`
    /// - Returns: `[SSOAdminClientTypes.CustomerManagedPolicyReference]`
    public func customerManagedPolicyReferences() async throws -> [SSOAdminClientTypes.CustomerManagedPolicyReference] {
        return try await self.asyncCompactMap { item in item.customerManagedPolicyReferences }
    }
}
extension SSOAdminClient {
    /// Paginate over `[ListInstancesOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[ListInstancesInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `ListInstancesOutput`
    public func listInstancesPaginated(input: ListInstancesInput) -> ClientRuntime.PaginatorSequence<ListInstancesInput, ListInstancesOutput> {
        return ClientRuntime.PaginatorSequence<ListInstancesInput, ListInstancesOutput>(input: input, inputKey: \.nextToken, outputKey: \.nextToken, paginationFunction: self.listInstances(input:))
    }
}

extension ListInstancesInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> ListInstancesInput {
        return ListInstancesInput(
            maxResults: self.maxResults,
            nextToken: token
        )}
}

extension PaginatorSequence where OperationStackInput == ListInstancesInput, OperationStackOutput == ListInstancesOutput {
    /// This paginator transforms the `AsyncSequence` returned by `listInstancesPaginated`
    /// to access the nested member `[SSOAdminClientTypes.InstanceMetadata]`
    /// - Returns: `[SSOAdminClientTypes.InstanceMetadata]`
    public func instances() async throws -> [SSOAdminClientTypes.InstanceMetadata] {
        return try await self.asyncCompactMap { item in item.instances }
    }
}
extension SSOAdminClient {
    /// Paginate over `[ListManagedPoliciesInPermissionSetOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[ListManagedPoliciesInPermissionSetInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `ListManagedPoliciesInPermissionSetOutput`
    public func listManagedPoliciesInPermissionSetPaginated(input: ListManagedPoliciesInPermissionSetInput) -> ClientRuntime.PaginatorSequence<ListManagedPoliciesInPermissionSetInput, ListManagedPoliciesInPermissionSetOutput> {
        return ClientRuntime.PaginatorSequence<ListManagedPoliciesInPermissionSetInput, ListManagedPoliciesInPermissionSetOutput>(input: input, inputKey: \.nextToken, outputKey: \.nextToken, paginationFunction: self.listManagedPoliciesInPermissionSet(input:))
    }
}

extension ListManagedPoliciesInPermissionSetInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> ListManagedPoliciesInPermissionSetInput {
        return ListManagedPoliciesInPermissionSetInput(
            instanceArn: self.instanceArn,
            maxResults: self.maxResults,
            nextToken: token,
            permissionSetArn: self.permissionSetArn
        )}
}

extension PaginatorSequence where OperationStackInput == ListManagedPoliciesInPermissionSetInput, OperationStackOutput == ListManagedPoliciesInPermissionSetOutput {
    /// This paginator transforms the `AsyncSequence` returned by `listManagedPoliciesInPermissionSetPaginated`
    /// to access the nested member `[SSOAdminClientTypes.AttachedManagedPolicy]`
    /// - Returns: `[SSOAdminClientTypes.AttachedManagedPolicy]`
    public func attachedManagedPolicies() async throws -> [SSOAdminClientTypes.AttachedManagedPolicy] {
        return try await self.asyncCompactMap { item in item.attachedManagedPolicies }
    }
}
extension SSOAdminClient {
    /// Paginate over `[ListPermissionSetProvisioningStatusOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[ListPermissionSetProvisioningStatusInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `ListPermissionSetProvisioningStatusOutput`
    public func listPermissionSetProvisioningStatusPaginated(input: ListPermissionSetProvisioningStatusInput) -> ClientRuntime.PaginatorSequence<ListPermissionSetProvisioningStatusInput, ListPermissionSetProvisioningStatusOutput> {
        return ClientRuntime.PaginatorSequence<ListPermissionSetProvisioningStatusInput, ListPermissionSetProvisioningStatusOutput>(input: input, inputKey: \.nextToken, outputKey: \.nextToken, paginationFunction: self.listPermissionSetProvisioningStatus(input:))
    }
}

extension ListPermissionSetProvisioningStatusInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> ListPermissionSetProvisioningStatusInput {
        return ListPermissionSetProvisioningStatusInput(
            filter: self.filter,
            instanceArn: self.instanceArn,
            maxResults: self.maxResults,
            nextToken: token
        )}
}

extension PaginatorSequence where OperationStackInput == ListPermissionSetProvisioningStatusInput, OperationStackOutput == ListPermissionSetProvisioningStatusOutput {
    /// This paginator transforms the `AsyncSequence` returned by `listPermissionSetProvisioningStatusPaginated`
    /// to access the nested member `[SSOAdminClientTypes.PermissionSetProvisioningStatusMetadata]`
    /// - Returns: `[SSOAdminClientTypes.PermissionSetProvisioningStatusMetadata]`
    public func permissionSetsProvisioningStatus() async throws -> [SSOAdminClientTypes.PermissionSetProvisioningStatusMetadata] {
        return try await self.asyncCompactMap { item in item.permissionSetsProvisioningStatus }
    }
}
extension SSOAdminClient {
    /// Paginate over `[ListPermissionSetsOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[ListPermissionSetsInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `ListPermissionSetsOutput`
    public func listPermissionSetsPaginated(input: ListPermissionSetsInput) -> ClientRuntime.PaginatorSequence<ListPermissionSetsInput, ListPermissionSetsOutput> {
        return ClientRuntime.PaginatorSequence<ListPermissionSetsInput, ListPermissionSetsOutput>(input: input, inputKey: \.nextToken, outputKey: \.nextToken, paginationFunction: self.listPermissionSets(input:))
    }
}

extension ListPermissionSetsInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> ListPermissionSetsInput {
        return ListPermissionSetsInput(
            instanceArn: self.instanceArn,
            maxResults: self.maxResults,
            nextToken: token
        )}
}

extension PaginatorSequence where OperationStackInput == ListPermissionSetsInput, OperationStackOutput == ListPermissionSetsOutput {
    /// This paginator transforms the `AsyncSequence` returned by `listPermissionSetsPaginated`
    /// to access the nested member `[Swift.String]`
    /// - Returns: `[Swift.String]`
    public func permissionSets() async throws -> [Swift.String] {
        return try await self.asyncCompactMap { item in item.permissionSets }
    }
}
extension SSOAdminClient {
    /// Paginate over `[ListPermissionSetsProvisionedToAccountOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[ListPermissionSetsProvisionedToAccountInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `ListPermissionSetsProvisionedToAccountOutput`
    public func listPermissionSetsProvisionedToAccountPaginated(input: ListPermissionSetsProvisionedToAccountInput) -> ClientRuntime.PaginatorSequence<ListPermissionSetsProvisionedToAccountInput, ListPermissionSetsProvisionedToAccountOutput> {
        return ClientRuntime.PaginatorSequence<ListPermissionSetsProvisionedToAccountInput, ListPermissionSetsProvisionedToAccountOutput>(input: input, inputKey: \.nextToken, outputKey: \.nextToken, paginationFunction: self.listPermissionSetsProvisionedToAccount(input:))
    }
}

extension ListPermissionSetsProvisionedToAccountInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> ListPermissionSetsProvisionedToAccountInput {
        return ListPermissionSetsProvisionedToAccountInput(
            accountId: self.accountId,
            instanceArn: self.instanceArn,
            maxResults: self.maxResults,
            nextToken: token,
            provisioningStatus: self.provisioningStatus
        )}
}

extension PaginatorSequence where OperationStackInput == ListPermissionSetsProvisionedToAccountInput, OperationStackOutput == ListPermissionSetsProvisionedToAccountOutput {
    /// This paginator transforms the `AsyncSequence` returned by `listPermissionSetsProvisionedToAccountPaginated`
    /// to access the nested member `[Swift.String]`
    /// - Returns: `[Swift.String]`
    public func permissionSets() async throws -> [Swift.String] {
        return try await self.asyncCompactMap { item in item.permissionSets }
    }
}
extension SSOAdminClient {
    /// Paginate over `[ListTagsForResourceOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[ListTagsForResourceInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `ListTagsForResourceOutput`
    public func listTagsForResourcePaginated(input: ListTagsForResourceInput) -> ClientRuntime.PaginatorSequence<ListTagsForResourceInput, ListTagsForResourceOutput> {
        return ClientRuntime.PaginatorSequence<ListTagsForResourceInput, ListTagsForResourceOutput>(input: input, inputKey: \.nextToken, outputKey: \.nextToken, paginationFunction: self.listTagsForResource(input:))
    }
}

extension ListTagsForResourceInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> ListTagsForResourceInput {
        return ListTagsForResourceInput(
            instanceArn: self.instanceArn,
            nextToken: token,
            resourceArn: self.resourceArn
        )}
}

extension PaginatorSequence where OperationStackInput == ListTagsForResourceInput, OperationStackOutput == ListTagsForResourceOutput {
    /// This paginator transforms the `AsyncSequence` returned by `listTagsForResourcePaginated`
    /// to access the nested member `[SSOAdminClientTypes.Tag]`
    /// - Returns: `[SSOAdminClientTypes.Tag]`
    public func tags() async throws -> [SSOAdminClientTypes.Tag] {
        return try await self.asyncCompactMap { item in item.tags }
    }
}
extension SSOAdminClient {
    /// Paginate over `[ListTrustedTokenIssuersOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[ListTrustedTokenIssuersInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `ListTrustedTokenIssuersOutput`
    public func listTrustedTokenIssuersPaginated(input: ListTrustedTokenIssuersInput) -> ClientRuntime.PaginatorSequence<ListTrustedTokenIssuersInput, ListTrustedTokenIssuersOutput> {
        return ClientRuntime.PaginatorSequence<ListTrustedTokenIssuersInput, ListTrustedTokenIssuersOutput>(input: input, inputKey: \.nextToken, outputKey: \.nextToken, paginationFunction: self.listTrustedTokenIssuers(input:))
    }
}

extension ListTrustedTokenIssuersInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> ListTrustedTokenIssuersInput {
        return ListTrustedTokenIssuersInput(
            instanceArn: self.instanceArn,
            maxResults: self.maxResults,
            nextToken: token
        )}
}

extension PaginatorSequence where OperationStackInput == ListTrustedTokenIssuersInput, OperationStackOutput == ListTrustedTokenIssuersOutput {
    /// This paginator transforms the `AsyncSequence` returned by `listTrustedTokenIssuersPaginated`
    /// to access the nested member `[SSOAdminClientTypes.TrustedTokenIssuerMetadata]`
    /// - Returns: `[SSOAdminClientTypes.TrustedTokenIssuerMetadata]`
    public func trustedTokenIssuers() async throws -> [SSOAdminClientTypes.TrustedTokenIssuerMetadata] {
        return try await self.asyncCompactMap { item in item.trustedTokenIssuers }
    }
}
