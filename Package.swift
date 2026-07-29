// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "eplhigherlower",
    defaultLocalization: "en",
    platforms: [.iOS(.v17)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(name: "eplhigherlower", targets: ["eplhigherlower"]),
     ],
    dependencies: [
        // Remote dependencies (add yours here)
          .package(url: "https://github.com/Engagecraft-Solutions/gaming-core-ios-dt.git", from: "1.2.1"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "eplhigherlower",
            dependencies: [
                  .product(name: "GamesLib", package: "gaming-core-ios-dt"),
            ],
            path: "Sources/Classes",
            resources: [
                .process("Assets")
            ]
        )
    ],
    swiftLanguageModes: [.v5]
)
