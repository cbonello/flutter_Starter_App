# Flutter Starter App (BLoC pattern)

[![build](https://github.com/cbonello/flutter_Starter_App/workflows/Dart%20CI/badge.svg)](https://github.com/cbonello/flutter_Starter_App/actions)
[![codecov](https://codecov.io/gh/cbonello/flutter_Starter_App/branch/master/graph/badge.svg)](https://codecov.io/gh/cbonello/flutter_Starter_App)
[![License: MIT](https://img.shields.io/badge/license-MIT-purple.svg)](https://opensource.org/licenses/MIT)

A Flutter starter project that contains splash, sign in, sign up, password reset and email verification.
it uses Firebase for authentication and the BLoC pattern ([flutter_bloc](https://pub.dev/packages/flutter_bloc) library) for state management.

**Project was only tested on Android and the web ([online demo](https://flutter-starterapp.web.app)).**

## Features

- Sign In (email + password or Google Sign-In).
- Sign Up.
- Password reset.
- Email verification.
- Firebase Analytics.
- Flutter web support.

## Setup

[`lib/src/configuration.dart`](./lib/src/configuration.dart) allows you to quickly enable/disable options. 

- `kUseGoogleASignIn`: [Google Sign-In](https://pub.dev/packages/google_sign_in); not supported for Flutter web as of now.
- `kUseFirebaseAnalytics`: [Firebase Analytics](https://pub.dev/packages/firebase_analytics); not supported for Flutter web as of now.
- `kUseFlutterBlocObserver`: Flutter_bloc [oberver](https://pub.dev/documentation/bloc/latest/bloc/BlocObserver-class.html).

### Steps

1. Create a Firebase project in the [Firebase Console](https://console.firebase.google.com) and add an Android app to the project. Please follow the installation instructions from the [Firebase Auth package](https://pub.dev/packages/firebase_auth).
1. In the Firebase console, enable Email/Password authentication by doing: **Authentication > SIGN-IN METHOD > Email/Password > Enable > SAVE**
1. In the Firebase console, enable Google authentication by doing: **Authentication > SIGN-IN METHOD > Google > Enable > SAVE**
1. In the Firebase console, update the email address verification template by doing: **Authentication > TEMPLATES > Email address verification**
1. In the Firebase console, update the password reset template by doing: **Authentication > TEMPLATES > Password reset**

### Additional Steps for Flutter Web

**Important:**
You need the latest version of the Flutter SDK from the beta channel to compile this project. See
[Building a web application with Flutter](https://flutter.dev/docs/get-started/web).

1. Add web support by running (restart your IDE aftert running the command):
```bash
flutter config --enable-web
```
2. Rename ```web/SAMPLE_firebase.js``` as ```web/firebase.js``` and update its content with the Firebase SDK snippet
from the Firebase Console (see [Resources](#Resources)).
1. Follow the instructions from [google_sign_in_web README](https://pub.dev/packages/google_sign_in_web) and include your OAuth ID to ```web/index.html```, line 42.
1. Check this [stackoverflow thread](https://stackoverflow.com/questions/59480956/browser-or-app-may-not-be-secure-try-using-a-different-browser-error-with-fl) if you encounter the “Browser or app may not be secure. Try using a different browser.” error with Google Sign-In.

#### Resources

- [Add Firebase to your JavaScript project](https://firebase.google.com/docs/web/setup#from-the-cdn)
- [firebase_auth README](https://pub.dev/packages/firebase_auth)
- [firebase_auth_web README](https://github.com/FirebaseExtended/flutterfire/blob/master/packages/firebase_auth/firebase_auth_web/README.md)
- [google_sign_in_web README](https://pub.dev/packages/google_sign_in_web)
- thehappyharis, [Flutter Web: Google Sign In](https://www.youtube.com/watch?time_continue=752&v=E8kgHqEz6fs&feature=emb_logo)

## Screenshots

Sign In Screen | Sign Up Screen
--- | ---
![Sign In Screen](/screenshots/signin_screen_light.png?raw=true "Sign In Screen") | ![Sign Up Screen](/screenshots/signup_screen_dark.png?raw=true "Sign Up Screen")

Password Reset Screen | Home Screen
--- | ---
![Sign In Screen](/screenshots/password_reset_screen_light.png?raw=true "Sign In Screen") | ![Sign Up Screen](/screenshots/home_screen_dark.png?raw=true "Sign Up Screen")

## Learn More on Flutter

Here are a few resources to get you started if you are new to Flutter:

- [Official Flutter documentation](https://flutter.dev/docs)
- [Flutter youtube channel](https://www.youtube.com/channel/UCwXdFgeE9KYzlDdR7TG9cMw)
- [Lab: Write your first Flutter app](https://flutter.io/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.io/docs/cookbook)

## General Resources

- Stack Overflow, [How to change package name in flutter?](https://stackoverflow.com/questions/51534616/how-to-change-package-name-in-flutter#answer-51550358)
- Felix Angelov, [flutter_bloc: Flutter Firebase Login Tutorial](https://bloclibrary.dev/#/flutterfirebaselogintutorial)
- Remi Rousselet, [Getting Started: Creating Your Flutter Project](https://dash-overflow.net/articles/getting_started/)
- Ryan Edge, [Dash Tips: Using Bloc with Freezed](https://chimon.hashnode.dev/dash-tips-using-bloc-with-freezed-ck8s5s89000mnhps1zf62m14n)
- Adam Cooper, [Continuous Integration for Flutter with GitHub Actions](https://admcpr.com/continuous-integration-for-flutter-with-github-actions/)
- Sam Debruyn, [Easy localization in Flutter with continuous integration](https://debruyn.dev/2019/easy-localization-in-flutter-with-continuous-integration/)
- Gaspard Merten, [The Flutter Guide to Firebase Analytics](https://medium.com/flutter-community/the-flutter-guide-to-firebase-analytics-9b99c6e27a6)
- thehappyharis, [Progressive Web App (PWA) in Flutter Web](https://www.youtube.com/watch?v=SvDXytrX1Wc)

## Created & Maintained by

[Christophe Bonello](https://github.com/cbonello)
([LinkedIn](https://www.linkedin.com/in/christophe-bonello))
([Twitter](https://twitter.com/chbonello))

## Contribution Guidelines

This project is a fully open source project, and contributions are welcome.

## License

```
Copyright (c) 2020 Christophe Bonello

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```