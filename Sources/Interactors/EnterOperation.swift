//
//  EnterOperation.swift
//  
//
//  Created by Pierre Rougeot on 06/08/2022.
//

public class EnterOperation<
    StackRepository: StackRepositoryRequirement,
    ComputationRepository: ComputationRepositoryRequirement
> where StackRepository.Number == ComputationRepository.Number {
    public typealias Operation = ComputationRepository.Operation
    public typealias Number = ComputationRepository.Number
    
    private let stackRepository: StackRepository
    private let computationRepository: ComputationRepository

    public init(stackRepository: StackRepository,
                computationRepository: ComputationRepository) {
        self.stackRepository = stackRepository
        self.computationRepository = computationRepository
    }

    // MARK: - EnterOperationInteractor

    public func perform(operation: Operation) throws -> Number {
        let secondOperand = try stackRepository.pop()
        let firstOperand = try stackRepository.pop()
        let result = try computationRepository.perform(operation: operation, on: firstOperand, and: secondOperand)
        stackRepository.push(number: result)
        return result
    }
}
