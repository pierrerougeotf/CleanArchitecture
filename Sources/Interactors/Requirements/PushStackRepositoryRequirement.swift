//
//  PushStackRepositoryRequirement.swift
//  
//
//  Created by Pierre Rougeot on 06/08/2022.
//
public protocol PushStackRepositoryRequirement: AnyObject {
    associatedtype Number
    func push(number: Number)
}
