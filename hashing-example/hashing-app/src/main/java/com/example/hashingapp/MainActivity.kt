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

package com.example.hashingapp

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.activity.enableEdgeToEdge
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.material3.Button
import androidx.compose.material3.ButtonDefaults
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Scaffold
import androidx.compose.material3.Surface
import androidx.compose.material3.Text
import androidx.compose.material3.TextField
import androidx.compose.runtime.Composable
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import com.example.hashingapp.ui.theme.HashingAppTheme
import com.example.swifthashing.SwiftHashing

class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContent {
            HashingAppTheme {
                Surface (
                    modifier = Modifier.fillMaxSize().padding(top = 64.dp),
                    color = MaterialTheme.colorScheme.background
                ) {
                    HashScreen()
                }
            }
        }
    }
}

@Composable
fun HashScreen() {
    val input = remember { mutableStateOf("") }
    val hashResult = remember { mutableStateOf("") }

    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(32.dp),
        verticalArrangement = Arrangement.spacedBy(12.dp)
    ) {
        TextField(
            value = input.value,
            onValueChange = { input.value = it },
            label = { Text("Enter text to hash") },
            modifier = Modifier.fillMaxWidth()
        )

        Button(
            colors = ButtonDefaults.buttonColors(
                containerColor = Color(0xFFF05138),
                contentColor = Color.White
            ),
            onClick = {
                // This calls the Swift method `hash` from SwiftHashing.swift
                hashResult.value = SwiftHashing.hash(input.value)
            }
        ) {
            Text("Hash")
        }

        if (hashResult.value.isNotEmpty()) {
            Text(
                text = hashResult.value,
                style = MaterialTheme.typography.bodyMedium
            )
        }
    }
}