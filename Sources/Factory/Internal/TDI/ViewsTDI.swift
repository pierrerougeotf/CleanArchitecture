//
//  ViewsTDI.swift
//  
//
//  Created by Pierre Rougeot on 18/08/2022.
//

#if canImport(UIKit)
extension CalculatorViewController: CalculatorViewContract where ViewModel: CalculatorViewModelRequirement {
    public func display(viewModel: ViewModel) {
        configure(with: viewModel)
    }
}
#endif
