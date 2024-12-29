// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "InnovateARFood",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "InnovateARFood",
            targets: ["InnovateARFood"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
               .binaryTarget(name: "InnovateARFood",
                             path: "artifacts/InnovateARFoodSDK.xcframework")
    ]
)
