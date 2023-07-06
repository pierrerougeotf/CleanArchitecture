//
//  InteractorsIDI.swift
//
//
//  Created by Pierre Rougeot on 12/08/2022.
//

public class InteractorsIDI {
    private let repositoriesIDI: RepositoriesIDI
    
    init(repositoriesIDI: RepositoriesIDI) { self.repositoriesIDI = repositoriesIDI }
    
    lazy var enterNumber = EnterNumberInteractorImplementation(pushStackRepository: repositoriesIDI.stack)
    
    lazy var enterOperation = EnterOperationInteractorImplementation(
        stackRepository: repositoriesIDI.stack,
        computationRepository: repositoriesIDI.computation
    )
}

let interactorsIDI = InteractorsIDI(repositoriesIDI: repositoriesIDI)
public let enterNumberInteractor = interactorsIDI.enterNumber
public let enterOperationInteractor = interactorsIDI.enterOperation
