//
//  Symbol+init.swift
//  
//
//  Created by Pierre Rougeot on 13/08/2022.
//

extension Symbol where Operation: OperationRequirement, Digit: FixedWidthInteger {
    private static var digits: [String] { (0...9).map { String($0) } }
    private static var operators: [String: Operation] { ["+": .plus, "-": .minus, "x": .multiply, "/": .divide] }
    private static var commands: [String: Command] { ["C": .clear, "E": .enter] }
    
    init?(_ value: String) {
        switch value {
        case Symbol.digits:
            guard let digit = Digit(value) else { return nil }
            self = .digit(digit)
        case Symbol.operators:
            guard let operation = Symbol.operators[value] else { return nil }
            self = .operation(operation)
        case Symbol.commands:
            guard let command = Symbol.commands[value] else { return nil }
            self = .command(command)
        default:
            return nil
        }
    }
}

extension String {
    static func ~=(array: [String], value: String) -> Bool { array.contains(value) }
    static func ~=(dictionary: [String: Any], value: String) -> Bool { dictionary.keys.contains(value) }
}
