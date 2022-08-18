//
//  ViewsIDI.swift
//  
//
//  Created by Pierre Rougeot on 18/08/2022.
//

#if canImport(UIKit)
import UIKit
#endif

class ViewsIDI {
    private let presentersIDI: PresentersIDI
    
    init(presentersIDI: PresentersIDI) {
        self.presentersIDI = presentersIDI
    }
    
    #if canImport(UIKit)
    lazy var uiKitCalculator: UIViewController = {
        let calculatorViewController = CalculatorViewController<CalculatorViewModel>()
        calculatorViewController.presenter = presentersIDI.calculator(for: calculatorViewController)
        return calculatorViewController
    }()
    #endif
}
