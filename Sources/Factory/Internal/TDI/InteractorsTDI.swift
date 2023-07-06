//
//  InteractorsTDI.swift
//  
//
//  Created by Pierre Rougeot on 12/08/2022.
//

extension EnterNumberInteractorImplementation: EnterNumberInteractor {
    public func execute(number: Number) {
        enter(number: number)
    }
}

extension EnterOperationInteractorImplementation: EnterOperationInteractor {
    public func execute(operation: Operation) throws -> Number {
        try perform(operation: operation)
    }
}
