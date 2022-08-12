//
//  RepositoriesTDI.swift
//  
//
//  Created by Pierre Rougeot on 12/08/2022.
//

extension Stack: StackRepositoryRequirement {}
extension Stack: EnterNumberInteractorRequirement { public func execute(number: Number) { push(number: number) } }
extension Computation: ComputationRepositoryRequirement {}
