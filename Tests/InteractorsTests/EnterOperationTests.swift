//
//  EnterOperationTests.swift
//
//
//  Created by Pierre Rougeot on 06/08/2022.
//

import XCTest
@testable import Interactors

class EnterOperationTests: XCTestCase {
    
    private let stackRepository = Stack()
    private let computationRepository = Computation()
    private lazy var enterOperation = EnterOperation(
        stackRepository: stackRepository,
        computationRepository: computationRepository
    )
    
    func testEnterOperation() throws {
        XCTAssertEqual(stackRepository.description, "[25, 26, 28, 30]")
        _ = try enterOperation.perform(operation: .plus)
        XCTAssertEqual(stackRepository.description, "[25, 26, 58]")
        _ = try enterOperation.perform(operation: .plus)
        XCTAssertEqual(stackRepository.description, "[25, 84]")
        _ = try enterOperation.perform(operation: .plus)
        XCTAssertEqual(stackRepository.description, "[109]")
        XCTAssertThrowsError(
            try enterOperation.perform(operation: .plus),
            "Should trigger emptyStack exception"
        ) { error in
            XCTAssertEqual(Stack.Error.emptyStack, error as? Stack.Error)
        }
    }
    
    // MARK: - Requirements
    
    typealias Number = Int
    
    enum Operation {
        case plus
        case minus
        case multiply
        case divide
    }
    
    class Stack {
        enum Error: Swift.Error {
            case emptyStack
        }

        func push(number: Number) {
            stack.append(number)
        }

        func pop() throws -> Number {
            guard let number = stack.popLast() else { throw Error.emptyStack }
            return number
        }

        var description: String { stack.description }

        // MARK: - Private

        private var stack: [Number] = [25, 26, 28, 30]
    }
    
    class Computation {
        enum Error: Swift.Error {
            case notImplemented
        }

        func perform(operation: Operation, on firstOperand: Number, and secondOperand: Number) throws -> Number {
            switch operation {
            case .plus:
                return firstOperand + secondOperand
            default:
                throw Error.notImplemented
            }
        }
    }
}

extension EnterOperationTests.Stack: StackRequirement { }
extension EnterOperationTests.Computation: ComputationRequirement { }

