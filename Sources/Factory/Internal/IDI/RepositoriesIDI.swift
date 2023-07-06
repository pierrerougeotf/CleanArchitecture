//
//  RepositoriesIDI.swift
//  
//
//  Created by Pierre Rougeot on 12/08/2022.
//

class RepositoriesIDI {
    let stack = StackRepositoryImplementation<Number>()
    let computation = ComputationRepositoryImplementation<Number, Operation>()
}

let repositoriesIDI = RepositoriesIDI()
