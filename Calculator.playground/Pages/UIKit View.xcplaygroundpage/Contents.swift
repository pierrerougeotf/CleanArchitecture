//: [Previous](@previous)

import UIKit

import PlaygroundSupport

import Views

// MARK: - Requirements

class CalculatorPresenter{
    func didTouchButton(_ title: String) {
        print(title)
    }
}

struct CalculatorViewModel {
    let display: String
}

// MARK: - Assembly

extension CalculatorPresenter: Views.CalculatorPresenterRequirement { }
extension CalculatorViewModel: Views.CalculatorViewModelRequirement { }

// MARK: - Factory

let calculatorViewController = Views.CalculatorViewController<CalculatorViewModel>()
calculatorViewController.presenter = CalculatorPresenter()

// MARK: - Playground

import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

PlaygroundPage.current.liveView = calculatorViewController

//: [Next](@next)
