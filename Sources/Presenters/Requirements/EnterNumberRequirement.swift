//
//  EnterNumberRequirement.swift
//  
//
//  Created by Pierre Rougeot on 12/08/2022.
//

public protocol EnterNumberRequirement {
    associatedtype Number
    func execute(number: Number)
}
