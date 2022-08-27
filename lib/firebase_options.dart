// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        return linux;
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCYYgA9Bc-OHbRLWdUHGgxwPZ_Ga58553M',
    appId: '1:221304024457:web:1a1d947cb99337ed044558',
    messagingSenderId: '221304024457',
    projectId: 'crud-test-mk',
    authDomain: 'crud-test-mk.firebaseapp.com',
    storageBucket: 'crud-test-mk.appspot.com',
    measurementId: 'G-MB9KEK2ZYL',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAX6Qon0DHT75V65y_j7OebM3fk0t6AreY',
    appId: '1:221304024457:android:75e987ba798f319f044558',
    messagingSenderId: '221304024457',
    projectId: 'crud-test-mk',
    storageBucket: 'crud-test-mk.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAc83vOZg1u_5nCzQ_ZO9t6-eMDH46_NHo',
    appId: '1:221304024457:ios:42bdcbcdd91868ae044558',
    messagingSenderId: '221304024457',
    projectId: 'crud-test-mk',
    storageBucket: 'crud-test-mk.appspot.com',
    iosClientId:
        '221304024457-ed1su6ar2m89dpebcvev3q4ftmtgjg77.apps.googleusercontent.com',
    iosBundleId: 'com.example.crudTutorial',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAc83vOZg1u_5nCzQ_ZO9t6-eMDH46_NHo',
    appId: '1:221304024457:ios:42bdcbcdd91868ae044558',
    messagingSenderId: '221304024457',
    projectId: 'crud-test-mk',
    storageBucket: 'crud-test-mk.appspot.com',
    iosClientId:
        '221304024457-ed1su6ar2m89dpebcvev3q4ftmtgjg77.apps.googleusercontent.com',
    iosBundleId: 'com.example.crudTutorial',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: "AIzaSyCYYgA9Bc-OHbRLWdUHGgxwPZ_Ga58553M",
    appId: "1:221304024457:web:0bc4ec37272eb8c5044558",
    authDomain: "crud-test-mk.firebaseapp.com",
    projectId: "crud-test-mk",
    storageBucket: "crud-test-mk.appspot.com",
    messagingSenderId: "221304024457",
    measurementId: "G-8V4F9E5XBM",
  );

  static const FirebaseOptions linux = FirebaseOptions(
    apiKey: 'AIzaSyCYYgA9Bc-OHbRLWdUHGgxwPZ_Ga58553M',
    appId: '1:221304024457:web:1a1d947cb99337ed044558',
    messagingSenderId: '221304024457',
    projectId: 'crud-test-mk',
    authDomain: 'crud-test-mk.firebaseapp.com',
    storageBucket: 'crud-test-mk.appspot.com',
    measurementId: 'G-MB9KEK2ZYL',
  );
}
