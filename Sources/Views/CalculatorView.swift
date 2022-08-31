//
//  SwiftUIView.swift
//  
//
//  Created by Pierre Rougeot on 26/08/2022.
//

#if canImport(SwiftUI) && canImport(UIKit)
import SwiftUI

@available(iOS 13.0, *)
public struct CalculatorView<Presenter: CalculatorPresenterRequirement,
                             ViewModel: CalculatorViewModelRequirement & ObservableObject>: View {
    @ObservedObject var viewModel: ViewModel

    public init(presenter: Presenter, viewModel: ViewModel) {
        self.presenter = presenter
        self.viewModel = viewModel
    }

    public var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            VStack {
                HStack {
                    Spacer()
                    Text(viewModel.display)
                        .font(.largeTitle)
                }
                .frame(width: 296.0, height: 44.0)
                .padding()
                .background(Color.green)
                ForEach(buttons.map { $0.map { ButtonViewModel($0.title, $0.color) } }, id: \.self) { row in
                    HStack {
                        ForEach(row, id: \.self) { button in
                            Text(button.title)
                                .font(.largeTitle)
                                .foregroundColor(.white)
                                .frame(width: 44.0, height: 44.0)
                                .padding()
                                .background(button.color)
                                .onTapGesture {
                                    presenter.didTouchButton(button.title)
                                }
                        }
                    }
                }
            }
        }
    }

    // MARK: - Private

    private let presenter: Presenter

    private struct ButtonViewModel: Hashable {
        let title: String
        let color: Color

        init(_ title: String, _ color: Color) {
            self.title = title
            self.color = color
        }
    }

    private let buttons: [[(title: String, color: Color)]] = [
        [("7", .magenta), ("8", .magenta), ("9", .magenta), ("+", .orange)],
        [("4", .magenta), ("5", .magenta), ("6", .magenta), ("-", .orange)],
        [("1", .magenta), ("2", .magenta), ("3", .magenta), ("x", .orange)],
        [("C", .blue), ("0", .magenta), ("E", .blue), ("/", .orange)]
    ]
}

@available(iOS 13.0, *)
private extension Color {
    static var magenta: Self { pink }
}


@available(iOS 13.0, *)
public class ViewModel: ObservableObject, CalculatorViewModelRequirement {
    @Published public var display: String
    
    init(display: String) { self.display = display }
}

@available(iOS 13.0, *)
public class Presenter: CalculatorPresenterRequirement {
    public init(viewContract: ViewModel) { self.viewContract = viewContract }

    public func didTouchButton(_ title: String) {
        viewContract.display = title
    }

    private let viewContract: ViewModel
}

@available(iOS 13.0, *)
public let viewModel = ViewModel(display: "0")

@available(iOS 13.0, *)
public let presenter = Presenter(viewContract: viewModel)

@available(iOS 13.0, *)
public struct CalculatorView_Previews: PreviewProvider {

    public static var previews: some View {
        CalculatorView(presenter: presenter, viewModel: viewModel)
            .previewLayout(.sizeThatFits)
            
    }
}

#endif
