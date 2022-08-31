//
//  main.swift
//  
//
//  Created by Pierre Rougeot on 31/08/2022.
//

#if os(macOS)
import ArgumentParser

import Factory

struct Calculator: ParsableCommand {
    @Argument(help: "The phrase to repeat.")
    var arguments: [String]

    mutating func run() throws {
        var result: Number = 0
        for argument in arguments {
            if let number = Number(argument) {
                enterNumberInteractor.execute(number: number)
            } else if let operation = Operation(rawValue: argument) {
                result = try enterOperationInteractor.execute(operation: operation)
            }
        }
        print(result)
    }
}

Calculator.main()

extension Operation: RawRepresentable {
    public init?(rawValue: String) {
        switch rawValue {
        case "+":
            self = .plus
        case "-":
            self = .minus
        case "*":
            self = .multiply
        case "/":
            self = .divide
        default:
            return nil
        }
    }
    
    public var rawValue: String {
        switch self {
        case .plus:
            return "+"
        case .minus:
            return "-"
        case .multiply:
            return "*"
        case .divide:
            return "/"
        }
    }
}
#endif
