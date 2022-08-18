//
//  CalculatorViewController.swift
//  View
//
//  Created by Pierre Rougeot on 06/12/2020.
//

#if canImport(UIKit)
import UIKit

open class CalculatorViewController<ViewModel: CalculatorViewModelRequirement>: UIViewController {

    public var presenter: CalculatorPresenterRequirement?

    public func configure(with viewModel: ViewModel) {
        resultLabel.text = viewModel.display
    }

    // MARK: - UIViewController

    public override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setupMainStackView()
    }

    // MARK: - Private

    private lazy var resultLabel = UILabel()
    private lazy var mainStackView = UIStackView()

    private func setupMainStackView() {
        view.addSubview(mainStackView)
        mainStackView.axis = .vertical
        mainStackView.spacing = 8.0
        mainStackView.alignment = .fill
        mainStackView.distribution = .fill

        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        mainStackView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        mainStackView.rightAnchor.constraint(lessThanOrEqualTo: view.rightAnchor).isActive = true
        mainStackView.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor).isActive = true

        setupResultLabel()
        setupButtons()
    }

    private func setupResultLabel() {
        mainStackView.addArrangedSubview(resultLabel)
        resultLabel.backgroundColor = .green
        resultLabel.textColor = .black
        if #available(iOS 11.0, *) {
            resultLabel.font = .preferredFont(forTextStyle: .largeTitle)
        } else {
            resultLabel.font = .preferredFont(forTextStyle: .title1)
        }
        resultLabel.textAlignment = .right
        resultLabel.text = "0"
    }

    private func setupButtons() {
        mainStackView.addLine(("7", .magenta), ("8", .magenta), ("9", .magenta), ("+", .orange), handledBy: self)
        mainStackView.addLine(("4", .magenta), ("5", .magenta), ("6", .magenta), ("-", .orange), handledBy: self)
        mainStackView.addLine(("1", .magenta), ("2", .magenta), ("3", .magenta), ("x", .orange), handledBy: self)
        mainStackView.addLine(("C", .blue), ("0", .magenta), ("E", .blue), ("/", .orange), handledBy: self)
    }

    @objc
    fileprivate func didPressButton(_ sender: UIButton) {
        guard let title = sender.titleLabel?.text else { return }
        presenter?.didTouchButton(title)
    }
}

private extension UIStackView {
    func addLine<ViewModel: CalculatorViewModelRequirement>(_ buttonViewModels: (String, UIColor)...,
                                                            handledBy handler: CalculatorViewController<ViewModel>) {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 8.0
        stackView.alignment = .center
        stackView.distribution = .fill

        buttonViewModels.forEach {
            let button = UIButton(type: .custom)
            button.backgroundColor = $0.1
            button.setTitle($0.0, for: .normal)
            if #available(iOS 11.0, *) {
                button.titleLabel?.font = .preferredFont(forTextStyle: .largeTitle)
            } else {
                button.titleLabel?.font = .preferredFont(forTextStyle: .title1)
            }
            button.addTarget(handler, action: #selector(CalculatorViewController<ViewModel>.didPressButton(_:)), for: .touchUpInside)
            stackView.addArrangedSubview(button)
        }

        addArrangedSubview(stackView)
    }
}

#endif
