import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:meta/meta.dart';
import 'package:starter_app/src/models/user_model.dart';
import 'package:starter_app/src/repositories/authentication_repository.dart';
import 'package:starter_app/src/services/local_storage.dart';
import 'package:starter_app/src/services/service_locator.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc({FirebaseAnalytics firebaseAnalytics})
      : _firebaseAnalytics = firebaseAnalytics ?? FirebaseAnalytics();

  final FirebaseAnalytics _firebaseAnalytics;
  final LocalStorageServiceInterface _prefs = locator<LocalStorageServiceInterface>();
  final AuthenticationRepositoryInterface _authenticationRepository =
      locator<AuthenticationRepositoryInterface>();

  @override
  AuthenticationState get initialState => UninitializedAuthenticationState();

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is AppStartedAuthenticationEvent) {
      yield* _mapAppStartedToState();
    } else if (event is SignedInAuthenticationEvent) {
      yield* _mapSignedInToState(event.user);
    } else if (event is SignedOutAuthenticationEvent) {
      yield* _mapSignedOutToState();
    }
  }

  Stream<AuthenticationState> _mapAppStartedToState() async* {
    try {
      final UserModel user = await _authenticationRepository.signInWithCurrentUser();
      if (user != null) {
        await _prefs.setAuthenticatedUserID(user.userID);
        yield AuthenticatedAuthenticationState(authenticatedUser: user);
        await _firebaseAnalytics.logLogin();
      } else {
        await _prefs.deleteAuthenticatedUserID();
        yield UnauthenticatedAuthenticationState();
      }
    } catch (_, stacktrace) {
      print(stacktrace);
      await _prefs.deleteAuthenticatedUserID();
      yield UnauthenticatedAuthenticationState();
    }
  }

  Stream<AuthenticationState> _mapSignedInToState(UserModel user) async* {
    await _prefs.setAuthenticatedUserID(user.userID);
    yield AuthenticatedAuthenticationState(authenticatedUser: user);
    await _firebaseAnalytics.logLogin();
  }

  Stream<AuthenticationState> _mapSignedOutToState() async* {
    await _prefs.deleteAuthenticatedUserID();
    yield UnauthenticatedAuthenticationState();
    await _authenticationRepository.signOut();
  }
}
