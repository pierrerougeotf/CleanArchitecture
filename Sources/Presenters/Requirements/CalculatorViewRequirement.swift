//
//  CalculatorViewRequirement.swift
//  
//
//  Created by Pierre Rougeot on 12/08/2022.
//

public protocol CalculatorViewModelRequirement {
    init(display: String)
}

public protocol CalculatorViewContractRequirement: AnyObject {
    associatedtype ViewModel: CalculatorViewModelRequirement
    func display(viewModel: ViewModel)
}
