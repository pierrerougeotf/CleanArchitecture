//
//  PresentersIDI.swift
//
//
//  Created by Pierre Rougeot on 13/08/2022.
//

class PresentersIDI {
    private let interactorsIDI: InteractorsIDI
    
    init(interactorsIDI: InteractorsIDI) {
        self.interactorsIDI = interactorsIDI
    }
    
    func calculator<ViewContract: CalculatorViewContractRequirement>(for viewContract: ViewContract) -> some CalculatorPresenterProtocol {
      CalculatorPresenter(
            enterNumberInteractor: interactorsIDI.enterNumber,
            enterOperationInteractor: interactorsIDI.enterOperation,
            viewContract: viewContract
        )
    }
}

// Temporary
public protocol CalculatorPresenterProtocol: AnyObject {
    func didTouchButton(_ title: String)
}

extension CalculatorPresenter: CalculatorPresenterProtocol {}
