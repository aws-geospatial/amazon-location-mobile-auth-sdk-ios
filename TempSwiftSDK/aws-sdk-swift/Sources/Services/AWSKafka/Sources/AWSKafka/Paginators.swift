//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

// Code generated by smithy-swift-codegen. DO NOT EDIT!

import protocol ClientRuntime.PaginateToken
import struct ClientRuntime.PaginatorSequence

extension KafkaClient {
    /// Paginate over `[ListClientVpcConnectionsOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[ListClientVpcConnectionsInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `ListClientVpcConnectionsOutput`
    public func listClientVpcConnectionsPaginated(input: ListClientVpcConnectionsInput) -> ClientRuntime.PaginatorSequence<ListClientVpcConnectionsInput, ListClientVpcConnectionsOutput> {
        return ClientRuntime.PaginatorSequence<ListClientVpcConnectionsInput, ListClientVpcConnectionsOutput>(input: input, inputKey: \.nextToken, outputKey: \.nextToken, paginationFunction: self.listClientVpcConnections(input:))
    }
}

extension ListClientVpcConnectionsInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> ListClientVpcConnectionsInput {
        return ListClientVpcConnectionsInput(
            clusterArn: self.clusterArn,
            maxResults: self.maxResults,
            nextToken: token
        )}
}

extension PaginatorSequence where OperationStackInput == ListClientVpcConnectionsInput, OperationStackOutput == ListClientVpcConnectionsOutput {
    /// This paginator transforms the `AsyncSequence` returned by `listClientVpcConnectionsPaginated`
    /// to access the nested member `[KafkaClientTypes.ClientVpcConnection]`
    /// - Returns: `[KafkaClientTypes.ClientVpcConnection]`
    public func clientVpcConnections() async throws -> [KafkaClientTypes.ClientVpcConnection] {
        return try await self.asyncCompactMap { item in item.clientVpcConnections }
    }
}
extension KafkaClient {
    /// Paginate over `[ListClusterOperationsOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[ListClusterOperationsInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `ListClusterOperationsOutput`
    public func listClusterOperationsPaginated(input: ListClusterOperationsInput) -> ClientRuntime.PaginatorSequence<ListClusterOperationsInput, ListClusterOperationsOutput> {
        return ClientRuntime.PaginatorSequence<ListClusterOperationsInput, ListClusterOperationsOutput>(input: input, inputKey: \.nextToken, outputKey: \.nextToken, paginationFunction: self.listClusterOperations(input:))
    }
}

extension ListClusterOperationsInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> ListClusterOperationsInput {
        return ListClusterOperationsInput(
            clusterArn: self.clusterArn,
            maxResults: self.maxResults,
            nextToken: token
        )}
}

extension PaginatorSequence where OperationStackInput == ListClusterOperationsInput, OperationStackOutput == ListClusterOperationsOutput {
    /// This paginator transforms the `AsyncSequence` returned by `listClusterOperationsPaginated`
    /// to access the nested member `[KafkaClientTypes.ClusterOperationInfo]`
    /// - Returns: `[KafkaClientTypes.ClusterOperationInfo]`
    public func clusterOperationInfoList() async throws -> [KafkaClientTypes.ClusterOperationInfo] {
        return try await self.asyncCompactMap { item in item.clusterOperationInfoList }
    }
}
extension KafkaClient {
    /// Paginate over `[ListClusterOperationsV2Output]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[ListClusterOperationsV2Input]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `ListClusterOperationsV2Output`
    public func listClusterOperationsV2Paginated(input: ListClusterOperationsV2Input) -> ClientRuntime.PaginatorSequence<ListClusterOperationsV2Input, ListClusterOperationsV2Output> {
        return ClientRuntime.PaginatorSequence<ListClusterOperationsV2Input, ListClusterOperationsV2Output>(input: input, inputKey: \.nextToken, outputKey: \.nextToken, paginationFunction: self.listClusterOperationsV2(input:))
    }
}

extension ListClusterOperationsV2Input: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> ListClusterOperationsV2Input {
        return ListClusterOperationsV2Input(
            clusterArn: self.clusterArn,
            maxResults: self.maxResults,
            nextToken: token
        )}
}

extension PaginatorSequence where OperationStackInput == ListClusterOperationsV2Input, OperationStackOutput == ListClusterOperationsV2Output {
    /// This paginator transforms the `AsyncSequence` returned by `listClusterOperationsV2Paginated`
    /// to access the nested member `[KafkaClientTypes.ClusterOperationV2Summary]`
    /// - Returns: `[KafkaClientTypes.ClusterOperationV2Summary]`
    public func clusterOperationInfoList() async throws -> [KafkaClientTypes.ClusterOperationV2Summary] {
        return try await self.asyncCompactMap { item in item.clusterOperationInfoList }
    }
}
extension KafkaClient {
    /// Paginate over `[ListClustersOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[ListClustersInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `ListClustersOutput`
    public func listClustersPaginated(input: ListClustersInput) -> ClientRuntime.PaginatorSequence<ListClustersInput, ListClustersOutput> {
        return ClientRuntime.PaginatorSequence<ListClustersInput, ListClustersOutput>(input: input, inputKey: \.nextToken, outputKey: \.nextToken, paginationFunction: self.listClusters(input:))
    }
}

extension ListClustersInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> ListClustersInput {
        return ListClustersInput(
            clusterNameFilter: self.clusterNameFilter,
            maxResults: self.maxResults,
            nextToken: token
        )}
}

extension PaginatorSequence where OperationStackInput == ListClustersInput, OperationStackOutput == ListClustersOutput {
    /// This paginator transforms the `AsyncSequence` returned by `listClustersPaginated`
    /// to access the nested member `[KafkaClientTypes.ClusterInfo]`
    /// - Returns: `[KafkaClientTypes.ClusterInfo]`
    public func clusterInfoList() async throws -> [KafkaClientTypes.ClusterInfo] {
        return try await self.asyncCompactMap { item in item.clusterInfoList }
    }
}
extension KafkaClient {
    /// Paginate over `[ListClustersV2Output]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[ListClustersV2Input]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `ListClustersV2Output`
    public func listClustersV2Paginated(input: ListClustersV2Input) -> ClientRuntime.PaginatorSequence<ListClustersV2Input, ListClustersV2Output> {
        return ClientRuntime.PaginatorSequence<ListClustersV2Input, ListClustersV2Output>(input: input, inputKey: \.nextToken, outputKey: \.nextToken, paginationFunction: self.listClustersV2(input:))
    }
}

extension ListClustersV2Input: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> ListClustersV2Input {
        return ListClustersV2Input(
            clusterNameFilter: self.clusterNameFilter,
            clusterTypeFilter: self.clusterTypeFilter,
            maxResults: self.maxResults,
            nextToken: token
        )}
}

extension PaginatorSequence where OperationStackInput == ListClustersV2Input, OperationStackOutput == ListClustersV2Output {
    /// This paginator transforms the `AsyncSequence` returned by `listClustersV2Paginated`
    /// to access the nested member `[KafkaClientTypes.Cluster]`
    /// - Returns: `[KafkaClientTypes.Cluster]`
    public func clusterInfoList() async throws -> [KafkaClientTypes.Cluster] {
        return try await self.asyncCompactMap { item in item.clusterInfoList }
    }
}
extension KafkaClient {
    /// Paginate over `[ListConfigurationRevisionsOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[ListConfigurationRevisionsInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `ListConfigurationRevisionsOutput`
    public func listConfigurationRevisionsPaginated(input: ListConfigurationRevisionsInput) -> ClientRuntime.PaginatorSequence<ListConfigurationRevisionsInput, ListConfigurationRevisionsOutput> {
        return ClientRuntime.PaginatorSequence<ListConfigurationRevisionsInput, ListConfigurationRevisionsOutput>(input: input, inputKey: \.nextToken, outputKey: \.nextToken, paginationFunction: self.listConfigurationRevisions(input:))
    }
}

extension ListConfigurationRevisionsInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> ListConfigurationRevisionsInput {
        return ListConfigurationRevisionsInput(
            arn: self.arn,
            maxResults: self.maxResults,
            nextToken: token
        )}
}

extension PaginatorSequence where OperationStackInput == ListConfigurationRevisionsInput, OperationStackOutput == ListConfigurationRevisionsOutput {
    /// This paginator transforms the `AsyncSequence` returned by `listConfigurationRevisionsPaginated`
    /// to access the nested member `[KafkaClientTypes.ConfigurationRevision]`
    /// - Returns: `[KafkaClientTypes.ConfigurationRevision]`
    public func revisions() async throws -> [KafkaClientTypes.ConfigurationRevision] {
        return try await self.asyncCompactMap { item in item.revisions }
    }
}
extension KafkaClient {
    /// Paginate over `[ListConfigurationsOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[ListConfigurationsInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `ListConfigurationsOutput`
    public func listConfigurationsPaginated(input: ListConfigurationsInput) -> ClientRuntime.PaginatorSequence<ListConfigurationsInput, ListConfigurationsOutput> {
        return ClientRuntime.PaginatorSequence<ListConfigurationsInput, ListConfigurationsOutput>(input: input, inputKey: \.nextToken, outputKey: \.nextToken, paginationFunction: self.listConfigurations(input:))
    }
}

extension ListConfigurationsInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> ListConfigurationsInput {
        return ListConfigurationsInput(
            maxResults: self.maxResults,
            nextToken: token
        )}
}

extension PaginatorSequence where OperationStackInput == ListConfigurationsInput, OperationStackOutput == ListConfigurationsOutput {
    /// This paginator transforms the `AsyncSequence` returned by `listConfigurationsPaginated`
    /// to access the nested member `[KafkaClientTypes.Configuration]`
    /// - Returns: `[KafkaClientTypes.Configuration]`
    public func configurations() async throws -> [KafkaClientTypes.Configuration] {
        return try await self.asyncCompactMap { item in item.configurations }
    }
}
extension KafkaClient {
    /// Paginate over `[ListKafkaVersionsOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[ListKafkaVersionsInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `ListKafkaVersionsOutput`
    public func listKafkaVersionsPaginated(input: ListKafkaVersionsInput) -> ClientRuntime.PaginatorSequence<ListKafkaVersionsInput, ListKafkaVersionsOutput> {
        return ClientRuntime.PaginatorSequence<ListKafkaVersionsInput, ListKafkaVersionsOutput>(input: input, inputKey: \.nextToken, outputKey: \.nextToken, paginationFunction: self.listKafkaVersions(input:))
    }
}

extension ListKafkaVersionsInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> ListKafkaVersionsInput {
        return ListKafkaVersionsInput(
            maxResults: self.maxResults,
            nextToken: token
        )}
}

extension PaginatorSequence where OperationStackInput == ListKafkaVersionsInput, OperationStackOutput == ListKafkaVersionsOutput {
    /// This paginator transforms the `AsyncSequence` returned by `listKafkaVersionsPaginated`
    /// to access the nested member `[KafkaClientTypes.KafkaVersion]`
    /// - Returns: `[KafkaClientTypes.KafkaVersion]`
    public func kafkaVersions() async throws -> [KafkaClientTypes.KafkaVersion] {
        return try await self.asyncCompactMap { item in item.kafkaVersions }
    }
}
extension KafkaClient {
    /// Paginate over `[ListNodesOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[ListNodesInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `ListNodesOutput`
    public func listNodesPaginated(input: ListNodesInput) -> ClientRuntime.PaginatorSequence<ListNodesInput, ListNodesOutput> {
        return ClientRuntime.PaginatorSequence<ListNodesInput, ListNodesOutput>(input: input, inputKey: \.nextToken, outputKey: \.nextToken, paginationFunction: self.listNodes(input:))
    }
}

extension ListNodesInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> ListNodesInput {
        return ListNodesInput(
            clusterArn: self.clusterArn,
            maxResults: self.maxResults,
            nextToken: token
        )}
}

extension PaginatorSequence where OperationStackInput == ListNodesInput, OperationStackOutput == ListNodesOutput {
    /// This paginator transforms the `AsyncSequence` returned by `listNodesPaginated`
    /// to access the nested member `[KafkaClientTypes.NodeInfo]`
    /// - Returns: `[KafkaClientTypes.NodeInfo]`
    public func nodeInfoList() async throws -> [KafkaClientTypes.NodeInfo] {
        return try await self.asyncCompactMap { item in item.nodeInfoList }
    }
}
extension KafkaClient {
    /// Paginate over `[ListReplicatorsOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[ListReplicatorsInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `ListReplicatorsOutput`
    public func listReplicatorsPaginated(input: ListReplicatorsInput) -> ClientRuntime.PaginatorSequence<ListReplicatorsInput, ListReplicatorsOutput> {
        return ClientRuntime.PaginatorSequence<ListReplicatorsInput, ListReplicatorsOutput>(input: input, inputKey: \.nextToken, outputKey: \.nextToken, paginationFunction: self.listReplicators(input:))
    }
}

extension ListReplicatorsInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> ListReplicatorsInput {
        return ListReplicatorsInput(
            maxResults: self.maxResults,
            nextToken: token,
            replicatorNameFilter: self.replicatorNameFilter
        )}
}

extension PaginatorSequence where OperationStackInput == ListReplicatorsInput, OperationStackOutput == ListReplicatorsOutput {
    /// This paginator transforms the `AsyncSequence` returned by `listReplicatorsPaginated`
    /// to access the nested member `[KafkaClientTypes.ReplicatorSummary]`
    /// - Returns: `[KafkaClientTypes.ReplicatorSummary]`
    public func replicators() async throws -> [KafkaClientTypes.ReplicatorSummary] {
        return try await self.asyncCompactMap { item in item.replicators }
    }
}
extension KafkaClient {
    /// Paginate over `[ListScramSecretsOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[ListScramSecretsInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `ListScramSecretsOutput`
    public func listScramSecretsPaginated(input: ListScramSecretsInput) -> ClientRuntime.PaginatorSequence<ListScramSecretsInput, ListScramSecretsOutput> {
        return ClientRuntime.PaginatorSequence<ListScramSecretsInput, ListScramSecretsOutput>(input: input, inputKey: \.nextToken, outputKey: \.nextToken, paginationFunction: self.listScramSecrets(input:))
    }
}

extension ListScramSecretsInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> ListScramSecretsInput {
        return ListScramSecretsInput(
            clusterArn: self.clusterArn,
            maxResults: self.maxResults,
            nextToken: token
        )}
}

extension PaginatorSequence where OperationStackInput == ListScramSecretsInput, OperationStackOutput == ListScramSecretsOutput {
    /// This paginator transforms the `AsyncSequence` returned by `listScramSecretsPaginated`
    /// to access the nested member `[Swift.String]`
    /// - Returns: `[Swift.String]`
    public func secretArnList() async throws -> [Swift.String] {
        return try await self.asyncCompactMap { item in item.secretArnList }
    }
}
extension KafkaClient {
    /// Paginate over `[ListVpcConnectionsOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[ListVpcConnectionsInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `ListVpcConnectionsOutput`
    public func listVpcConnectionsPaginated(input: ListVpcConnectionsInput) -> ClientRuntime.PaginatorSequence<ListVpcConnectionsInput, ListVpcConnectionsOutput> {
        return ClientRuntime.PaginatorSequence<ListVpcConnectionsInput, ListVpcConnectionsOutput>(input: input, inputKey: \.nextToken, outputKey: \.nextToken, paginationFunction: self.listVpcConnections(input:))
    }
}

extension ListVpcConnectionsInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> ListVpcConnectionsInput {
        return ListVpcConnectionsInput(
            maxResults: self.maxResults,
            nextToken: token
        )}
}

extension PaginatorSequence where OperationStackInput == ListVpcConnectionsInput, OperationStackOutput == ListVpcConnectionsOutput {
    /// This paginator transforms the `AsyncSequence` returned by `listVpcConnectionsPaginated`
    /// to access the nested member `[KafkaClientTypes.VpcConnection]`
    /// - Returns: `[KafkaClientTypes.VpcConnection]`
    public func vpcConnections() async throws -> [KafkaClientTypes.VpcConnection] {
        return try await self.asyncCompactMap { item in item.vpcConnections }
    }
}
