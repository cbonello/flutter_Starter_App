import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:starter_app/src/repositories/authentication_repository.dart';
import 'package:starter_app/src/services/local_storage.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc({
    @required LocalStorageService localStorageService,
    @required AuthenticationRepository authRepository,
    FirebaseAnalytics firebaseAnalytics,
  })  : _localStorageService = localStorageService,
        _authRepository = authRepository,
        _firebaseAnalytics = firebaseAnalytics ?? FirebaseAnalytics();

  final LocalStorageService _localStorageService;
  final AuthenticationRepository _authRepository;
  final FirebaseAnalytics _firebaseAnalytics;

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
      final FirebaseUser user = await _authRepository.signInWithCurrentUser();
      if (user != null) {
        await _localStorageService.setAuthenticatedUserID(user.uid);
        yield AuthenticatedAuthenticationState(authenticatedUser: user);
        await _firebaseAnalytics.logLogin();
      } else {
        await _localStorageService.deleteAuthenticatedUserID();
        yield UnauthenticatedAuthenticationState();
      }
    } catch (_, stacktrace) {
      print(stacktrace);
      await _localStorageService.deleteAuthenticatedUserID();
      yield UnauthenticatedAuthenticationState();
    }
  }

  Stream<AuthenticationState> _mapSignedInToState(FirebaseUser user) async* {
    await _localStorageService.setAuthenticatedUserID(user.uid);
    yield AuthenticatedAuthenticationState(authenticatedUser: user);
    await _firebaseAnalytics.logLogin();
  }

  Stream<AuthenticationState> _mapSignedOutToState() async* {
    await _localStorageService.deleteAuthenticatedUserID();
    yield UnauthenticatedAuthenticationState();
    await _authRepository.signOut();
  }
}
