// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SHTGenerater",
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/stencilproject/Stencil.git", .branch("master")),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "SHTGenerater",
            dependencies: [
                "Stencil",
            ]),
        .testTarget(
            name: "SHTGeneraterTests",
            dependencies: ["SHTGenerater"]),
    ]
)
