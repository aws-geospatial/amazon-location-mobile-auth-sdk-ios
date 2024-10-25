//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

// Code generated by smithy-swift-codegen. DO NOT EDIT!

import class SmithyWaitersAPI.Waiter
import enum SmithyWaitersAPI.JMESUtils
import protocol ClientRuntime.ServiceError
import struct SmithyWaitersAPI.WaiterConfiguration
import struct SmithyWaitersAPI.WaiterOptions
import struct SmithyWaitersAPI.WaiterOutcome

extension DynamoDBClient {

    static func tableExistsWaiterConfig() throws -> SmithyWaitersAPI.WaiterConfiguration<DescribeTableInput, DescribeTableOutput> {
        let acceptors: [SmithyWaitersAPI.WaiterConfiguration<DescribeTableInput, DescribeTableOutput>.Acceptor] = [
            .init(state: .success, matcher: { (input: DescribeTableInput, result: Swift.Result<DescribeTableOutput, Swift.Error>) -> Bool in
                // JMESPath expression: "Table.TableStatus"
                // JMESPath comparator: "stringEquals"
                // JMESPath expected value: "ACTIVE"
                guard case .success(let output) = result else { return false }
                let table = output.table
                let tableStatus = table?.tableStatus
                return SmithyWaitersAPI.JMESUtils.compare(tableStatus, ==, "ACTIVE")
            }),
            .init(state: .retry, matcher: { (input: DescribeTableInput, result: Swift.Result<DescribeTableOutput, Swift.Error>) -> Bool in
                guard case .failure(let error) = result else { return false }
                return (error as? ClientRuntime.ServiceError)?.typeName == "ResourceNotFoundException"
            }),
        ]
        return try SmithyWaitersAPI.WaiterConfiguration<DescribeTableInput, DescribeTableOutput>(acceptors: acceptors, minDelay: 20.0, maxDelay: 120.0)
    }

    /// Initiates waiting for the TableExists event on the describeTable operation.
    /// The operation will be tried and (if necessary) retried until the wait succeeds, fails, or times out.
    /// Returns a `WaiterOutcome` asynchronously on waiter success, throws an error asynchronously on
    /// waiter failure or timeout.
    /// - Parameters:
    ///   - options: `WaiterOptions` to be used to configure this wait.
    ///   - input: The `DescribeTableInput` object to be used as a parameter when performing the operation.
    /// - Returns: A `WaiterOutcome` with the result of the final, successful performance of the operation.
    /// - Throws: `WaiterFailureError` if the waiter fails due to matching an `Acceptor` with state `failure`
    /// or there is an error not handled by any `Acceptor.`
    /// `WaiterTimeoutError` if the waiter times out.
    public func waitUntilTableExists(options: SmithyWaitersAPI.WaiterOptions, input: DescribeTableInput) async throws -> SmithyWaitersAPI.WaiterOutcome<DescribeTableOutput> {
        let waiter = SmithyWaitersAPI.Waiter(config: try Self.tableExistsWaiterConfig(), operation: self.describeTable(input:))
        return try await waiter.waitUntil(options: options, input: input)
    }

    static func tableNotExistsWaiterConfig() throws -> SmithyWaitersAPI.WaiterConfiguration<DescribeTableInput, DescribeTableOutput> {
        let acceptors: [SmithyWaitersAPI.WaiterConfiguration<DescribeTableInput, DescribeTableOutput>.Acceptor] = [
            .init(state: .success, matcher: { (input: DescribeTableInput, result: Swift.Result<DescribeTableOutput, Swift.Error>) -> Bool in
                guard case .failure(let error) = result else { return false }
                return (error as? ClientRuntime.ServiceError)?.typeName == "ResourceNotFoundException"
            }),
        ]
        return try SmithyWaitersAPI.WaiterConfiguration<DescribeTableInput, DescribeTableOutput>(acceptors: acceptors, minDelay: 20.0, maxDelay: 120.0)
    }

    /// Initiates waiting for the TableNotExists event on the describeTable operation.
    /// The operation will be tried and (if necessary) retried until the wait succeeds, fails, or times out.
    /// Returns a `WaiterOutcome` asynchronously on waiter success, throws an error asynchronously on
    /// waiter failure or timeout.
    /// - Parameters:
    ///   - options: `WaiterOptions` to be used to configure this wait.
    ///   - input: The `DescribeTableInput` object to be used as a parameter when performing the operation.
    /// - Returns: A `WaiterOutcome` with the result of the final, successful performance of the operation.
    /// - Throws: `WaiterFailureError` if the waiter fails due to matching an `Acceptor` with state `failure`
    /// or there is an error not handled by any `Acceptor.`
    /// `WaiterTimeoutError` if the waiter times out.
    public func waitUntilTableNotExists(options: SmithyWaitersAPI.WaiterOptions, input: DescribeTableInput) async throws -> SmithyWaitersAPI.WaiterOutcome<DescribeTableOutput> {
        let waiter = SmithyWaitersAPI.Waiter(config: try Self.tableNotExistsWaiterConfig(), operation: self.describeTable(input:))
        return try await waiter.waitUntil(options: options, input: input)
    }
}
