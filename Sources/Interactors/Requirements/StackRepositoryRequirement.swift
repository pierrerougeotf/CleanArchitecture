//
//  StackRepositoryRequirement.swift
//  
//
//  Created by Pierre Rougeot on 06/08/2022.
//

public protocol StackRepositoryRequirement: PushStackRepositoryRequirement {
    func pop() throws -> Number
}
