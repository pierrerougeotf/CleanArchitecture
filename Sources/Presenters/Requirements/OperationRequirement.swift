//
//  OperationRequirement.swift
//  
//
//  Created by Pierre Rougeot on 06/08/2022.
//

public protocol OperationRequirement {
    static var plus: Self { get }
    static var minus: Self { get }
    static var multiply: Self { get }
    static var divide : Self { get }
}
