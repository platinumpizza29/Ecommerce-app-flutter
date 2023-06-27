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
    apiKey: 'AIzaSyAJz24UGsNUJ2SHgwpc5h73YQrvCWSitRQ',
    appId: '1:666492706576:web:8e3eb539e5357d51cc8f95',
    messagingSenderId: '666492706576',
    projectId: 'ecommerce-b3b5b',
    authDomain: 'ecommerce-b3b5b.firebaseapp.com',
    storageBucket: 'ecommerce-b3b5b.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBuVOZCuKL1Vbdxz0RcTTYLUtSTsRY1zec',
    appId: '1:666492706576:android:f9ea38751892cad6cc8f95',
    messagingSenderId: '666492706576',
    projectId: 'ecommerce-b3b5b',
    storageBucket: 'ecommerce-b3b5b.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC9JYUPjAjfzxDY_zAYd7zArFSgHRKvPOY',
    appId: '1:666492706576:ios:2bb9a151c34dbdc1cc8f95',
    messagingSenderId: '666492706576',
    projectId: 'ecommerce-b3b5b',
    storageBucket: 'ecommerce-b3b5b.appspot.com',
    iosClientId: '666492706576-emsc3v0rfh2vbpdi5as9tvfi46f47t1h.apps.googleusercontent.com',
    iosBundleId: 'com.example.ecommerce',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC9JYUPjAjfzxDY_zAYd7zArFSgHRKvPOY',
    appId: '1:666492706576:ios:8bf7344d98be7475cc8f95',
    messagingSenderId: '666492706576',
    projectId: 'ecommerce-b3b5b',
    storageBucket: 'ecommerce-b3b5b.appspot.com',
    iosClientId: '666492706576-phbb3l02nsrls7qrtm8c4j4u70mpte9g.apps.googleusercontent.com',
    iosBundleId: 'com.example.ecommerce.RunnerTests',
  );
}
