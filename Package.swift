// swift-tools-version: 6.0

import PackageDescription

// Note that this product exists purely to build documentation:
// swift package generate-documentation --target SwiftAndroid --transform-for-static-hosting --output-path dos
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
