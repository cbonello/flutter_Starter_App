import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';

import '../../keys.dart';

class TosPrivacyScreen extends StatelessWidget {
  const TosPrivacyScreen({Key key, @required String title})
      : assert(title != null),
        _title = title,
        super(key: key);

  final String _title;

  static PageRoute<void> route(BuildContext context, String title) {
    return MaterialPageRoute<void>(
      builder: (_) => TosPrivacyScreen(title: title),
      settings: const RouteSettings(name: 'TosPrivacyScreen'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text(_title)),
        body: Scrollbar(
          key: AppWidgetKeys.keys['TosPrivacy'],
          child: SingleChildScrollView(child: Text(lorem(paragraphs: 20, words: 2000))),
        ),
      ),
    );
  }
}
