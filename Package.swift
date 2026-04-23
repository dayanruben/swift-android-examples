// swift-tools-version: 6.0

import PackageDescription

let package = Package(
  name: "swift-android-examples",
  products: [
    .library(name: "SwiftAndroid", targets: ["SwiftAndroid"])
  ],
  dependencies: [
    .package(
      url: "https://github.com/swiftlang/swift-docc-plugin", from: "1.1.0")
  ],
  targets: [
    .target(name: "SwiftAndroid")
  ])
