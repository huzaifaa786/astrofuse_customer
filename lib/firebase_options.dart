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
    apiKey: 'AIzaSyDvlCLhgvDp1mLCjfacrMBvz57byCNpyuY',
    appId: '1:926297276895:web:5cb09cd48721d87e7e446a',
    messagingSenderId: '926297276895',
    projectId: 'astroappweb',
    authDomain: 'astroappweb.firebaseapp.com',
    storageBucket: 'astroappweb.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAly5y6mHMLgQLdZFDDipq34csapjM2yhs',
    appId: '1:926297276895:android:48f9278d948c86f47e446a',
    messagingSenderId: '926297276895',
    projectId: 'astroappweb',
    storageBucket: 'astroappweb.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDxxqnTdr8gz4Oyrp-W6-UF_Eb-S6qeCdo',
    appId: '1:926297276895:ios:6b89d8006ed939407e446a',
    messagingSenderId: '926297276895',
    projectId: 'astroappweb',
    storageBucket: 'astroappweb.appspot.com',
    iosClientId: '926297276895-eu3vlubkhlk30po0cng63mm9fpq7jugb.apps.googleusercontent.com',
    iosBundleId: 'com.os.AstroGuru.app',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDxxqnTdr8gz4Oyrp-W6-UF_Eb-S6qeCdo',
    appId: '1:926297276895:ios:885e9336af72d0197e446a',
    messagingSenderId: '926297276895',
    projectId: 'astroappweb',
    storageBucket: 'astroappweb.appspot.com',
    iosClientId: '926297276895-3qc04vnqa3r6b9dng9r0a7765dkvos67.apps.googleusercontent.com',
    iosBundleId: 'com.astro.app',
  );
}
