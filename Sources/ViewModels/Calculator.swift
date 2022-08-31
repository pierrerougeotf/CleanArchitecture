//
//  Calculator.swift
//  
//
//  Created by Pierre Rougeot on 18/08/2022.
//

import Combine

public final class Calculator: ObservableObject {
    @Published public var display: String
    public init(display: String) { self.display = display }
}
