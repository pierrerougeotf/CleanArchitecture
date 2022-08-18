// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CleanArchitecture",
    products: [
        .library(
            name: "Calculator",
            targets: ["Factory"]),
    ],
    targets: [
        .target(name: "Factory", dependencies: ["Views", "Presenters", "Interactors", "Repositories", "Entities"]),
        .target(name: "Views"),
        .target(name: "Presenters"),
        .testTarget(name: "PresentersTests", dependencies: ["Presenters"]),
        .target(name: "Interactors"),
        .testTarget(name: "InteractorsTests", dependencies: ["Interactors"]),
        .target(name: "Repositories"),
        .testTarget(name: "RepositoriesTests", dependencies: ["Repositories"]),
        .target(name: "Entities")
    ]
)
