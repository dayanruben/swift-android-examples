# Swift Android Examples

This repository contains example applications that demonstrate how to use the [Swift SDK for Android](https://swift.org/install). Each example showcases different integration patterns for Swift on Android.

## Available Examples

Examples using [swift-java](https://github.com/swiftlang/swift-java) to generate necessary Swift/Java bridging:
- **[hello-swift-java](hello-swift-java/)** - application that demonstrates how to call Swift code from an Android app with automatically generated Java wrappers and JNI code using [swift-java](https://github.com/swiftlang/swift-java).

Examples using raw JNI, without generated bridging sources:
- **[hello-swift-raw-jni](hello-swift-raw-jni/)** - basic Swift integration that calls a Swift function.
- **[hello-swift-raw-jni-callback](hello-swift-raw-jni-callback/)** - demonstrates bidirectional communication with Swift timer callbacks updating Android UI.
- **[hello-swift-raw-jni-library](hello-swift-raw-jni-library/)** - shows how to package Swift code as a reusable Android library component.
- **[native-activity](native-activity/)** - complete native Android activity with OpenGL ES rendering written entirely in Swift.
