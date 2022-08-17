//
//  CalculatorPresenter.swift
//  
//
//  Created by Pierre Rougeot on 13/08/2022.
//

public class CalculatorPresenter<
    EnterNumberInteractor: EnterNumberInteractorRequirement,
    EnterOperationInteractor: EnterOperationInteractorRequirement,
    ViewContract: CalculatorViewContractRequirement
>
where EnterNumberInteractor.Number == EnterOperationInteractor.Number,
      EnterNumberInteractor.Number: FixedWidthInteger,
      EnterOperationInteractor.Operation: OperationRequirement {
    typealias Number = EnterOperationInteractor.Number
    typealias Operation = EnterOperationInteractor.Operation
    typealias Digit = Operand<Number>.Digit
    
    private typealias ViewModel = ViewContract.ViewModel
    
    private let enterNumberInteractor: EnterNumberInteractor
    private let enterOperationInteractor: EnterOperationInteractor
    private weak var viewContract: ViewContract?
        
    private lazy var currentOperand: Operand<Number> = Operand(didUpdate: self.updateViewContract)
    
    private let viewModelMapper = ViewModelMapper()
    
    public init(enterNumberInteractor: EnterNumberInteractor,
                enterOperationInteractor: EnterOperationInteractor,
                viewContract: ViewContract) {
        self.enterNumberInteractor = enterNumberInteractor
        self.enterOperationInteractor = enterOperationInteractor
        self.viewContract = viewContract
    }
    
    // MARK: - CalculatorPresenter
    
    public func didTouchButton(_ title: String) {
        guard let symbol = Symbol<Digit, Operation>(title) else { return }
        switch symbol {
        case let .digit(digit):
            process(digit: digit)
        case let .command(command):
            process(command: command)
        case let .operation(operation):
            process(operation: operation)
        }
    }
    
    // MARK: - Private
    
    private func process(digit: Digit) {
        currentOperand.push(digit: digit)
    }
    
    private func process(command: Command) {
        switch command {
        case .clear:
            currentOperand.clear()
        case .enter:
            guard let number = currentOperand.popNumber() else { return }
            enterNumberInteractor.execute(number: number)
        }
    }
    
    private func process(operation: Operation) {
        process(command: .enter)
        do {
            let numberToDisplay = try enterOperationInteractor.execute(operation: operation)
            updateViewContract(with: numberToDisplay)
        } catch {
            // handle error
        }
    }
    
    private func updateViewContract(with number: Number?) {
        let viewModel = viewModelMapper.map(number: number ?? 0)
        viewContract?.display(viewModel: viewModel)
    }
}
