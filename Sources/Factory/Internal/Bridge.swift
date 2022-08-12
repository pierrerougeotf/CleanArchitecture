//
//  Bridge.swift
//  
//
//  Created by Pierre Rougeot on 12/08/2022.
//

import Presenters

typealias EnterNumberInteractorRequirement = Presenters.EnterNumberInteractorRequirement
typealias EnterOperationInteractorRequirement = Presenters.EnterOperationInteractorRequirement

import Interactors

typealias EnterOperation = Interactors.EnterOperation
typealias EnterNumber = Interactors.EnterNumber

typealias StackRepositoryRequirement = Interactors.StackRepositoryRequirement
typealias PushStackRepositoryRequirement = Interactors.PushStackRepositoryRequirement
typealias ComputationRepositoryRequirement = Interactors.ComputationRepositoryRequirement

import Repositories

typealias Computation = Repositories.Computation
typealias Stack = Repositories.Stack

typealias NumberRequirement = Repositories.NumberRequirement
typealias OperationRequirement = Repositories.OperationRequirement

import Entities

typealias Operation = Entities.Operation
typealias Number = Entities.Number
