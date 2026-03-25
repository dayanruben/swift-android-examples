// swift-tools-version: 6.2

import CompilerPluginSupport
import PackageDescription

let package = Package(
  name: "HelloCppSwift",
  platforms: [.macOS(.v15)],
  products: [
    .library(
      name: "HelloCppSwift",
      type: .dynamic,
      targets: ["HelloCppSwift"])
  ],
  dependencies: [
    .package(url: "https://github.com/swiftlang/swift-java", from: "0.1.2"),
  ],
  targets: [
    .binaryTarget(
      name: "HelloWorldCpp",
      path: "../cpp-lib/prebuilt/HelloWorldCpp.artifactbundle"
    ),
    .target(
      name: "HelloCppSwift",
      dependencies: [
        .target(name: "HelloWorldCpp"),
        .product(name: "SwiftJava", package: "swift-java"),
      ],
      swiftSettings: [
        .swiftLanguageMode(.v5),
      ],
      plugins: [
        .plugin(name: "JExtractSwiftPlugin", package: "swift-java")
      ]
    ),
  ]
)
