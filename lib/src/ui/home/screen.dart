import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import '../../blocs/authentication/authentication_bloc.dart';
import '../../configuration.dart';
import '../../keys.dart';
import '../../utils/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();

  static PageRoute<void> route(BuildContext context) {
    return platformPageRoute<void>(
      context: context,
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
      child: PlatformScaffold(
        appBar: PlatformAppBar(
          title: const Text(kAppName),
          android: (BuildContext context) {
            return MaterialAppBarData(
              actions: <Widget>[
                IconButton(
                  key: AppWidgetKeys.keys['HomeSignOutButton'],
                  icon: const Icon(Icons.exit_to_app),
                  onPressed: () {
                    BlocProvider.of<AuthenticationBloc>(context).add(
                      const AuthenticationEvent.signedOut(),
                    );
                  },
                )
              ],
            );
          },
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(context.l10n().msgYouHavePushedTheButton),
              Text('$_counter', key: AppWidgetKeys.keys['HomeCounterField']),
            ],
          ),
        ),
        android: (BuildContext context) {
          return MaterialScaffoldData(
            floatingActionButton: FloatingActionButton(
              key: AppWidgetKeys.keys['HomeFAB'],
              backgroundColor: Theme.of(context).primaryColor,
              onPressed: _incrementCounter,
              tooltip: context.l10n().msgIncrement,
              child: const Icon(Icons.add),
            ),
          );
        },
      ),
    );
  }
}
