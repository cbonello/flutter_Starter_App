# Flutter Starter App (BLoC pattern)

[![build](https://github.com/cbonello/flutter_Starter_App/workflows/Dart%20CI/badge.svg)](https://github.com/cbonello/flutter_Starter_App/actions)
[![License: MIT](https://img.shields.io/badge/license-MIT-purple.svg)](https://opensource.org/licenses/MIT)
<!-- [!Coverage](https://raw.githubusercontent.com/cbonello/flutter_Starter_App/master/coverage_badge.svg?sanitize=true) -->

A Flutter starter project (tested on Android only). Project contains splash, sign in, sign up, password reset and home screens.
it uses Firebase for authentication and the BLoC pattern ([flutter_bloc](https://pub.dev/packages/flutter_bloc) library) for state management.

**Project was only tested on Android!**

## Features

- Sign In (email + password or Google Sign-In).
- Sign Up.
- Password reset.
- Email verification.
- Firebase Analytics.
- Flutter web support.

## Setup

[`lib/src/configuration.dart`](./lib/src/configuration.dart) allows you to quickly enable/disable options. 

- `kUseGoogleASignIn`: Google Sign-In; not supported for Flutter web as of now.
- `kUseFirebaseAnalytics`: Firebase Analytics; not supported for Flutter web as of now.
- `kUseFlutterBlocDelegate`: Flutter_bloc delegates.
- `kUseDevicePreview`: Great `Device Preview` package from [Aloïs Deniel](https://aloisdeniel.github.com/).

### Android App

1. Create a Firebase project in the [Firebase Console](https://console.firebase.google.com) and add and Android app to the project. Please follow the installation instructions from the [Firebase Auth package](https://pub.dev/packages/firebase_auth).
1. In the Firebase console, enable Email/Password authentication on your project by doing: **Authentication > SIGN-IN METHOD > Email/Password > Enable > SAVE**
1. In the Firebase console, enable Google authentication on your project by doing: **Authentication > SIGN-IN METHOD > Google > Enable > SAVE**
1. In the Firebase console, update the email address verification template by doing: **Authentication > TEMPLATES > Email address verification**
1. In the Firebase console, update the password reset template by doing: **Authentication > TEMPLATES > Password reset**

### Flutter Web

**Important:**
- You need the latest version of the Flutter SDK from the beta channel to compile this project. See
[Building a web application with Flutter](https://flutter.dev/docs/get-started/web).

1. Create a Firebase project in the [Firebase Console](https://console.firebase.google.com) and add a web app to the project.
1. Rename ```web/SAMPLE_firebase.js``` as ```web/firebase.js``` and update its content with the Firebase SDK snippet
from the Firebase Console (see [Resources](#Resources)).
1. In the Firebase console, enable Email/Password authentication on your project by doing: **Authentication > SIGN-IN METHOD > Email/Password > Enable > SAVE**
1. In the Firebase console, update the email address verification template by doing: **Authentication > TEMPLATES > Email address verification**
1. In the Firebase console, update the password reset template by doing: **Authentication > TEMPLATES > Password reset**
<!-- 1. Follow the instructions from [google_sign_in_web README](https://pub.dev/packages/google_sign_in_web) and include your OAuth ID to ```web/index.html```. -->
<!-- - [Flutter Web Google Sign In](https://stackoverflow.com/questions/60250342/flutter-web-google-sign-in) -->

#### Resources

- [firebase_auth README](https://pub.dev/packages/firebase_auth)
- [firebase_auth_web README](https://github.com/FirebaseExtended/flutterfire/blob/master/packages/firebase_auth/firebase_auth_web/README.md)
- [Add Firebase to your JavaScript project](https://firebase.google.com/docs/web/setup#from-the-cdn)
<!-- - [google_sign_in_web README](https://pub.dev/packages/google_sign_in_web) -->

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

## Resources

- Stack Overflow, [How to change package name in flutter?](https://stackoverflow.com/questions/51534616/how-to-change-package-name-in-flutter#answer-51550358)
- Felix Angelov, [flutter_bloc: Flutter Firebase Login Tutorial](https://bloclibrary.dev/#/flutterfirebaselogintutorial)
- Remi Rousselet, [Getting Started: Creating Your Flutter Project](https://dash-overflow.net/articles/getting_started/)
- Ryan Edge, [Dash Tips: Using Bloc with Freezed](https://chimon.hashnode.dev/dash-tips-using-bloc-with-freezed-ck8s5s89000mnhps1zf62m14n)
- Gaspard Merten, [The Flutter Guide to Firebase Analytics](https://medium.com/flutter-community/the-flutter-guide-to-firebase-analytics-9b99c6e27a6)
- Sam Debruyn, [Easy localization in Flutter with continuous integration](https://debruyn.dev/2019/easy-localization-in-flutter-with-continuous-integration/)

## Created & Maintained by

[Christophe Bonello](https://github.com/cbonello)
([LinkedIn](https://www.linkedin.com/in/christophe-bonello))
([Twitter](https://twitter.com/chbonello))

[![Open Source](https://badges.frapsoft.com/os/v1/open-source.svg?v=102)](https://opensource.org/licenses/MIT)
[![License](https://img.shields.io/badge/license-MIT-purple)](https://github.com/cbonello/amiidex/blob/master/LICENSE)

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