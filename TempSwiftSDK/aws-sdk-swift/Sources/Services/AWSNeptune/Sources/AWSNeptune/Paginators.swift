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

extension NeptuneClient {
    /// Paginate over `[DescribeDBClusterEndpointsOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[DescribeDBClusterEndpointsInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `DescribeDBClusterEndpointsOutput`
    public func describeDBClusterEndpointsPaginated(input: DescribeDBClusterEndpointsInput) -> ClientRuntime.PaginatorSequence<DescribeDBClusterEndpointsInput, DescribeDBClusterEndpointsOutput> {
        return ClientRuntime.PaginatorSequence<DescribeDBClusterEndpointsInput, DescribeDBClusterEndpointsOutput>(input: input, inputKey: \.marker, outputKey: \.marker, paginationFunction: self.describeDBClusterEndpoints(input:))
    }
}

extension DescribeDBClusterEndpointsInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> DescribeDBClusterEndpointsInput {
        return DescribeDBClusterEndpointsInput(
            dbClusterEndpointIdentifier: self.dbClusterEndpointIdentifier,
            dbClusterIdentifier: self.dbClusterIdentifier,
            filters: self.filters,
            marker: token,
            maxRecords: self.maxRecords
        )}
}

extension PaginatorSequence where OperationStackInput == DescribeDBClusterEndpointsInput, OperationStackOutput == DescribeDBClusterEndpointsOutput {
    /// This paginator transforms the `AsyncSequence` returned by `describeDBClusterEndpointsPaginated`
    /// to access the nested member `[NeptuneClientTypes.DBClusterEndpoint]`
    /// - Returns: `[NeptuneClientTypes.DBClusterEndpoint]`
    public func dbClusterEndpoints() async throws -> [NeptuneClientTypes.DBClusterEndpoint] {
        return try await self.asyncCompactMap { item in item.dbClusterEndpoints }
    }
}
extension NeptuneClient {
    /// Paginate over `[DescribeDBClusterParameterGroupsOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[DescribeDBClusterParameterGroupsInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `DescribeDBClusterParameterGroupsOutput`
    public func describeDBClusterParameterGroupsPaginated(input: DescribeDBClusterParameterGroupsInput) -> ClientRuntime.PaginatorSequence<DescribeDBClusterParameterGroupsInput, DescribeDBClusterParameterGroupsOutput> {
        return ClientRuntime.PaginatorSequence<DescribeDBClusterParameterGroupsInput, DescribeDBClusterParameterGroupsOutput>(input: input, inputKey: \.marker, outputKey: \.marker, paginationFunction: self.describeDBClusterParameterGroups(input:))
    }
}

extension DescribeDBClusterParameterGroupsInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> DescribeDBClusterParameterGroupsInput {
        return DescribeDBClusterParameterGroupsInput(
            dbClusterParameterGroupName: self.dbClusterParameterGroupName,
            filters: self.filters,
            marker: token,
            maxRecords: self.maxRecords
        )}
}

extension PaginatorSequence where OperationStackInput == DescribeDBClusterParameterGroupsInput, OperationStackOutput == DescribeDBClusterParameterGroupsOutput {
    /// This paginator transforms the `AsyncSequence` returned by `describeDBClusterParameterGroupsPaginated`
    /// to access the nested member `[NeptuneClientTypes.DBClusterParameterGroup]`
    /// - Returns: `[NeptuneClientTypes.DBClusterParameterGroup]`
    public func dbClusterParameterGroups() async throws -> [NeptuneClientTypes.DBClusterParameterGroup] {
        return try await self.asyncCompactMap { item in item.dbClusterParameterGroups }
    }
}
extension NeptuneClient {
    /// Paginate over `[DescribeDBClusterParametersOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[DescribeDBClusterParametersInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `DescribeDBClusterParametersOutput`
    public func describeDBClusterParametersPaginated(input: DescribeDBClusterParametersInput) -> ClientRuntime.PaginatorSequence<DescribeDBClusterParametersInput, DescribeDBClusterParametersOutput> {
        return ClientRuntime.PaginatorSequence<DescribeDBClusterParametersInput, DescribeDBClusterParametersOutput>(input: input, inputKey: \.marker, outputKey: \.marker, paginationFunction: self.describeDBClusterParameters(input:))
    }
}

extension DescribeDBClusterParametersInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> DescribeDBClusterParametersInput {
        return DescribeDBClusterParametersInput(
            dbClusterParameterGroupName: self.dbClusterParameterGroupName,
            filters: self.filters,
            marker: token,
            maxRecords: self.maxRecords,
            source: self.source
        )}
}

extension PaginatorSequence where OperationStackInput == DescribeDBClusterParametersInput, OperationStackOutput == DescribeDBClusterParametersOutput {
    /// This paginator transforms the `AsyncSequence` returned by `describeDBClusterParametersPaginated`
    /// to access the nested member `[NeptuneClientTypes.Parameter]`
    /// - Returns: `[NeptuneClientTypes.Parameter]`
    public func parameters() async throws -> [NeptuneClientTypes.Parameter] {
        return try await self.asyncCompactMap { item in item.parameters }
    }
}
extension NeptuneClient {
    /// Paginate over `[DescribeDBClustersOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[DescribeDBClustersInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `DescribeDBClustersOutput`
    public func describeDBClustersPaginated(input: DescribeDBClustersInput) -> ClientRuntime.PaginatorSequence<DescribeDBClustersInput, DescribeDBClustersOutput> {
        return ClientRuntime.PaginatorSequence<DescribeDBClustersInput, DescribeDBClustersOutput>(input: input, inputKey: \.marker, outputKey: \.marker, paginationFunction: self.describeDBClusters(input:))
    }
}

extension DescribeDBClustersInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> DescribeDBClustersInput {
        return DescribeDBClustersInput(
            dbClusterIdentifier: self.dbClusterIdentifier,
            filters: self.filters,
            marker: token,
            maxRecords: self.maxRecords
        )}
}

extension PaginatorSequence where OperationStackInput == DescribeDBClustersInput, OperationStackOutput == DescribeDBClustersOutput {
    /// This paginator transforms the `AsyncSequence` returned by `describeDBClustersPaginated`
    /// to access the nested member `[NeptuneClientTypes.DBCluster]`
    /// - Returns: `[NeptuneClientTypes.DBCluster]`
    public func dbClusters() async throws -> [NeptuneClientTypes.DBCluster] {
        return try await self.asyncCompactMap { item in item.dbClusters }
    }
}
extension NeptuneClient {
    /// Paginate over `[DescribeDBClusterSnapshotsOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[DescribeDBClusterSnapshotsInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `DescribeDBClusterSnapshotsOutput`
    public func describeDBClusterSnapshotsPaginated(input: DescribeDBClusterSnapshotsInput) -> ClientRuntime.PaginatorSequence<DescribeDBClusterSnapshotsInput, DescribeDBClusterSnapshotsOutput> {
        return ClientRuntime.PaginatorSequence<DescribeDBClusterSnapshotsInput, DescribeDBClusterSnapshotsOutput>(input: input, inputKey: \.marker, outputKey: \.marker, paginationFunction: self.describeDBClusterSnapshots(input:))
    }
}

extension DescribeDBClusterSnapshotsInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> DescribeDBClusterSnapshotsInput {
        return DescribeDBClusterSnapshotsInput(
            dbClusterIdentifier: self.dbClusterIdentifier,
            dbClusterSnapshotIdentifier: self.dbClusterSnapshotIdentifier,
            filters: self.filters,
            includePublic: self.includePublic,
            includeShared: self.includeShared,
            marker: token,
            maxRecords: self.maxRecords,
            snapshotType: self.snapshotType
        )}
}

extension PaginatorSequence where OperationStackInput == DescribeDBClusterSnapshotsInput, OperationStackOutput == DescribeDBClusterSnapshotsOutput {
    /// This paginator transforms the `AsyncSequence` returned by `describeDBClusterSnapshotsPaginated`
    /// to access the nested member `[NeptuneClientTypes.DBClusterSnapshot]`
    /// - Returns: `[NeptuneClientTypes.DBClusterSnapshot]`
    public func dbClusterSnapshots() async throws -> [NeptuneClientTypes.DBClusterSnapshot] {
        return try await self.asyncCompactMap { item in item.dbClusterSnapshots }
    }
}
extension NeptuneClient {
    /// Paginate over `[DescribeDBEngineVersionsOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[DescribeDBEngineVersionsInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `DescribeDBEngineVersionsOutput`
    public func describeDBEngineVersionsPaginated(input: DescribeDBEngineVersionsInput) -> ClientRuntime.PaginatorSequence<DescribeDBEngineVersionsInput, DescribeDBEngineVersionsOutput> {
        return ClientRuntime.PaginatorSequence<DescribeDBEngineVersionsInput, DescribeDBEngineVersionsOutput>(input: input, inputKey: \.marker, outputKey: \.marker, paginationFunction: self.describeDBEngineVersions(input:))
    }
}

extension DescribeDBEngineVersionsInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> DescribeDBEngineVersionsInput {
        return DescribeDBEngineVersionsInput(
            dbParameterGroupFamily: self.dbParameterGroupFamily,
            defaultOnly: self.defaultOnly,
            engine: self.engine,
            engineVersion: self.engineVersion,
            filters: self.filters,
            listSupportedCharacterSets: self.listSupportedCharacterSets,
            listSupportedTimezones: self.listSupportedTimezones,
            marker: token,
            maxRecords: self.maxRecords
        )}
}

extension PaginatorSequence where OperationStackInput == DescribeDBEngineVersionsInput, OperationStackOutput == DescribeDBEngineVersionsOutput {
    /// This paginator transforms the `AsyncSequence` returned by `describeDBEngineVersionsPaginated`
    /// to access the nested member `[NeptuneClientTypes.DBEngineVersion]`
    /// - Returns: `[NeptuneClientTypes.DBEngineVersion]`
    public func dbEngineVersions() async throws -> [NeptuneClientTypes.DBEngineVersion] {
        return try await self.asyncCompactMap { item in item.dbEngineVersions }
    }
}
extension NeptuneClient {
    /// Paginate over `[DescribeDBInstancesOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[DescribeDBInstancesInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `DescribeDBInstancesOutput`
    public func describeDBInstancesPaginated(input: DescribeDBInstancesInput) -> ClientRuntime.PaginatorSequence<DescribeDBInstancesInput, DescribeDBInstancesOutput> {
        return ClientRuntime.PaginatorSequence<DescribeDBInstancesInput, DescribeDBInstancesOutput>(input: input, inputKey: \.marker, outputKey: \.marker, paginationFunction: self.describeDBInstances(input:))
    }
}

extension DescribeDBInstancesInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> DescribeDBInstancesInput {
        return DescribeDBInstancesInput(
            dbInstanceIdentifier: self.dbInstanceIdentifier,
            filters: self.filters,
            marker: token,
            maxRecords: self.maxRecords
        )}
}

extension PaginatorSequence where OperationStackInput == DescribeDBInstancesInput, OperationStackOutput == DescribeDBInstancesOutput {
    /// This paginator transforms the `AsyncSequence` returned by `describeDBInstancesPaginated`
    /// to access the nested member `[NeptuneClientTypes.DBInstance]`
    /// - Returns: `[NeptuneClientTypes.DBInstance]`
    public func dbInstances() async throws -> [NeptuneClientTypes.DBInstance] {
        return try await self.asyncCompactMap { item in item.dbInstances }
    }
}
extension NeptuneClient {
    /// Paginate over `[DescribeDBParameterGroupsOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[DescribeDBParameterGroupsInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `DescribeDBParameterGroupsOutput`
    public func describeDBParameterGroupsPaginated(input: DescribeDBParameterGroupsInput) -> ClientRuntime.PaginatorSequence<DescribeDBParameterGroupsInput, DescribeDBParameterGroupsOutput> {
        return ClientRuntime.PaginatorSequence<DescribeDBParameterGroupsInput, DescribeDBParameterGroupsOutput>(input: input, inputKey: \.marker, outputKey: \.marker, paginationFunction: self.describeDBParameterGroups(input:))
    }
}

extension DescribeDBParameterGroupsInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> DescribeDBParameterGroupsInput {
        return DescribeDBParameterGroupsInput(
            dbParameterGroupName: self.dbParameterGroupName,
            filters: self.filters,
            marker: token,
            maxRecords: self.maxRecords
        )}
}

extension PaginatorSequence where OperationStackInput == DescribeDBParameterGroupsInput, OperationStackOutput == DescribeDBParameterGroupsOutput {
    /// This paginator transforms the `AsyncSequence` returned by `describeDBParameterGroupsPaginated`
    /// to access the nested member `[NeptuneClientTypes.DBParameterGroup]`
    /// - Returns: `[NeptuneClientTypes.DBParameterGroup]`
    public func dbParameterGroups() async throws -> [NeptuneClientTypes.DBParameterGroup] {
        return try await self.asyncCompactMap { item in item.dbParameterGroups }
    }
}
extension NeptuneClient {
    /// Paginate over `[DescribeDBParametersOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[DescribeDBParametersInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `DescribeDBParametersOutput`
    public func describeDBParametersPaginated(input: DescribeDBParametersInput) -> ClientRuntime.PaginatorSequence<DescribeDBParametersInput, DescribeDBParametersOutput> {
        return ClientRuntime.PaginatorSequence<DescribeDBParametersInput, DescribeDBParametersOutput>(input: input, inputKey: \.marker, outputKey: \.marker, paginationFunction: self.describeDBParameters(input:))
    }
}

extension DescribeDBParametersInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> DescribeDBParametersInput {
        return DescribeDBParametersInput(
            dbParameterGroupName: self.dbParameterGroupName,
            filters: self.filters,
            marker: token,
            maxRecords: self.maxRecords,
            source: self.source
        )}
}

extension PaginatorSequence where OperationStackInput == DescribeDBParametersInput, OperationStackOutput == DescribeDBParametersOutput {
    /// This paginator transforms the `AsyncSequence` returned by `describeDBParametersPaginated`
    /// to access the nested member `[NeptuneClientTypes.Parameter]`
    /// - Returns: `[NeptuneClientTypes.Parameter]`
    public func parameters() async throws -> [NeptuneClientTypes.Parameter] {
        return try await self.asyncCompactMap { item in item.parameters }
    }
}
extension NeptuneClient {
    /// Paginate over `[DescribeDBSubnetGroupsOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[DescribeDBSubnetGroupsInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `DescribeDBSubnetGroupsOutput`
    public func describeDBSubnetGroupsPaginated(input: DescribeDBSubnetGroupsInput) -> ClientRuntime.PaginatorSequence<DescribeDBSubnetGroupsInput, DescribeDBSubnetGroupsOutput> {
        return ClientRuntime.PaginatorSequence<DescribeDBSubnetGroupsInput, DescribeDBSubnetGroupsOutput>(input: input, inputKey: \.marker, outputKey: \.marker, paginationFunction: self.describeDBSubnetGroups(input:))
    }
}

extension DescribeDBSubnetGroupsInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> DescribeDBSubnetGroupsInput {
        return DescribeDBSubnetGroupsInput(
            dbSubnetGroupName: self.dbSubnetGroupName,
            filters: self.filters,
            marker: token,
            maxRecords: self.maxRecords
        )}
}

extension PaginatorSequence where OperationStackInput == DescribeDBSubnetGroupsInput, OperationStackOutput == DescribeDBSubnetGroupsOutput {
    /// This paginator transforms the `AsyncSequence` returned by `describeDBSubnetGroupsPaginated`
    /// to access the nested member `[NeptuneClientTypes.DBSubnetGroup]`
    /// - Returns: `[NeptuneClientTypes.DBSubnetGroup]`
    public func dbSubnetGroups() async throws -> [NeptuneClientTypes.DBSubnetGroup] {
        return try await self.asyncCompactMap { item in item.dbSubnetGroups }
    }
}
extension NeptuneClient {
    /// Paginate over `[DescribeEngineDefaultParametersOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[DescribeEngineDefaultParametersInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `DescribeEngineDefaultParametersOutput`
    public func describeEngineDefaultParametersPaginated(input: DescribeEngineDefaultParametersInput) -> ClientRuntime.PaginatorSequence<DescribeEngineDefaultParametersInput, DescribeEngineDefaultParametersOutput> {
        return ClientRuntime.PaginatorSequence<DescribeEngineDefaultParametersInput, DescribeEngineDefaultParametersOutput>(input: input, inputKey: \.marker, outputKey: \.engineDefaults?.marker, paginationFunction: self.describeEngineDefaultParameters(input:))
    }
}

extension DescribeEngineDefaultParametersInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> DescribeEngineDefaultParametersInput {
        return DescribeEngineDefaultParametersInput(
            dbParameterGroupFamily: self.dbParameterGroupFamily,
            filters: self.filters,
            marker: token,
            maxRecords: self.maxRecords
        )}
}

extension PaginatorSequence where OperationStackInput == DescribeEngineDefaultParametersInput, OperationStackOutput == DescribeEngineDefaultParametersOutput {
    /// This paginator transforms the `AsyncSequence` returned by `describeEngineDefaultParametersPaginated`
    /// to access the nested member `[NeptuneClientTypes.Parameter]`
    /// - Returns: `[NeptuneClientTypes.Parameter]`
    public func parameters() async throws -> [NeptuneClientTypes.Parameter] {
        return try await self.asyncCompactMap { item in item.engineDefaults?.parameters }
    }
}
extension NeptuneClient {
    /// Paginate over `[DescribeEventsOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[DescribeEventsInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `DescribeEventsOutput`
    public func describeEventsPaginated(input: DescribeEventsInput) -> ClientRuntime.PaginatorSequence<DescribeEventsInput, DescribeEventsOutput> {
        return ClientRuntime.PaginatorSequence<DescribeEventsInput, DescribeEventsOutput>(input: input, inputKey: \.marker, outputKey: \.marker, paginationFunction: self.describeEvents(input:))
    }
}

extension DescribeEventsInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> DescribeEventsInput {
        return DescribeEventsInput(
            duration: self.duration,
            endTime: self.endTime,
            eventCategories: self.eventCategories,
            filters: self.filters,
            marker: token,
            maxRecords: self.maxRecords,
            sourceIdentifier: self.sourceIdentifier,
            sourceType: self.sourceType,
            startTime: self.startTime
        )}
}

extension PaginatorSequence where OperationStackInput == DescribeEventsInput, OperationStackOutput == DescribeEventsOutput {
    /// This paginator transforms the `AsyncSequence` returned by `describeEventsPaginated`
    /// to access the nested member `[NeptuneClientTypes.Event]`
    /// - Returns: `[NeptuneClientTypes.Event]`
    public func events() async throws -> [NeptuneClientTypes.Event] {
        return try await self.asyncCompactMap { item in item.events }
    }
}
extension NeptuneClient {
    /// Paginate over `[DescribeEventSubscriptionsOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[DescribeEventSubscriptionsInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `DescribeEventSubscriptionsOutput`
    public func describeEventSubscriptionsPaginated(input: DescribeEventSubscriptionsInput) -> ClientRuntime.PaginatorSequence<DescribeEventSubscriptionsInput, DescribeEventSubscriptionsOutput> {
        return ClientRuntime.PaginatorSequence<DescribeEventSubscriptionsInput, DescribeEventSubscriptionsOutput>(input: input, inputKey: \.marker, outputKey: \.marker, paginationFunction: self.describeEventSubscriptions(input:))
    }
}

extension DescribeEventSubscriptionsInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> DescribeEventSubscriptionsInput {
        return DescribeEventSubscriptionsInput(
            filters: self.filters,
            marker: token,
            maxRecords: self.maxRecords,
            subscriptionName: self.subscriptionName
        )}
}

extension PaginatorSequence where OperationStackInput == DescribeEventSubscriptionsInput, OperationStackOutput == DescribeEventSubscriptionsOutput {
    /// This paginator transforms the `AsyncSequence` returned by `describeEventSubscriptionsPaginated`
    /// to access the nested member `[NeptuneClientTypes.EventSubscription]`
    /// - Returns: `[NeptuneClientTypes.EventSubscription]`
    public func eventSubscriptionsList() async throws -> [NeptuneClientTypes.EventSubscription] {
        return try await self.asyncCompactMap { item in item.eventSubscriptionsList }
    }
}
extension NeptuneClient {
    /// Paginate over `[DescribeGlobalClustersOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[DescribeGlobalClustersInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `DescribeGlobalClustersOutput`
    public func describeGlobalClustersPaginated(input: DescribeGlobalClustersInput) -> ClientRuntime.PaginatorSequence<DescribeGlobalClustersInput, DescribeGlobalClustersOutput> {
        return ClientRuntime.PaginatorSequence<DescribeGlobalClustersInput, DescribeGlobalClustersOutput>(input: input, inputKey: \.marker, outputKey: \.marker, paginationFunction: self.describeGlobalClusters(input:))
    }
}

extension DescribeGlobalClustersInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> DescribeGlobalClustersInput {
        return DescribeGlobalClustersInput(
            globalClusterIdentifier: self.globalClusterIdentifier,
            marker: token,
            maxRecords: self.maxRecords
        )}
}

extension PaginatorSequence where OperationStackInput == DescribeGlobalClustersInput, OperationStackOutput == DescribeGlobalClustersOutput {
    /// This paginator transforms the `AsyncSequence` returned by `describeGlobalClustersPaginated`
    /// to access the nested member `[NeptuneClientTypes.GlobalCluster]`
    /// - Returns: `[NeptuneClientTypes.GlobalCluster]`
    public func globalClusters() async throws -> [NeptuneClientTypes.GlobalCluster] {
        return try await self.asyncCompactMap { item in item.globalClusters }
    }
}
extension NeptuneClient {
    /// Paginate over `[DescribeOrderableDBInstanceOptionsOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[DescribeOrderableDBInstanceOptionsInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `DescribeOrderableDBInstanceOptionsOutput`
    public func describeOrderableDBInstanceOptionsPaginated(input: DescribeOrderableDBInstanceOptionsInput) -> ClientRuntime.PaginatorSequence<DescribeOrderableDBInstanceOptionsInput, DescribeOrderableDBInstanceOptionsOutput> {
        return ClientRuntime.PaginatorSequence<DescribeOrderableDBInstanceOptionsInput, DescribeOrderableDBInstanceOptionsOutput>(input: input, inputKey: \.marker, outputKey: \.marker, paginationFunction: self.describeOrderableDBInstanceOptions(input:))
    }
}

extension DescribeOrderableDBInstanceOptionsInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> DescribeOrderableDBInstanceOptionsInput {
        return DescribeOrderableDBInstanceOptionsInput(
            dbInstanceClass: self.dbInstanceClass,
            engine: self.engine,
            engineVersion: self.engineVersion,
            filters: self.filters,
            licenseModel: self.licenseModel,
            marker: token,
            maxRecords: self.maxRecords,
            vpc: self.vpc
        )}
}

extension PaginatorSequence where OperationStackInput == DescribeOrderableDBInstanceOptionsInput, OperationStackOutput == DescribeOrderableDBInstanceOptionsOutput {
    /// This paginator transforms the `AsyncSequence` returned by `describeOrderableDBInstanceOptionsPaginated`
    /// to access the nested member `[NeptuneClientTypes.OrderableDBInstanceOption]`
    /// - Returns: `[NeptuneClientTypes.OrderableDBInstanceOption]`
    public func orderableDBInstanceOptions() async throws -> [NeptuneClientTypes.OrderableDBInstanceOption] {
        return try await self.asyncCompactMap { item in item.orderableDBInstanceOptions }
    }
}
extension NeptuneClient {
    /// Paginate over `[DescribePendingMaintenanceActionsOutput]` results.
    ///
    /// When this operation is called, an `AsyncSequence` is created. AsyncSequences are lazy so no service
    /// calls are made until the sequence is iterated over. This also means there is no guarantee that the request is valid
    /// until then. If there are errors in your request, you will see the failures only after you start iterating.
    /// - Parameters:
    ///     - input: A `[DescribePendingMaintenanceActionsInput]` to start pagination
    /// - Returns: An `AsyncSequence` that can iterate over `DescribePendingMaintenanceActionsOutput`
    public func describePendingMaintenanceActionsPaginated(input: DescribePendingMaintenanceActionsInput) -> ClientRuntime.PaginatorSequence<DescribePendingMaintenanceActionsInput, DescribePendingMaintenanceActionsOutput> {
        return ClientRuntime.PaginatorSequence<DescribePendingMaintenanceActionsInput, DescribePendingMaintenanceActionsOutput>(input: input, inputKey: \.marker, outputKey: \.marker, paginationFunction: self.describePendingMaintenanceActions(input:))
    }
}

extension DescribePendingMaintenanceActionsInput: ClientRuntime.PaginateToken {
    public func usingPaginationToken(_ token: Swift.String) -> DescribePendingMaintenanceActionsInput {
        return DescribePendingMaintenanceActionsInput(
            filters: self.filters,
            marker: token,
            maxRecords: self.maxRecords,
            resourceIdentifier: self.resourceIdentifier
        )}
}

extension PaginatorSequence where OperationStackInput == DescribePendingMaintenanceActionsInput, OperationStackOutput == DescribePendingMaintenanceActionsOutput {
    /// This paginator transforms the `AsyncSequence` returned by `describePendingMaintenanceActionsPaginated`
    /// to access the nested member `[NeptuneClientTypes.ResourcePendingMaintenanceActions]`
    /// - Returns: `[NeptuneClientTypes.ResourcePendingMaintenanceActions]`
    public func pendingMaintenanceActions() async throws -> [NeptuneClientTypes.ResourcePendingMaintenanceActions] {
        return try await self.asyncCompactMap { item in item.pendingMaintenanceActions }
    }
}
