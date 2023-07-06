//
//  EnterNumberTests.swift
//  
//
//  Created by Pierre Rougeot on 06/08/2022.
//

import XCTest
@testable import Interactors

class EnterNumberTests: XCTestCase {
    
    private let stack = Stack()
    private lazy var enterNumber = stack

    func testEnterNumber() throws {
        enterNumber.execute(number: 35)
        XCTAssertEqual(stack.description, "35")
        enterNumber.execute(number: 46)
        XCTAssertEqual(stack.description, "46-35")
    }
    
    // MARK: - Requirements
    
    typealias Number = Int
    
    class Stack {
        func push(number: Number) {
            guard stack.isEmpty else {
                stack = String(number) + "-" + stack
                return
            }
            stack = String(number)
        }

        var description: String { stack }

        // MARK: - Private

        private var stack = ""
    }
}

// Assembly

extension EnterNumberTests.Stack: PushStackRequirement { }
extension EnterNumberTests.Stack {
    public func execute(number: Number) { push(number: number) }
}
