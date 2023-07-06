//
//  Bridge.swift
//  
//
//  Created by Pierre Rougeot on 12/08/2022.
//

import Entities

public typealias Operation = Entities.Operation
public typealias Number = Entities.Number

import Repositories

typealias ComputationRepositoryImplementation = Repositories.Computation
typealias PushStackRepositoryImplementation = Repositories.Stack
typealias StackRepositoryImplementation = Repositories.Stack

typealias NumberEntity = Repositories.NumberRequirement
typealias OperationEntity = Repositories.OperationRequirement & Presenters.OperationRequirement

import Interactors

typealias EnterOperationInteractorImplementation = Interactors.EnterOperation
typealias EnterNumberInteractorImplementation = Interactors.EnterNumber

typealias PushStackRepository = Interactors.PushStackRequirement
typealias StackRepository = Interactors.StackRequirement
typealias ComputationRepository = Interactors.ComputationRequirement

import Presenters

typealias CalculatorPresenterImplementation = Presenters.CalculatorPresenter

public typealias EnterNumberInteractor = Presenters.EnterNumberRequirement
public typealias EnterOperationInteractor = Presenters.EnterOperationRequirement
public typealias CalculatorViewContract = Presenters.CalculatorViewContractRequirement

import ViewModels

public typealias CalculatorViewModel = ViewModels.Calculator

import Views

typealias CalculatorPresenter = Views.CalculatorPresenterRequirement

public typealias CalculatorViewModelRequirement = Presenters.CalculatorViewModelRequirement & Views.CalculatorViewModelRequirement

#if canImport(UIKit)
public typealias CalculatorViewController = Views.CalculatorViewController
#endif
