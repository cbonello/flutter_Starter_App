# Flutter Starter App (BLoC pattern)

A Flutter starter project (tested on Android only). Project contains splash, sign in, sign up, password reset and home screens.
it uses Firebare for authentication and the BLoC pattern ([flutter_bloc](https://pub.dev/packages/flutter_bloc) library) for state management.

## Setup

Follow these steps to setup the app:

 1. Create a Firebase project in the [Firebase Console](https://console.firebase.google.com) and add and Android app to the project.
 1. In the Firebase console, enable Email/Password authentication on your project by doing: **Authentication > SIGN-IN METHOD > Email/Password > Enable > SAVE**
 1. In the Firebase console, enable Google authentication on your project by doing: **Authentication > SIGN-IN METHOD > Google > Enable > SAVE**
 1. In the Firebase console, update the password reset template by doing: **Authentication > TEMPLATES > Password reset**

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

- [Dash Tips: Using Bloc with Freezed](https://chimon.hashnode.dev/dash-tips-using-bloc-with-freezed-ck8s5s89000mnhps1zf62m14n)

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