import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:starter_app/src/repositories/authentication_repository.dart';
import 'package:starter_app/src/services/local_storage.dart';

part 'authentication_bloc.freezed.dart';
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
  AuthenticationState get initialState => const AuthenticationState.uninitialized();

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    yield* event.when(
      appStarted: () => _mapAppStartedToState(),
      signedIn: (FirebaseUser user) => _mapSignedInToState(user),
      signedOut: () => _mapSignedOutToState(),
    );
  }

  Stream<AuthenticationState> _mapAppStartedToState() async* {
    try {
      final FirebaseUser user = await _authRepository.signInWithCurrentUser();
      if (user != null) {
        await _localStorageService.setAuthenticatedUserID(user.uid);
        yield AuthenticationState.authenticated(authenticatedUser: user);
        await _firebaseAnalytics.logLogin();
      } else {
        await _localStorageService.deleteAuthenticatedUserID();
        yield const AuthenticationState.unauthenticated();
      }
    } catch (_, stacktrace) {
      print(stacktrace);
      await _localStorageService.deleteAuthenticatedUserID();
      yield const AuthenticationState.unauthenticated();
    }
  }

  Stream<AuthenticationState> _mapSignedInToState(FirebaseUser user) async* {
    await _localStorageService.setAuthenticatedUserID(user.uid);
    yield AuthenticationState.authenticated(authenticatedUser: user);
    await _firebaseAnalytics.logLogin();
  }

  Stream<AuthenticationState> _mapSignedOutToState() async* {
    await _localStorageService.deleteAuthenticatedUserID();
    yield const AuthenticationState.unauthenticated();
    await _authRepository.signOut();
  }
}
