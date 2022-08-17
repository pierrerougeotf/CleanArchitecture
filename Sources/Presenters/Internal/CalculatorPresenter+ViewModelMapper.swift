//
//  CalculatorPresenter+ViewModelMapper.swift
//  
//
//  Created by Pierre Rougeot on 13/08/2022.
//

extension CalculatorPresenter {
    struct ViewModelMapper {
        func map(number: Number?) -> ViewContract.ViewModel {
            ViewContract.ViewModel(display: String(number ?? .zero))
        }
    }
}
