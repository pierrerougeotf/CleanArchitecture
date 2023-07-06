//
//  StackRequirement.swift
//  
//
//  Created by Pierre Rougeot on 06/08/2022.
//

public protocol StackRequirement: PushStackRequirement {
    func pop() throws -> Number
}
