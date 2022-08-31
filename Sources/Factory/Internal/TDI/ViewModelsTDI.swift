//
//  ViewModelsTDI.swift
//  
//
//  Created by Pierre Rougeot on 18/08/2022.
//

extension CalculatorViewModel: CalculatorViewModelRequirement {}

extension CalculatorViewModel: CalculatorViewContractRequirement {
    public func display(viewModel: CalculatorViewModel) {
        self.display = viewModel.display
    }
}
