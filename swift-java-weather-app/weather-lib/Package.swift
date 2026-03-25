// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import CompilerPluginSupport
import PackageDescription

let package = Package(
  name: "WeatherLibrary",
  platforms: [.macOS(.v15)],
  products: [
    .library(
      name: "WeatherLibrary",
      type: .dynamic,
      targets: ["WeatherLibrary"]
    )
  ],
  dependencies: [
    .package(url: "https://github.com/swiftlang/swift-java", from: "0.1.2"),
    .package(url: "https://github.com/apple/swift-openapi-generator", from: "1.6.0"),
    .package(url: "https://github.com/apple/swift-openapi-runtime", from: "1.7.0"),
    .package(url: "https://github.com/apple/swift-openapi-urlsession", from: "1.0.0"),
    .package(url: "https://github.com/swift-server/swift-openapi-async-http-client", from: "1.0.0"),
  ],
  targets: [
    .target(
        name: "WeatherLibrary",
        dependencies: [
            .product(name: "OpenAPIRuntime", package: "swift-openapi-runtime"),
            .product(name: "OpenAPIURLSession", package: "swift-openapi-urlsession", condition: .when(platforms: [.macOS, .iOS])),
            .product(name: "OpenAPIAsyncHTTPClient", package: "swift-openapi-async-http-client", condition: .when(platforms: [.android])),
            .product(name: "SwiftJava", package: "swift-java")
        ],
        swiftSettings: [
          .swiftLanguageMode(.v5)
        ],
        plugins: [
            .plugin(name: "OpenAPIGenerator", package: "swift-openapi-generator"),
            .plugin(name: "JExtractSwiftPlugin", package: "swift-java")
        ]
    )
  ]
)
