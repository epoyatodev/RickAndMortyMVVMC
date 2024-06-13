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
        .package(path: "./NetworkModule"),
        .package(url: "https://github.com/lorenzofiamingo/swiftui-cached-async-image", exact: .init(stringLiteral: "2.1.1"))

    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "CharactersModule",
            dependencies: [
                "Router",
                "NetworkModule",
                .product(name: "CachedAsyncImage", package: "swiftui-cached-async-image")
            ]
        ),
        .testTarget(
            name: "CharactersModuleTests",
            dependencies: ["CharactersModule"]),
    ]
)
