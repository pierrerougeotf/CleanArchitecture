//
//  EnterNumberInteractorRequirement.swift
//  
//
//  Created by Pierre Rougeot on 12/08/2022.
//

public protocol EnterNumberInteractorRequirement {
    associatedtype Number
    func execute(number: Number)
}
