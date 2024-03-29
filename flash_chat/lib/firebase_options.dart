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
    apiKey: 'AIzaSyC0mL72eXCDPOvOW-q8i4-snwhpX60m5WQ',
    appId: '1:747216190514:web:3a65833fcded946260502b',
    messagingSenderId: '747216190514',
    projectId: 'flash-chat-3bf55',
    authDomain: 'flash-chat-3bf55.firebaseapp.com',
    storageBucket: 'flash-chat-3bf55.appspot.com',
    measurementId: 'G-5S425RXKQV',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDcv3FszzrgZeQ9IbZq1U2oUt1eCYF9PLE',
    appId: '1:747216190514:android:4adc08aa270152bb60502b',
    messagingSenderId: '747216190514',
    projectId: 'flash-chat-3bf55',
    storageBucket: 'flash-chat-3bf55.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB8KkKi6ylHyB-tjFkg_RcJ22Wt95cL21I',
    appId: '1:747216190514:ios:952f340cb3e59ecf60502b',
    messagingSenderId: '747216190514',
    projectId: 'flash-chat-3bf55',
    storageBucket: 'flash-chat-3bf55.appspot.com',
    iosBundleId: 'com.yehdhih.anna.flashChat',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB8KkKi6ylHyB-tjFkg_RcJ22Wt95cL21I',
    appId: '1:747216190514:ios:2df0daa7e7f55fb660502b',
    messagingSenderId: '747216190514',
    projectId: 'flash-chat-3bf55',
    storageBucket: 'flash-chat-3bf55.appspot.com',
    iosBundleId: 'com.example.flashChat.RunnerTests',
  );
}
