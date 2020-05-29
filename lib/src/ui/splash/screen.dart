import 'package:flutter/material.dart';

import '../../configuration.dart';
import '../../keys.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: FractionallySizedBox(
            widthFactor: 0.5,
            child: Image.asset(
              kAppAssetLogo,
              key: AppWidgetKeys.keys['SplashImage'],
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}
