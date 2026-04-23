# Porting Swift Packages to Android

Adapt existing Swift packages to build and run on Android

## Overview

Many Swift packages build for Android with minimal changes. The typical process is: attempt a build, fix platform-specific code with conditional compilation, then test on a device.

For a detailed walkthrough, see [Porting Swift Packages](https://skip.dev/docs/porting/) on the Skip website.

## Good candidates

- Business logic, algorithms, data structures
- Networking and API clients
- Parsers, formatters, encoders/decoders
- SQLite and other database access

## Conditional imports

```swift
#if canImport(Darwin)
import Darwin
#elseif canImport(Android)
import Android
#elseif canImport(Glibc)
import Glibc
#endif
```

## Testing on Android

```shell
$ skip android test
```

## CI with GitHub Actions

```yaml
- name: Test on Android
  uses: skiptools/swift-android-action@v2
```
