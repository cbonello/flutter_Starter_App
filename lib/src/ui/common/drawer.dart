import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/blocs.dart';
import '../../utils/utils.dart';
import 'common.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map<ThemeMode, String> _themeToString = <ThemeMode, String>{
      ThemeMode.dark: context.l10n().msgThemeDark,
      ThemeMode.light: context.l10n().msgThemeLight,
      ThemeMode.system: context.l10n().msgThemeSystem,
    };

    return Drawer(
      child: SafeArea(
        child: ListView(
          children: <Widget>[
            BlocBuilder<AuthenticationBloc, AuthenticationState>(
              builder: (BuildContext context, AuthenticationState state) {
                FirebaseUser _user;
                state.maybeWhen(
                  authenticated: (FirebaseUser user) => _user = user,
                  orElse: () {},
                );

                return UserAccountsDrawerHeader(
                    accountName: Text(_user.displayName ?? _user.email),
                    accountEmail: Text(_user.displayName != null ? _user.email : ''),
                    currentAccountPicture: CircleAvatar(
                      radius: 50.0,
                      backgroundColor: const Color(0xFF778899),
                      child: UserCircleAvatar(user: _user),
                    ));
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.lightbulb_outline),
              title: const Text('Theme'
                  // textScaleFactor: textScaleFactor,
                  ),
              trailing: BlocBuilder<ThemeBloc, ThemeMode>(
                builder: (BuildContext context, ThemeMode mode) {
                  return DropdownButton<ThemeMode>(
                    value: mode,
                    elevation: 16,
                    onChanged: (ThemeMode newValue) {
                      final ThemeBloc themeBloc = context.bloc<ThemeBloc>();
                      themeBloc.add(newValue);
                    },
                    items: ThemeMode.values.map<DropdownMenuItem<ThemeMode>>(
                      (ThemeMode value) {
                        return DropdownMenuItem<ThemeMode>(
                          value: value,
                          child: Text(_themeToString[value]),
                        );
                      },
                    ).toList(),
                  );
                },
              ),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text(
                'Logout',
                // textScaleFactor: textScaleFactor,
              ),
              onTap: () {
                BlocProvider.of<AuthenticationBloc>(context).add(
                  const AuthenticationEvent.signedOut(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
