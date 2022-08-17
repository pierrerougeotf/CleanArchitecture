//
//  CalculatorViewContractRequirement.swift
//  
//
//  Created by Pierre Rougeot on 12/08/2022.
//

public protocol CalculatorViewModel {
    init(display: String)
}

public protocol CalculatorViewContractRequirement: AnyObject {
    associatedtype ViewModel: CalculatorViewModel
    func display(viewModel: ViewModel)
}
