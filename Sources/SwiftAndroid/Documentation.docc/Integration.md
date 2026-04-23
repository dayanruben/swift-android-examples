# Integration

Integrate Swift builds with Android tooling and frameworks

## Gradle

Add a custom Gradle task to invoke `swift build` and copy the resulting `.so` into `jniLibs/`:

```kotlin
tasks.register<Exec>("buildSwiftLibrary") {
    workingDir = file("${rootDir}/swift")
    commandLine("swift", "build",
        "--swift-sdk", "aarch64-unknown-linux-android28",
        "-c", "release", "--static-swift-stdlib")
}
```

## Swift Package Manager

```shell
$ swift build --swift-sdk aarch64-unknown-linux-android28
```

## Skip

[Skip](https://skip.dev) transpiles Swift and SwiftUI to Kotlin and Jetpack Compose:

```shell
$ brew install skiptools/skip/skip
$ skip android build
$ skip android run
```

## Resources

- [Swift SDK for Android -- Getting Started](https://www.swift.org/documentation/articles/swift-sdk-for-android-getting-started.html)
- [Porting Swift Packages](https://skip.dev/docs/porting/)
- [swift-java](https://github.com/swiftlang/swift-java) -- Java/Kotlin interop
- [swift-android-action](https://github.com/skiptools/swift-android-action) -- GitHub Actions
- [Swift Forums](https://forums.swift.org/)
