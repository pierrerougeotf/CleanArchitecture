//
//  ViewsIDI.swift
//
//
//  Created by Pierre Rougeot on 18/08/2022.
//

#if canImport(UIKit)
import UIKit
#endif

#if canImport(SwiftUI)
import SwiftUI
#endif

import Views

public class ViewsIDI {
    private let presentersIDI: PresentersIDI
    private let viewModel = CalculatorViewModel(display: "0")
    
    init(presentersIDI: PresentersIDI) {
        self.presentersIDI = presentersIDI
    }
    
    #if canImport(UIKit)
    public lazy var uiKitCalculator: UIViewController = {
        let calculatorViewController = CalculatorViewController<CalculatorViewModel>()
        calculatorViewController.presenter = presentersIDI.calculator(for: calculatorViewController)
        return calculatorViewController
    }()
    
    #if canImport(SwiftUI)
    public lazy var swiftUICalculator: UIViewController = UIHostingController(
        rootView: CalculatorView(presenter: presentersIDI.calculator(for: viewModel), viewModel: viewModel)
    )
    #endif
    #endif
}

public let viewsIDI = ViewsIDI(presentersIDI: presentersIDI)
