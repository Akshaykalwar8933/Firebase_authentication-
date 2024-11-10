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
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyBWnHNWZCYPYoPXe2ziqOtT1gYvWC2As4I',
    appId: '1:840791413143:web:04f644ad721dbb519cf4d2',
    messagingSenderId: '840791413143',
    projectId: 'learn-authentication-9e5c3',
    authDomain: 'learn-authentication-9e5c3.firebaseapp.com',
    storageBucket: 'learn-authentication-9e5c3.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyANOgc_255lOpyemoG4UjetOyZbTuo20vs',
    appId: '1:840791413143:android:d79ec6059a409aff9cf4d2',
    messagingSenderId: '840791413143',
    projectId: 'learn-authentication-9e5c3',
    storageBucket: 'learn-authentication-9e5c3.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAKO8PSYdFaLqY66gWpj-uBAQhBXDUcWG0',
    appId: '1:840791413143:ios:b6495da716e2d3599cf4d2',
    messagingSenderId: '840791413143',
    projectId: 'learn-authentication-9e5c3',
    storageBucket: 'learn-authentication-9e5c3.appspot.com',
    iosBundleId: 'com.akshay.learnAuth',
  );
}
