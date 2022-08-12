//
//  InteractorsTDI.swift
//  
//
//  Created by Pierre Rougeot on 12/08/2022.
//

extension EnterOperation: EnterOperationInteractorRequirement {
    public func execute(operation: Operation) throws -> Number {
        try perform(operation: operation)
    }
}
