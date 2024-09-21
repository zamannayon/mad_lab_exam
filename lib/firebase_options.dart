// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for android - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.iOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBL69S4dulAY5s94gDYY8ZxQB_OSg-fn5w',
    appId: '1:351118418843:web:e7359e360816d5179c773e',
    messagingSenderId: '351118418843',
    projectId: 'mediapp-915b8',
    authDomain: 'mediapp-915b8.firebaseapp.com',
    storageBucket: 'mediapp-915b8.appspot.com',
    measurementId: 'G-W95ESPQMYQ',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBL69S4dulAY5s94gDYY8ZxQB_OSg-fn5w',
    appId: '1:351118418843:web:c6bab8de1c51b98b9c773e',
    messagingSenderId: '351118418843',
    projectId: 'mediapp-915b8',
    authDomain: 'mediapp-915b8.firebaseapp.com',
    storageBucket: 'mediapp-915b8.appspot.com',
    measurementId: 'G-YKSJMSFJ48',
  );
}
