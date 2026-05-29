// Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
// SPDX-License-Identifier: Apache-2.0

import Foundation

/// Provides configuration for MapLibre network requests to include Apple app identity headers.
/// This enables API key Apple app restrictions for map tile requests.
///
/// Usage:
/// ```
/// MapLibreHTTPProvider.configureMapLibre()
/// ```
///
/// Call this before creating any MLNMapView or using MLNOfflineStorage.
public class MapLibreHTTPProvider {
    
    /// Configures MapLibre's network session to include the X-Apple-Bundle-Id header
    /// for API key Apple app restrictions on map tile requests.
    public static func configureMapLibre() {
        guard let bundleId = Bundle.main.bundleIdentifier else { return }
        
        let config = URLSessionConfiguration.default
        config.httpAdditionalHeaders = [
            "X-Apple-Bundle-Id": bundleId
        ]
        
        // MLNNetworkConfiguration is from MapLibre - we use runtime to avoid hard dependency
        if let networkConfigClass = NSClassFromString("MLNNetworkConfiguration") as? NSObject.Type,
           let sharedManager = networkConfigClass.value(forKey: "sharedManager") as? NSObject {
            sharedManager.setValue(config, forKey: "sessionConfiguration")
        }
    }
}
