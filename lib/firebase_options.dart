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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyAYrfyxqFWyKtNBRZ4AxBZXChpFBD5YZ0c',
    appId: '1:22471713389:web:cd1a62d67c345565911564',
    messagingSenderId: '22471713389',
    projectId: 'jakaria-61fa1',
    authDomain: 'jakaria-61fa1.firebaseapp.com',
    storageBucket: 'jakaria-61fa1.appspot.com',
    measurementId: 'G-497GDY1WZJ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBqNNgu2vWEg-pwInQcFoA8NcPV0YWDUas',
    appId: '1:22471713389:android:7160252b798af3b7911564',
    messagingSenderId: '22471713389',
    projectId: 'jakaria-61fa1',
    storageBucket: 'jakaria-61fa1.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDQC3EpD8iEtJgsJtEEmvaCHchf2DW39Sw',
    appId: '1:22471713389:ios:9d03c514e8f95fec911564',
    messagingSenderId: '22471713389',
    projectId: 'jakaria-61fa1',
    storageBucket: 'jakaria-61fa1.appspot.com',
    iosBundleId: 'com.example.navigator',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDQC3EpD8iEtJgsJtEEmvaCHchf2DW39Sw',
    appId: '1:22471713389:ios:70d327c1dbc6ea9e911564',
    messagingSenderId: '22471713389',
    projectId: 'jakaria-61fa1',
    storageBucket: 'jakaria-61fa1.appspot.com',
    iosBundleId: 'com.example.navigator.RunnerTests',
  );
}
