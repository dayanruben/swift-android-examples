// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "helloswift",
    products: [
        .library(name: "helloswift", type: .dynamic, targets: ["helloswift"]),
    ],
    targets: [
        .target(name: "helloswift")
    ]
)
