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

package com.example.weatherapp.services

import android.Manifest
import android.content.Context
import android.content.pm.PackageManager
import androidx.core.content.ContextCompat
import com.google.android.gms.location.FusedLocationProviderClient
import com.google.android.gms.location.LocationServices
import com.example.weatherlib.LocationFetcher
import com.example.weatherlib.Location
import kotlinx.coroutines.runBlocking
import kotlinx.coroutines.tasks.await
import org.swift.swiftkit.core.SwiftArena

typealias AndroidLocation = android.location.Location

class LocationService(private val context: Context) : LocationFetcher {
    private val arena = SwiftArena.ofAuto()

    private val fusedLocationClient: FusedLocationProviderClient =
        LocationServices.getFusedLocationProviderClient(context)

    override fun currentLocation(`swiftArena$`: SwiftArena?): Location {
        val androidLocation: AndroidLocation? = if (ContextCompat.checkSelfPermission(
                context,
                Manifest.permission.ACCESS_FINE_LOCATION
            ) == PackageManager.PERMISSION_GRANTED
        ) {
            runBlocking {
                fusedLocationClient.lastLocation.await()
            }
        } else {
            null
        }
        if (androidLocation == null) {
            throw IllegalStateException("Failed to retrieve location. Ensure location permissions are granted and location services are enabled.")
        }
        val location = Location.init(
            androidLocation.latitude,
            androidLocation.longitude,
            arena
        );
        return location
    }
}
