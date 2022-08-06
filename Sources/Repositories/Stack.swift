//
//  Stack.swift
//  
//
//  Created by Pierre Rougeot on 06/08/2022.
//

public final class Stack<Number> {
    public enum Error: String, Swift.Error {
        case emptyStack
    }

    public init() { }

    // MARK: - StackRepository

    public func push(number: Number) {
        numbers.append(number)
    }

    public func pop() throws -> Number {
        guard let number = numbers.popLast() else {
            throw Error.emptyStack
        }
        return number
    }

    // MARK: - Private

    private var numbers: [Number] = []
}

