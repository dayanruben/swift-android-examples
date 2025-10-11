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

package org.example.helloswift

import android.os.Bundle
import android.widget.TextView
import androidx.appcompat.app.AppCompatActivity
import org.example.helloswift.R

class MainActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        findViewById<TextView>(R.id.sample_text).text = stringFromSwift()
    }

    /**
     * A native method that is implemented by the 'helloswift' native library,
     * which is packaged with this application.
     */
    external fun stringFromSwift(): String

    companion object {
        // Used to load the 'helloswift' library on application startup.
        init {
            System.loadLibrary("helloswift")
        }
    }
}
