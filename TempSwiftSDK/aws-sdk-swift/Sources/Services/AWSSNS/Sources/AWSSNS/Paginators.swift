//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

// Code generated by smithy-swift-codegen. DO NOT EDIT!

import protocol ClientRuntime.PaginateToken
import struct ClientRuntime.PaginatorSequence

extension SNSClient {
    /// Paginate over `[ListEndpointsByPlatformApplicationOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[ListEndpointsByPlatformApplicationInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `ListEndpointsByPlatformApplicationOutput`
    public func listEndpointsByPlatformApplicationPaginated(input: ListEndpointsByPlatformApplicationInput) -> ClientRuntime.PaginatorSequence<ListEndpointsByPlatformApplicationInput, ListEndpointsByPlatformApplicationOutput> {
        return ClientRuntime.PaginatorSequence<ListEndpointsByPlatformApplicationInput, ListEndpointsByPlatformApplicationOutput>(input: input, inputKey: \.nextToken, outputKey: \.nextToken, paginationFunction: self.listEndpointsByPlatformApplication(input:))
    }
}

extension ListEndpointsByPlatformApplicationInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> ListEndpointsByPlatformApplicationInput {
        return ListEndpointsByPlatformApplicationInput(
            nextToken: token,
            platformApplicationArn: self.platformApplicationArn
        )}
}

extension PaginatorSequence where OperationStackInput == ListEndpointsByPlatformApplicationInput, OperationStackOutput == ListEndpointsByPlatformApplicationOutput {
    /// This paginator transforms the `AsyncSequence` returned by `listEndpointsByPlatformApplicationPaginated`
    /// to access the nested member `[SNSClientTypes.Endpoint]`
    /// - Returns: `[SNSClientTypes.Endpoint]`
    public func endpoints() async throws -> [SNSClientTypes.Endpoint] {
        return try await self.asyncCompactMap { item in item.endpoints }
    }
}
extension SNSClient {
    /// Paginate over `[ListOriginationNumbersOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[ListOriginationNumbersInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `ListOriginationNumbersOutput`
    public func listOriginationNumbersPaginated(input: ListOriginationNumbersInput) -> ClientRuntime.PaginatorSequence<ListOriginationNumbersInput, ListOriginationNumbersOutput> {
        return ClientRuntime.PaginatorSequence<ListOriginationNumbersInput, ListOriginationNumbersOutput>(input: input, inputKey: \.nextToken, outputKey: \.nextToken, paginationFunction: self.listOriginationNumbers(input:))
    }
}

extension ListOriginationNumbersInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> ListOriginationNumbersInput {
        return ListOriginationNumbersInput(
            maxResults: self.maxResults,
            nextToken: token
        )}
}

extension PaginatorSequence where OperationStackInput == ListOriginationNumbersInput, OperationStackOutput == ListOriginationNumbersOutput {
    /// This paginator transforms the `AsyncSequence` returned by `listOriginationNumbersPaginated`
    /// to access the nested member `[SNSClientTypes.PhoneNumberInformation]`
    /// - Returns: `[SNSClientTypes.PhoneNumberInformation]`
    public func phoneNumbers() async throws -> [SNSClientTypes.PhoneNumberInformation] {
        return try await self.asyncCompactMap { item in item.phoneNumbers }
    }
}
extension SNSClient {
    /// Paginate over `[ListPhoneNumbersOptedOutOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[ListPhoneNumbersOptedOutInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `ListPhoneNumbersOptedOutOutput`
    public func listPhoneNumbersOptedOutPaginated(input: ListPhoneNumbersOptedOutInput) -> ClientRuntime.PaginatorSequence<ListPhoneNumbersOptedOutInput, ListPhoneNumbersOptedOutOutput> {
        return ClientRuntime.PaginatorSequence<ListPhoneNumbersOptedOutInput, ListPhoneNumbersOptedOutOutput>(input: input, inputKey: \.nextToken, outputKey: \.nextToken, paginationFunction: self.listPhoneNumbersOptedOut(input:))
    }
}

extension ListPhoneNumbersOptedOutInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> ListPhoneNumbersOptedOutInput {
        return ListPhoneNumbersOptedOutInput(
            nextToken: token
        )}
}

extension PaginatorSequence where OperationStackInput == ListPhoneNumbersOptedOutInput, OperationStackOutput == ListPhoneNumbersOptedOutOutput {
    /// This paginator transforms the `AsyncSequence` returned by `listPhoneNumbersOptedOutPaginated`
    /// to access the nested member `[Swift.String]`
    /// - Returns: `[Swift.String]`
    public func phoneNumbers() async throws -> [Swift.String] {
        return try await self.asyncCompactMap { item in item.phoneNumbers }
    }
}
extension SNSClient {
    /// Paginate over `[ListPlatformApplicationsOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[ListPlatformApplicationsInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `ListPlatformApplicationsOutput`
    public func listPlatformApplicationsPaginated(input: ListPlatformApplicationsInput) -> ClientRuntime.PaginatorSequence<ListPlatformApplicationsInput, ListPlatformApplicationsOutput> {
        return ClientRuntime.PaginatorSequence<ListPlatformApplicationsInput, ListPlatformApplicationsOutput>(input: input, inputKey: \.nextToken, outputKey: \.nextToken, paginationFunction: self.listPlatformApplications(input:))
    }
}

extension ListPlatformApplicationsInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> ListPlatformApplicationsInput {
        return ListPlatformApplicationsInput(
            nextToken: token
        )}
}

extension PaginatorSequence where OperationStackInput == ListPlatformApplicationsInput, OperationStackOutput == ListPlatformApplicationsOutput {
    /// This paginator transforms the `AsyncSequence` returned by `listPlatformApplicationsPaginated`
    /// to access the nested member `[SNSClientTypes.PlatformApplication]`
    /// - Returns: `[SNSClientTypes.PlatformApplication]`
    public func platformApplications() async throws -> [SNSClientTypes.PlatformApplication] {
        return try await self.asyncCompactMap { item in item.platformApplications }
    }
}
extension SNSClient {
    /// Paginate over `[ListSMSSandboxPhoneNumbersOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[ListSMSSandboxPhoneNumbersInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `ListSMSSandboxPhoneNumbersOutput`
    public func listSMSSandboxPhoneNumbersPaginated(input: ListSMSSandboxPhoneNumbersInput) -> ClientRuntime.PaginatorSequence<ListSMSSandboxPhoneNumbersInput, ListSMSSandboxPhoneNumbersOutput> {
        return ClientRuntime.PaginatorSequence<ListSMSSandboxPhoneNumbersInput, ListSMSSandboxPhoneNumbersOutput>(input: input, inputKey: \.nextToken, outputKey: \.nextToken, paginationFunction: self.listSMSSandboxPhoneNumbers(input:))
    }
}

extension ListSMSSandboxPhoneNumbersInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> ListSMSSandboxPhoneNumbersInput {
        return ListSMSSandboxPhoneNumbersInput(
            maxResults: self.maxResults,
            nextToken: token
        )}
}

extension PaginatorSequence where OperationStackInput == ListSMSSandboxPhoneNumbersInput, OperationStackOutput == ListSMSSandboxPhoneNumbersOutput {
    /// This paginator transforms the `AsyncSequence` returned by `listSMSSandboxPhoneNumbersPaginated`
    /// to access the nested member `[SNSClientTypes.SMSSandboxPhoneNumber]`
    /// - Returns: `[SNSClientTypes.SMSSandboxPhoneNumber]`
    public func phoneNumbers() async throws -> [SNSClientTypes.SMSSandboxPhoneNumber] {
        return try await self.asyncCompactMap { item in item.phoneNumbers }
    }
}
extension SNSClient {
    /// Paginate over `[ListSubscriptionsOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[ListSubscriptionsInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `ListSubscriptionsOutput`
    public func listSubscriptionsPaginated(input: ListSubscriptionsInput) -> ClientRuntime.PaginatorSequence<ListSubscriptionsInput, ListSubscriptionsOutput> {
        return ClientRuntime.PaginatorSequence<ListSubscriptionsInput, ListSubscriptionsOutput>(input: input, inputKey: \.nextToken, outputKey: \.nextToken, paginationFunction: self.listSubscriptions(input:))
    }
}

extension ListSubscriptionsInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> ListSubscriptionsInput {
        return ListSubscriptionsInput(
            nextToken: token
        )}
}

extension PaginatorSequence where OperationStackInput == ListSubscriptionsInput, OperationStackOutput == ListSubscriptionsOutput {
    /// This paginator transforms the `AsyncSequence` returned by `listSubscriptionsPaginated`
    /// to access the nested member `[SNSClientTypes.Subscription]`
    /// - Returns: `[SNSClientTypes.Subscription]`
    public func subscriptions() async throws -> [SNSClientTypes.Subscription] {
        return try await self.asyncCompactMap { item in item.subscriptions }
    }
}
extension SNSClient {
    /// Paginate over `[ListSubscriptionsByTopicOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[ListSubscriptionsByTopicInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `ListSubscriptionsByTopicOutput`
    public func listSubscriptionsByTopicPaginated(input: ListSubscriptionsByTopicInput) -> ClientRuntime.PaginatorSequence<ListSubscriptionsByTopicInput, ListSubscriptionsByTopicOutput> {
        return ClientRuntime.PaginatorSequence<ListSubscriptionsByTopicInput, ListSubscriptionsByTopicOutput>(input: input, inputKey: \.nextToken, outputKey: \.nextToken, paginationFunction: self.listSubscriptionsByTopic(input:))
    }
}

extension ListSubscriptionsByTopicInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> ListSubscriptionsByTopicInput {
        return ListSubscriptionsByTopicInput(
            nextToken: token,
            topicArn: self.topicArn
        )}
}

extension PaginatorSequence where OperationStackInput == ListSubscriptionsByTopicInput, OperationStackOutput == ListSubscriptionsByTopicOutput {
    /// This paginator transforms the `AsyncSequence` returned by `listSubscriptionsByTopicPaginated`
    /// to access the nested member `[SNSClientTypes.Subscription]`
    /// - Returns: `[SNSClientTypes.Subscription]`
    public func subscriptions() async throws -> [SNSClientTypes.Subscription] {
        return try await self.asyncCompactMap { item in item.subscriptions }
    }
}
extension SNSClient {
    /// Paginate over `[ListTopicsOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[ListTopicsInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `ListTopicsOutput`
    public func listTopicsPaginated(input: ListTopicsInput) -> ClientRuntime.PaginatorSequence<ListTopicsInput, ListTopicsOutput> {
        return ClientRuntime.PaginatorSequence<ListTopicsInput, ListTopicsOutput>(input: input, inputKey: \.nextToken, outputKey: \.nextToken, paginationFunction: self.listTopics(input:))
    }
}

extension ListTopicsInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> ListTopicsInput {
        return ListTopicsInput(
            nextToken: token
        )}
}

extension PaginatorSequence where OperationStackInput == ListTopicsInput, OperationStackOutput == ListTopicsOutput {
    /// This paginator transforms the `AsyncSequence` returned by `listTopicsPaginated`
    /// to access the nested member `[SNSClientTypes.Topic]`
    /// - Returns: `[SNSClientTypes.Topic]`
    public func topics() async throws -> [SNSClientTypes.Topic] {
        return try await self.asyncCompactMap { item in item.topics }
    }
}
