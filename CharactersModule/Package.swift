// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CharactersModule",
    platforms: [
        .iOS(.v17),
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "CharactersModule",
            targets: ["CharactersModule"]),
    ],
    dependencies: [
        .package(path: "./Router"),
        .package(path: "./NetworkModule")

    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "CharactersModule",
            dependencies: [
                "Router",
                "NetworkModule"
            ]
        ),
        .testTarget(
            name: "CharactersModuleTests",
            dependencies: ["CharactersModule"]),
    ]
)
