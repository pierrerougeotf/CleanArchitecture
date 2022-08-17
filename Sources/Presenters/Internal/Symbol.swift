//
//  Symbol.swift
//  
//
//  Created by Pierre Rougeot on 12/08/2022.
//

enum Symbol<Digit, Operation> {
    case digit(Digit)
    case command(Command)
    case operation(Operation)
}
