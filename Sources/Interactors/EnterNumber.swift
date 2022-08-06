//
//  EnterNumber.swift
//  
//
//  Created by Pierre Rougeot on 06/08/2022.
//

public class EnterNumber<PushStackRepository: PushStackRepositoryRequirement> {
    
    public typealias Number = PushStackRepository.Number
    
    private let pushStackRepository: PushStackRepository
    
    public init(pushStackRepository: PushStackRepository) {
        self.pushStackRepository = pushStackRepository
    }
    
    // MARK: - EnterNumberInteractor
    
    public func enter(number: Number?) {
        guard let number = number else { return }
        pushStackRepository.push(number: number)
    }
}
