//===----------------------------------------------------------------------===//
//
// This source file is part of the Swift.org open source project
//
// Copyright (c) 2025 Apple Inc. and the Swift.org project authors
// Licensed under Apache License v2.0
//
// See LICENSE.txt for license information
// See CONTRIBUTORS.txt for the list of Swift.org project authors
//
// SPDX-License-Identifier: Apache-2.0
//
//===----------------------------------------------------------------------===//

import Testing
@testable import SwiftHashing

@Test func hashing() throws {
    #expect(hash("Hello from Swift!") == "SHA256 digest: a642e7aa389325056cdf5e54a2b6e0a0214b4810fe87e1370063d9e17f8d6ed6")
}
