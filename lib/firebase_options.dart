// Copyright 2026, the Chromium project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Generated for Firebase configuration.
// These values are taken from your Firebase project:
// smart-travel-companion-dc236

import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  /// Returns the Firebase configuration for the current platform.
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }

    return switch (defaultTargetPlatform) {
      TargetPlatform.android => android,
      TargetPlatform.iOS => ios,

      // Uncomment these when macOS or Windows Firebase configuration
      // is available.
      //
      // TargetPlatform.macOS => macos,
      // TargetPlatform.windows => windows,

      _ => throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        ),
    };
  }

  /// Firebase configuration for Web.
  ///
  /// Your provided google-services.json contains Android and iOS
  /// configuration, but it does not contain the complete Web Firebase
  /// configuration.
  ///
  /// Replace these values with the Web Firebase configuration if
  /// Web support is required.
  static const web = FirebaseOptions(
    apiKey: 'YOUR_WEB_API_KEY',
    appId: 'YOUR_WEB_APP_ID',
    messagingSenderId: '489895926371',
    projectId: 'smart-travel-companion-dc236',
    authDomain: 'smart-travel-companion-dc236.firebaseapp.com',
    storageBucket: 'smart-travel-companion-dc236.firebasestorage.app',
  );

  /// Firebase configuration for Android.
  ///
  /// Firebase Android package name:
  /// com.example.smart_travel
  static const android = FirebaseOptions(
    apiKey: 'AIzaSyCAfyL-hReq5z8--tX-EeqMB-0oU6krXm0',
    appId: '1:489895926371:android:72485dc483b176c1e43656',
    messagingSenderId: '489895926371',
    projectId: 'smart-travel-companion-dc236',
    storageBucket: 'smart-travel-companion-dc236.firebasestorage.app',
  );

  /// Firebase configuration for iOS.
  ///
  /// Your provided configuration contains the iOS bundle ID:
  /// com.example.smart
  ///
  /// Replace the API key and App ID with the values from
  /// your iOS Firebase configuration.
  static const ios = FirebaseOptions(
    apiKey: 'YOUR_IOS_API_KEY',
    appId: 'YOUR_IOS_APP_ID',
    messagingSenderId: '489895926371',
    projectId: 'smart-travel-companion-dc236',
    storageBucket: 'smart-travel-companion-dc236.firebasestorage.app',
    iosBundleId: 'com.example.smart',
  );

  // Firebase configuration for macOS.
  //
  // Uncomment when macOS Firebase configuration is available.
  //
  // static const macos = ios;

  // Firebase configuration for Windows.
  //
  // Uncomment when Windows Firebase configuration is available.
  //
  // static const windows = FirebaseOptions(
  //   apiKey: 'YOUR_WINDOWS_API_KEY',
  //   appId: 'YOUR_WINDOWS_APP_ID',
  //   messagingSenderId: '489895926371',
  //   projectId: 'smart-travel-companion-dc236',
  //   authDomain: 'smart-travel-companion-dc236.firebaseapp.com',
  //   storageBucket: 'smart-travel-companion-dc236.firebasestorage.app',
  // );
}