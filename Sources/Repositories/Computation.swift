//
//  Computation.swift
//
//
//  Created by Pierre Rougeot on 06/08/2022.
//

public struct Computation<Number: NumberRequirement, Operation: OperationRequirement & Equatable> {
    public enum Error: String, Swift.Error {
        case zeroDivision
        case overflow
        case unknownOperation
    }

    public init() { }

    // MARK: - ComputationRepository

    public func perform(operation: Operation, on firstOperand: Number, and secondOperand: Number) throws -> Number {
        let numberOperation: (Number) -> (Number) -> (partialValue: Number, overflow: Bool)
        switch operation {
        case .plus:
            numberOperation = Number.addingReportingOverflow
        case .minus:
            numberOperation = Number.subtractingReportingOverflow
        case .multiply:
            numberOperation = Number.multipliedReportingOverflow
        case .divide:
            if secondOperand == 0 { throw Error.zeroDivision }
            numberOperation = Number.dividedReportingOverflow
        default:
            throw Error.unknownOperation
        }
        let (result, overflow) = numberOperation(firstOperand)(secondOperand)
        if overflow {
            throw Error.overflow
        } else {
            return result
        }
    }
}

private extension OperationRequirement where Self: Equatable {
    static func ~=(pattern: Self, value: Self) -> Bool {
        return value == pattern
    }
}
