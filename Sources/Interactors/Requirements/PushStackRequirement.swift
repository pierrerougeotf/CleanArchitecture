//
//  PushStackRequirement.swift
//  
//
//  Created by Pierre Rougeot on 06/08/2022.
//
public protocol PushStackRequirement: AnyObject {
    associatedtype Number
    func push(number: Number)
}
