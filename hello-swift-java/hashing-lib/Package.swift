// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import CompilerPluginSupport
import PackageDescription

import class Foundation.FileManager
import class Foundation.ProcessInfo

// Note: the JAVA_HOME environment variable must be set to point to where
// Java is installed, e.g.,
//   Library/Java/JavaVirtualMachines/openjdk-21.jdk/Contents/Home.
func findJavaHome() -> String {
  if let home = ProcessInfo.processInfo.environment["JAVA_HOME"] {
    return home
  }

  // This is a workaround for envs (some IDEs) which have trouble with
  // picking up env variables during the build process
  let path = "\(FileManager.default.homeDirectoryForCurrentUser.path()).java_home"
  if let home = try? String(contentsOfFile: path, encoding: .utf8) {
    if let lastChar = home.last, lastChar.isNewline {
      return String(home.dropLast())
    }

    return home
  }

  fatalError("Please set the JAVA_HOME environment variable to point to where Java is installed.")
}
let javaHome = findJavaHome()

let javaIncludePath = "\(javaHome)/include"
#if os(Linux)
  let javaPlatformIncludePath = "\(javaIncludePath)/linux"
#elseif os(macOS)
  let javaPlatformIncludePath = "\(javaIncludePath)/darwin"
#else
  // TODO: Handle windows as well
  #error("Currently only macOS and Linux platforms are supported, this may change in the future.")
#endif

let package = Package(
  name: "SwiftHashing",
  platforms: [.macOS(.v15)],
  products: [
    .library(
      name: "SwiftHashing",
      type: .dynamic,
      targets: ["SwiftHashing"]
    ),
    .library(
      name: "WeatherClient",
      type: .dynamic,
      targets: ["WeatherClient"]
    )
  ],
  dependencies: [
    .package(url: "https://github.com/madsodgaard/swift-java", branch: "implement-protocols"),
    .package(url: "https://github.com/apple/swift-crypto.git", "1.0.0"..<"4.0.0"),
    .package(url: "https://github.com/apple/swift-openapi-generator", from: "1.6.0"),
    .package(url: "https://github.com/apple/swift-openapi-runtime", from: "1.7.0"),
    .package(url: "https://github.com/apple/swift-openapi-urlsession", from: "1.0.0"),
    .package(url: "https://github.com/swift-server/swift-openapi-async-http-client", from: "1.0.0"),
  ],
  targets: [
    .target(
      name: "SwiftHashing",
      dependencies: [
        .product(name: "Crypto", package: "swift-crypto"),
        .product(name: "SwiftJava", package: "swift-java"),
        .product(name: "CSwiftJavaJNI", package: "swift-java"),
        .product(name: "SwiftJavaRuntimeSupport", package: "swift-java"),
      ],
      swiftSettings: [
        .swiftLanguageMode(.v5),
        .unsafeFlags(["-I\(javaIncludePath)", "-I\(javaPlatformIncludePath)"], .when(platforms: [.macOS, .linux, .windows]))
      ],
      plugins: [
        .plugin(name: "JExtractSwiftPlugin", package: "swift-java")
      ]
    ),
    .target(
        name: "WeatherClient",
        dependencies: [
            .product(name: "OpenAPIRuntime", package: "swift-openapi-runtime"),
            .product(name: "OpenAPIURLSession", package: "swift-openapi-urlsession"),
            .product(name: "OpenAPIAsyncHTTPClient", package: "swift-openapi-async-http-client"),
            .product(name: "SwiftJava", package: "swift-java"),
            .product(name: "CSwiftJavaJNI", package: "swift-java"),
            .product(name: "SwiftJavaRuntimeSupport", package: "swift-java"),
        ],
        swiftSettings: [
          .swiftLanguageMode(.v5),
          .unsafeFlags(["-I\(javaIncludePath)", "-I\(javaPlatformIncludePath)"], .when(platforms: [.macOS, .linux, .windows]))
        ],
        plugins: [
            .plugin(name: "OpenAPIGenerator", package: "swift-openapi-generator"),
            .plugin(name: "JExtractSwiftPlugin", package: "swift-java")
        ]
    ),
    .testTarget(
      name: "SwiftHashingTests",
      dependencies: ["SwiftHashing"]
    ),
  ]
)
