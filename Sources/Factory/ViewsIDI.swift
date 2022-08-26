//
//  ViewsIDI.swift
//  
//
//  Created by Pierre Rougeot on 18/08/2022.
//

#if canImport(UIKit)
import UIKit
#endif

public class ViewsIDI {
    private let presentersIDI: PresentersIDI
    
    init(presentersIDI: PresentersIDI) {
        self.presentersIDI = presentersIDI
    }
    
    #if canImport(UIKit)
    public lazy var uiKitCalculator: UIViewController = {
        let calculatorViewController = CalculatorViewController<CalculatorViewModel>()
        calculatorViewController.presenter = presentersIDI.calculator(for: calculatorViewController)
        return calculatorViewController
    }()
    #endif
}

let repositoriesIDI = RepositoriesIDI()
let interactorsIDI = InteractorsIDI(repositoriesIDI: repositoriesIDI)
let presentersIDI = PresentersIDI(interactorsIDI: interactorsIDI)

public let viewsIDI = ViewsIDI(presentersIDI: presentersIDI)
