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
    apiKey: 'AIzaSyCSlZF3OZsFh5zTtAON_TgZEYqSDJNkSP4',
    appId: '1:531660112900:web:1cb313492021279352e151',
    messagingSenderId: '531660112900',
    projectId: 'umlaassignmentapp',
    authDomain: 'umlaassignmentapp.firebaseapp.com',
    storageBucket: 'umlaassignmentapp.appspot.com',
    measurementId: 'G-ZR03MKDJH8',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD9dib4eu1m7iibicAEnMps9hh3CK6A9wI',
    appId: '1:531660112900:android:7c4f65463aeaf5fd52e151',
    messagingSenderId: '531660112900',
    projectId: 'umlaassignmentapp',
    storageBucket: 'umlaassignmentapp.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBARvFNPvivSGlbUYr4upBcg1lEYh3Ecmo',
    appId: '1:531660112900:ios:5785538a307f536352e151',
    messagingSenderId: '531660112900',
    projectId: 'umlaassignmentapp',
    storageBucket: 'umlaassignmentapp.appspot.com',
    iosBundleId: 'com.example.umlaAssignmentApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBARvFNPvivSGlbUYr4upBcg1lEYh3Ecmo',
    appId: '1:531660112900:ios:a99e640e1ca9108652e151',
    messagingSenderId: '531660112900',
    projectId: 'umlaassignmentapp',
    storageBucket: 'umlaassignmentapp.appspot.com',
    iosBundleId: 'com.example.umlaAssignmentApp.RunnerTests',
  );
}
