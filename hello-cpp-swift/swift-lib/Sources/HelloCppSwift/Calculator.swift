//===----------------------------------------------------------------------===//
//
// This source file is part of the Swift.org open source project
//
// Copyright (c) 2026 Apple Inc. and the Swift.org project authors
// Licensed under Apache License v2.0
//
// See LICENSE.txt for license information
// See CONTRIBUTORS.txt for the list of Swift.org project authors
//
// SPDX-License-Identifier: Apache-2.0
//
//===----------------------------------------------------------------------===//
#if canImport(FoundationEssentials)
  import FoundationEssentials
#else
  import Foundation
#endif
import HelloWorldCpp

public func addNumbers(_ a: Int32, _ b: Int32) -> Int32 {
  return add(a, b)
}

public func multiplyNumbers(_ a: Int32, _ b: Int32) -> Int32 {
  return multiply(a, b)
}
