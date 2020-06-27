import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/authentication/authentication_bloc.dart';
import 'index.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
            // const Divider(),
            // ListTile(
            //   leading: const Icon(Icons.settings),
            //   title: const Text(
            //     'Settings',
            //     // textScaleFactor: textScaleFactor,
            //   ),
            //   onTap: () {
            //     Navigator.of(context).popAndPushNamed("/settings");
            //   },
            // ),
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
