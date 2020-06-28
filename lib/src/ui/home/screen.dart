import 'package:flutter/material.dart';

import '../../configuration.dart';
import '../../keys.dart';
import '../../utils/utils.dart';
import '../common/common.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();

  static PageRoute<void> route(BuildContext context) {
    return MaterialPageRoute<void>(
      builder: (_) => HomeScreen(),
      settings: const RouteSettings(name: 'HomeScreen'),
    );
  }
}

class _HomeScreenState extends State<HomeScreen> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text(kAppName)),
        drawer: AppDrawer(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(context.l10n().msgYouHavePushedTheButton),
              Text('$_counter', key: AppWidgetKeys.keys['HomeCounterField']),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          key: AppWidgetKeys.keys['HomeFAB'],
          backgroundColor: Theme.of(context).primaryColor,
          onPressed: _incrementCounter,
          tooltip: context.l10n().msgIncrement,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
