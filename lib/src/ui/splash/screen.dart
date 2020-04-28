import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import '../../configuration.dart';
import '../../keys.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PlatformScaffold(
        body: Center(
          child: FractionallySizedBox(
            widthFactor: 0.5,
            child: Image.asset(
              kAppAssetLogo,
              fit: BoxFit.fill,
              key: AppWidgetKeys.keys['SplashImage'],
            ),
          ),
        ),
      ),
    );
  }
}
