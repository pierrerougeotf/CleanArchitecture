//
//  InteractorsIDI.swift
//
//
//  Created by Pierre Rougeot on 12/08/2022.
//

class InteractorsIDI {
    private let repositoriesIDI: RepositoriesIDI
    
    init(repositoriesIDI: RepositoriesIDI) { self.repositoriesIDI = repositoriesIDI }
    
    lazy var enterNumber = EnterNumberInteractor(pushStackRepository: repositoriesIDI.stack)
    
    lazy var enterOperation = EnterOperationInteractor(
        stackRepository: repositoriesIDI.stack,
        computationRepository: repositoriesIDI.computation
    )
}
