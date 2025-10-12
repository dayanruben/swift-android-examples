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
import androidx.annotation.Keep
import androidx.appcompat.app.AppCompatActivity
import java.util.Locale

class MainActivity : AppCompatActivity() {

    var hour: Int = 0
    var minute: Int = 0
    var second: Int = 0
    var tickView: TextView? = null

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        tickView = findViewById(R.id.tickView)
    }

    public override fun onResume() {
        super.onResume()
        second = 0
        minute = 0
        hour = 0
        startTicks()
    }

    public override fun onPause() {
        super.onPause()
        stopTicks()
    }

    /*
     * A function calling from JNI to update current timer
     */
    @Keep
    private fun updateTimer() {
        ++second
        if (second >= 60) {
            ++minute
            second -= 60
            if (minute >= 60) {
                ++hour
                minute -= 60
            }
        }
        runOnUiThread {
            val ticks = String.format(
                Locale.ENGLISH,
                "%02d:%02d:%02d",
                this@MainActivity.hour, this@MainActivity.minute, this@MainActivity.second
            )
            this@MainActivity.tickView?.text = ticks
        }
    }

    external fun startTicks()
    external fun stopTicks()

    companion object {
        // Used to load the 'hello-swift-callback' library on application startup.
        init {
            System.loadLibrary("hello-swift-callback")
        }
    }
}
