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

public enum WeatherError: Error {
  case apiError(String)
  case unexpectedResponse

  public var description: String {
    switch self {
    case .apiError(let message):
      return "API Error: \(message)"
    case .unexpectedResponse:
      return "The server returned an invalid or unexpected response."
    }
  }
}
