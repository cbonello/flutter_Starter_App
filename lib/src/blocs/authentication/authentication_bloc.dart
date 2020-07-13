import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../repositories/repositories.dart';
import '../../services/services.dart';

part 'authentication_bloc.freezed.dart';
part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc({
    @required LocalStorageService localStorageService,
    @required AuthenticationRepositoryInterface authRepository,
    @required AnalyticsService analyticsService,
  })  : assert(localStorageService != null),
        _localStorageService = localStorageService,
        assert(authRepository != null),
        _authRepository = authRepository,
        assert(analyticsService != null),
        _analyticsService = analyticsService,
        super(const AuthenticationState.uninitialized());

  final LocalStorageService _localStorageService;
  final AuthenticationRepositoryInterface _authRepository;
  final AnalyticsService _analyticsService;

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
        await _analyticsService.logSignIn('signInWithCurrentUser');
      } else {
        await _localStorageService.deleteAuthenticatedUserID();
        yield const AuthenticationState.unauthenticated();
      }
    } catch (_) {
      await _localStorageService.deleteAuthenticatedUserID();
      yield const AuthenticationState.unauthenticated();
    }
  }

  Stream<AuthenticationState> _mapSignedInToState(FirebaseUser user) async* {
    await _localStorageService.setAuthenticatedUserID(user.uid);
    yield AuthenticationState.authenticated(authenticatedUser: user);
  }

  Stream<AuthenticationState> _mapSignedOutToState() async* {
    await _localStorageService.deleteAuthenticatedUserID();
    yield const AuthenticationState.unauthenticated();
    await _authRepository.signOut();
    await _analyticsService.logSignOut();
  }
}
