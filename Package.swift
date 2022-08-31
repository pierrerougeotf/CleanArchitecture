// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CleanArchitecture",
    platforms: [.macOS(.v12), .iOS(.v13), .watchOS(.v8), .tvOS(.v15)],
    products: [
        .executable(name: "calculator", targets: ["CLI"]),
        .library(
            name: "Calculator",
            targets: ["Factory", "Views"]), // SwiftUI Preview does not seem to work without adding "Views" in products
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser", from: "1.1.4")
    ],
    targets: [
        .executableTarget(
            name: "CLI",
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
                "Factory"
            ]
        ),
        .target(
            name: "Factory",
            dependencies: ["Views",
            "ViewModels",
            "Presenters",
            "Interactors",
            "Repositories",
            "Entities"]
        ),
        .target(name: "Views"),
        .target(name: "ViewModels"),
        .target(name: "Presenters"),
        .testTarget(name: "PresentersTests", dependencies: ["Presenters"]),
        .target(name: "Interactors"),
        .testTarget(name: "InteractorsTests", dependencies: ["Interactors"]),
        .target(name: "Repositories"),
        .testTarget(name: "RepositoriesTests", dependencies: ["Repositories"]),
        .target(name: "Entities")
    ]
)
