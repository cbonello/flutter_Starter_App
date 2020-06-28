import 'package:flutter/material.dart';

import '../../configuration.dart';
import '../../utils/utils.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({Key key, this.scaleFactor = 1.0}) : super(key: key);

  final double scaleFactor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Hero(
          tag: kAppAssetLogo,
          child: Image(
            height: 120.0 * scaleFactor,
            fit: BoxFit.fill,
            image: const AssetImage(kAppAssetLogo),
            semanticLabel: context.l10n().msgApplicationLogo,
          ),
        ),
        const SizedBox(width: 10.0),
        Expanded(
          child: Text(kAppName, style: Theme.of(context).textTheme.headline6),
        ),
      ],
    );
  }
}
