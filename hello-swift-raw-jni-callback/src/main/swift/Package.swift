// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "hello-swift-raw-jni-callback",
    products: [
        .library(name: "hello-swift-raw-jni-callback", type: .dynamic, targets: ["hello-swift-raw-jni-callback"]),
    ],
    targets: [
        .target(name: "hello-swift-raw-jni-callback")
    ]
)
