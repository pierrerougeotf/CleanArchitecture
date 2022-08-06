//
//  StackTests.swift
//  
//
//  Created by Pierre Rougeot on 06/08/2022.
//

import XCTest
@testable import Repositories

private typealias Number = Int

class StackTests: XCTestCase {
    
    private let stack = Stack<Number>()

    func testStack() throws {
        stack.push(number: 3)
        stack.push(number: 4)
        
        XCTAssertEqual(try stack.pop(), 4)
        XCTAssertEqual(try stack.pop(), 3)
        XCTAssertThrowsError(try stack.pop(), "Should trigger empty stack exception") { error in
            XCTAssertEqual(Stack<Number>.Error.emptyStack, error as? Stack<Number>.Error)
        }
    }
}
