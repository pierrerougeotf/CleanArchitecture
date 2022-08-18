//
//  CalculatorPresenterTests.swift
//
//
//  Created by Pierre Rougeot on 17/08/2022.
//

import XCTest
@testable import Presenters

class CalculatorPresenterTests: XCTestCase {
    
    private static var stack: [Number] = []
    private static var viewModel: ViewModel?
    
    override static func setUp() {
        super.setUp()
        
        stack = []
    }
    
    private let enterNumberInteractor = EnterNumberInteractor()
    private let enterOperationInteractor = EnterOperationInteractor()
    private let calculatorViewContract = CalculatorViewContract()
    private lazy var calculatorPresenter = CalculatorPresenter(
        enterNumberInteractor: enterNumberInteractor,
        enterOperationInteractor: enterOperationInteractor,
        viewContract: calculatorViewContract
    )

    func testCalculatorPresenter() {
        calculatorPresenter.didTouchButton("5")
        XCTAssertEqual(CalculatorPresenterTests.viewModel?.display, "5")
        calculatorPresenter.didTouchButton("4")
        XCTAssertEqual(CalculatorPresenterTests.viewModel?.display, "54")
        calculatorPresenter.didTouchButton("4")
        XCTAssertEqual(CalculatorPresenterTests.viewModel?.display, "544")
        calculatorPresenter.didTouchButton("E")
        XCTAssertEqual(CalculatorPresenterTests.viewModel?.display, "0")
        calculatorPresenter.didTouchButton("1")
        XCTAssertEqual(CalculatorPresenterTests.viewModel?.display, "1")
        calculatorPresenter.didTouchButton("3")
        XCTAssertEqual(CalculatorPresenterTests.viewModel?.display, "13")
        calculatorPresenter.didTouchButton("4")
        XCTAssertEqual(CalculatorPresenterTests.viewModel?.display, "134")
        calculatorPresenter.didTouchButton("-")
        XCTAssertEqual(CalculatorPresenterTests.viewModel?.display, "410")
    }

    // MARK: - Requirements
    
    typealias Number = Int
    
    enum Operation {
        case plus
        case minus
        case multiply
        case divide
    }
    
    class EnterNumberInteractor {
        func execute(number: Number) {
            CalculatorPresenterTests.stack.append(number)
        }
    }
    
    class EnterOperationInteractor {
        func execute(operation: Operation) throws -> Number {
            guard
                let secondOperand = stack.popLast(),
                let firstOperand = stack.popLast() else { return 0 }
            switch operation {
            case .plus:
                return firstOperand + secondOperand
            case .minus:
                return firstOperand - secondOperand
            case .multiply:
                return firstOperand * secondOperand
            case .divide:
                return firstOperand / secondOperand
            }
        }
    }
    
    struct ViewModel {
        let display: String
    }
    
    class CalculatorViewContract {
        func display(viewModel: ViewModel) {
            CalculatorPresenterTests.viewModel = viewModel
        }
    }
}

extension CalculatorPresenterTests.EnterNumberInteractor: EnterNumberInteractorRequirement {}
extension CalculatorPresenterTests.Operation: OperationRequirement {}
extension CalculatorPresenterTests.EnterOperationInteractor: EnterOperationInteractorRequirement {}
extension CalculatorPresenterTests.ViewModel: CalculatorViewModelRequirement {}
extension CalculatorPresenterTests.CalculatorViewContract: CalculatorViewContractRequirement {}
