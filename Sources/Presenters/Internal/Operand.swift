//
//  Operand.swift
//  
//
//  Created by Pierre Rougeot on 12/08/2022.
//

struct Operand<Number: FixedWidthInteger> {
    public typealias Digit = Number
    
    private let didUpdate: (Number?) -> Void
    private var currentNumber: Number? {
        didSet {
            didUpdate(currentNumber)
        }
    }
    
    init(didUpdate: @escaping (Number?) -> Void) {
        self.didUpdate = didUpdate
    }
    
    mutating func push(digit: Digit) {
        guard let number = currentNumber, number > 0 else {
            currentNumber = digit
            return
        }
        currentNumber = number * 10 + digit
    }
    
    mutating func clear() {
        currentNumber = nil
    }
    
    mutating func popNumber() -> Number? {
        let number = currentNumber
        clear()
        return number
    }
}
