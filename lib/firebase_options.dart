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
        return macos;
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
    apiKey: 'AIzaSyAz_fsghJdS1O_uyXi6Dho7PGDgvkC-STY',
    appId: '1:370154833198:web:118fe81c4bdb0cdb2066bf',
    messagingSenderId: '370154833198',
    projectId: 'recruiters-app-dfebb',
    authDomain: 'recruiters-app-dfebb.firebaseapp.com',
    storageBucket: 'recruiters-app-dfebb.firebasestorage.app',
    measurementId: 'G-5VCZXQMGMQ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAHsDsqmvVGj0zwvDQaVBt77l2Is2iQUzw',
    appId: '1:980107544854:android:83fca7cf722cdda4b26837',
    messagingSenderId: '980107544854',
    projectId: 'hdc-dev-9202b',
    storageBucket: 'hdc-dev-9202b.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDF8xpLfPovhAG7c3IEAp9T8p2gByUV1qc',
    appId: '1:370154833198:ios:5640c588d95d0e612066bf',
    messagingSenderId: '370154833198',
    projectId: 'recruiters-app-dfebb',
    storageBucket: 'recruiters-app-dfebb.firebasestorage.app',
    iosBundleId: 'com.example.recruiters',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDF8xpLfPovhAG7c3IEAp9T8p2gByUV1qc',
    appId: '1:370154833198:ios:5640c588d95d0e612066bf',
    messagingSenderId: '370154833198',
    projectId: 'recruiters-app-dfebb',
    storageBucket: 'recruiters-app-dfebb.firebasestorage.app',
    iosBundleId: 'com.example.recruiters',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAz_fsghJdS1O_uyXi6Dho7PGDgvkC-STY',
    appId: '1:370154833198:web:51e3e014a93222892066bf',
    messagingSenderId: '370154833198',
    projectId: 'recruiters-app-dfebb',
    authDomain: 'recruiters-app-dfebb.firebaseapp.com',
    storageBucket: 'recruiters-app-dfebb.firebasestorage.app',
    measurementId: 'G-1MKEJ2FC85',
  );

}