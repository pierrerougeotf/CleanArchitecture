//
//  EnterOperationRequirement.swift
//  
//
//  Created by Pierre Rougeot on 12/08/2022.
//

public protocol EnterOperationRequirement {
    associatedtype Number
    associatedtype Operation
    func execute(operation: Operation) throws -> Number
}
