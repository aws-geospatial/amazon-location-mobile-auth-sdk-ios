//
// Copyright Amazon.com Inc. or its affiliates.
// All Rights Reserved.
//
// SPDX-License-Identifier: Apache-2.0
//

// Code generated by smithy-swift-codegen. DO NOT EDIT!

import class SmithyWaitersAPI.Waiter
import enum SmithyWaitersAPI.JMESUtils
import struct SmithyWaitersAPI.WaiterConfiguration
import struct SmithyWaitersAPI.WaiterOptions
import struct SmithyWaitersAPI.WaiterOutcome

extension ECRClient {

    static func imageScanCompleteWaiterConfig() throws -> SmithyWaitersAPI.WaiterConfiguration<DescribeImageScanFindingsInput, DescribeImageScanFindingsOutput> {
        let acceptors: [SmithyWaitersAPI.WaiterConfiguration<DescribeImageScanFindingsInput, DescribeImageScanFindingsOutput>.Acceptor] = [
            .init(state: .success, matcher: { (input: DescribeImageScanFindingsInput, result: Swift.Result<DescribeImageScanFindingsOutput, Swift.Error>) -> Bool in
                // JMESPath expression: "imageScanStatus.status"
                // JMESPath comparator: "stringEquals"
                // JMESPath expected value: "COMPLETE"
                guard case .success(let output) = result else { return false }
                let imageScanStatus = output.imageScanStatus
                let status = imageScanStatus?.status
                return SmithyWaitersAPI.JMESUtils.compare(status, ==, "COMPLETE")
            }),
            .init(state: .failure, matcher: { (input: DescribeImageScanFindingsInput, result: Swift.Result<DescribeImageScanFindingsOutput, Swift.Error>) -> Bool in
                // JMESPath expression: "imageScanStatus.status"
                // JMESPath comparator: "stringEquals"
                // JMESPath expected value: "FAILED"
                guard case .success(let output) = result else { return false }
                let imageScanStatus = output.imageScanStatus
                let status = imageScanStatus?.status
                return SmithyWaitersAPI.JMESUtils.compare(status, ==, "FAILED")
            }),
        ]
        return try SmithyWaitersAPI.WaiterConfiguration<DescribeImageScanFindingsInput, DescribeImageScanFindingsOutput>(acceptors: acceptors, minDelay: 5.0, maxDelay: 120.0)
    }

    /// Initiates waiting for the ImageScanComplete event on the describeImageScanFindings operation.
    /// The operation will be tried and (if necessary) retried until the wait succeeds, fails, or times out.
    /// Returns a `WaiterOutcome` asynchronously on waiter success, throws an error asynchronously on
    /// waiter failure or timeout.
    /// - Parameters:
    ///   - options: `WaiterOptions` to be used to configure this wait.
    ///   - input: The `DescribeImageScanFindingsInput` object to be used as a parameter when performing the operation.
    /// - Returns: A `WaiterOutcome` with the result of the final, successful performance of the operation.
    /// - Throws: `WaiterFailureError` if the waiter fails due to matching an `Acceptor` with state `failure`
    /// or there is an error not handled by any `Acceptor.`
    /// `WaiterTimeoutError` if the waiter times out.
    public func waitUntilImageScanComplete(options: SmithyWaitersAPI.WaiterOptions, input: DescribeImageScanFindingsInput) async throws -> SmithyWaitersAPI.WaiterOutcome<DescribeImageScanFindingsOutput> {
        let waiter = SmithyWaitersAPI.Waiter(config: try Self.imageScanCompleteWaiterConfig(), operation: self.describeImageScanFindings(input:))
        return try await waiter.waitUntil(options: options, input: input)
    }

    static func lifecyclePolicyPreviewCompleteWaiterConfig() throws -> SmithyWaitersAPI.WaiterConfiguration<GetLifecyclePolicyPreviewInput, GetLifecyclePolicyPreviewOutput> {
        let acceptors: [SmithyWaitersAPI.WaiterConfiguration<GetLifecyclePolicyPreviewInput, GetLifecyclePolicyPreviewOutput>.Acceptor] = [
            .init(state: .success, matcher: { (input: GetLifecyclePolicyPreviewInput, result: Swift.Result<GetLifecyclePolicyPreviewOutput, Swift.Error>) -> Bool in
                // JMESPath expression: "status"
                // JMESPath comparator: "stringEquals"
                // JMESPath expected value: "COMPLETE"
                guard case .success(let output) = result else { return false }
                let status = output.status
                return SmithyWaitersAPI.JMESUtils.compare(status, ==, "COMPLETE")
            }),
            .init(state: .failure, matcher: { (input: GetLifecyclePolicyPreviewInput, result: Swift.Result<GetLifecyclePolicyPreviewOutput, Swift.Error>) -> Bool in
                // JMESPath expression: "status"
                // JMESPath comparator: "stringEquals"
                // JMESPath expected value: "FAILED"
                guard case .success(let output) = result else { return false }
                let status = output.status
                return SmithyWaitersAPI.JMESUtils.compare(status, ==, "FAILED")
            }),
        ]
        return try SmithyWaitersAPI.WaiterConfiguration<GetLifecyclePolicyPreviewInput, GetLifecyclePolicyPreviewOutput>(acceptors: acceptors, minDelay: 5.0, maxDelay: 120.0)
    }

    /// Initiates waiting for the LifecyclePolicyPreviewComplete event on the getLifecyclePolicyPreview operation.
    /// The operation will be tried and (if necessary) retried until the wait succeeds, fails, or times out.
    /// Returns a `WaiterOutcome` asynchronously on waiter success, throws an error asynchronously on
    /// waiter failure or timeout.
    /// - Parameters:
    ///   - options: `WaiterOptions` to be used to configure this wait.
    ///   - input: The `GetLifecyclePolicyPreviewInput` object to be used as a parameter when performing the operation.
    /// - Returns: A `WaiterOutcome` with the result of the final, successful performance of the operation.
    /// - Throws: `WaiterFailureError` if the waiter fails due to matching an `Acceptor` with state `failure`
    /// or there is an error not handled by any `Acceptor.`
    /// `WaiterTimeoutError` if the waiter times out.
    public func waitUntilLifecyclePolicyPreviewComplete(options: SmithyWaitersAPI.WaiterOptions, input: GetLifecyclePolicyPreviewInput) async throws -> SmithyWaitersAPI.WaiterOutcome<GetLifecyclePolicyPreviewOutput> {
        let waiter = SmithyWaitersAPI.Waiter(config: try Self.lifecyclePolicyPreviewCompleteWaiterConfig(), operation: self.getLifecyclePolicyPreview(input:))
        return try await waiter.waitUntil(options: options, input: input)
    }
}
