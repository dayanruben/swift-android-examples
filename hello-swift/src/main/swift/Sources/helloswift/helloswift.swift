//===----------------------------------------------------------------------===//
//
// This source file is part of the Swift.org open source project
//
// Copyright (c) 2025 Apple Inc. and the Swift project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See https://swift.org/LICENSE.txt for license information
// See https://swift.org/CONTRIBUTORS.txt for the list of Swift project authors
//
//===----------------------------------------------------------------------===//

import Android

@_cdecl("Java_org_example_helloswift_MainActivity_stringFromSwift")
public func MainActivity_stringFromSwift(env: UnsafeMutablePointer<JNIEnv?>, clazz: jclass) -> jstring {
    let hello = ["Hello", "from", "Swift", "❤️"].joined(separator: " ")
    return hello.withCString { ptr in
    	env.pointee!.pointee.NewStringUTF(env, ptr)!
    }
}
