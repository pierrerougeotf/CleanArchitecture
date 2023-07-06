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
    
    func calculator<ViewContract: CalculatorViewContract>(
        for viewContract: ViewContract
    ) -> some CalculatorPresenter {
      CalculatorPresenterImplementation(
            enterNumberInteractor: interactorsIDI.enterNumber,
            enterOperationInteractor: interactorsIDI.enterOperation,
            viewContract: viewContract
        )
    }
}

let presentersIDI = PresentersIDI(interactorsIDI: interactorsIDI)
