//
//  InteractorsTDI.swift
//  
//
//  Created by Pierre Rougeot on 12/08/2022.
//

extension EnterNumberInteractor: EnterNumberInteractorRequirement {
    public func execute(number: Number) {
        enter(number: number)
    }
}

extension EnterOperationInteractor: EnterOperationInteractorRequirement {
    public func execute(operation: Operation) throws -> Number {
        try perform(operation: operation)
    }
}
