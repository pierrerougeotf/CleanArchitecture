//
//  ComputationRequirement.swift
//  
//
//  Created by Pierre Rougeot on 06/08/2022.
//

public protocol ComputationRequirement {
    associatedtype Number
    associatedtype Operation
    func perform(operation: Operation, on firstOperand: Number, and secondOperand: Number) throws -> Number
}
