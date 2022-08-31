//
//  Bridge.swift
//  
//
//  Created by Pierre Rougeot on 12/08/2022.
//

import Entities

typealias Operation = Entities.Operation
typealias Number = Entities.Number

import Repositories

typealias ComputationRepository = Repositories.Computation
typealias PushStackRepository = Repositories.Stack
typealias StackRepository = Repositories.Stack

typealias NumberRequirement = Repositories.NumberRequirement
typealias OperationRequirement = Repositories.OperationRequirement & Presenters.OperationRequirement

import Interactors

typealias EnterOperationInteractor = Interactors.EnterOperation
typealias EnterNumberInteractor = Interactors.EnterNumber

typealias PushStackRepositoryRequirement = Interactors.PushStackRepositoryRequirement
typealias StackRepositoryRequirement = Interactors.StackRepositoryRequirement
typealias ComputationRepositoryRequirement = Interactors.ComputationRepositoryRequirement

import Presenters

typealias CalculatorPresenter = Presenters.CalculatorPresenter

typealias EnterNumberInteractorRequirement = Presenters.EnterNumberInteractorRequirement
typealias EnterOperationInteractorRequirement = Presenters.EnterOperationInteractorRequirement
public typealias CalculatorViewContractRequirement = Presenters.CalculatorViewContractRequirement

import ViewModels

public typealias CalculatorViewModel = ViewModels.Calculator

import Views

typealias CalculatorPresenterRequirement = Views.CalculatorPresenterRequirement

public typealias CalculatorViewModelRequirement = Presenters.CalculatorViewModelRequirement & Views.CalculatorViewModelRequirement

#if canImport(UIKit)
public typealias CalculatorViewController = Views.CalculatorViewController
#endif
