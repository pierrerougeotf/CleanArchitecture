//
//  ComputationTests.swift
//
//
//  Created by Pierre Rougeot on 06/08/2022.
//

import XCTest
@testable import Repositories

class ComputationTests: XCTestCase {
    private typealias Number = Int
    
    enum Operation {
        case plus
        case minus
        case multiply
        case divide
    }
    
    private let computation = Computation<Number, Operation>()

    func testComputation() throws {
        XCTAssertEqual(try computation.perform(operation: .plus, on: 3, and: 4), 7)
        XCTAssertEqual(try computation.perform(operation: .minus, on: 3, and: 4), -1)
        XCTAssertThrowsError(
            try computation.perform(operation: .plus, on: .max, and: .max),
            "Should trigger overflow exception") { error in
                XCTAssertEqual(
                    Computation<Number, Operation>.Error.overflow,
                    error as? Computation<Number, Operation>.Error
                )
            }
        XCTAssertThrowsError(
            try computation.perform(operation: .divide, on: .max, and: .zero),
            "Should trigger zeroDivision exception") { error in
                XCTAssertEqual(
                    Computation<Number, Operation>.Error.zeroDivision,
                    error as? Computation<Number, Operation>.Error
                )
            }
    }
}

extension ComputationTests.Operation: OperationRequirement { }
