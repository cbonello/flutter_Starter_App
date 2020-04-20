import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rxdart/rxdart.dart';

import '../../repositories/authentication_repository.dart';
import '../../services/analytics.dart';
import '../../utils/exceptions.dart';
import '../../utils/validators.dart';

part 'signin_bloc.freezed.dart';
part 'signin_event.dart';
part 'signin_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc({
    @required AuthenticationRepository authRepository,
    @required AnalyticsService analyticsService,
  })  : assert(authRepository != null),
        _authRepository = authRepository,
        assert(analyticsService != null),
        _analyticsService = analyticsService;

  final AuthenticationRepository _authRepository;
  final AnalyticsService _analyticsService;

  @override
  SignInState get initialState => SignInState.empty();

  @override
  Stream<SignInState> transformEvents(
    Stream<SignInEvent> events,
    Stream<SignInState> Function(SignInEvent event) next,
  ) {
    final Stream<SignInEvent> nonDebounceStream = events.where((SignInEvent event) {
      return event is! _EmailChanged && event is! _PasswordChanged;
    });
    final Stream<SignInEvent> debounceStream = events.where((SignInEvent event) {
      return event is _EmailChanged || event is _PasswordChanged;
    }).debounceTime(const Duration(milliseconds: 300));
    return super.transformEvents(
      nonDebounceStream.mergeWith(<Stream<SignInEvent>>[debounceStream]),
      next,
    );
  }

  @override
  Stream<SignInState> mapEventToState(SignInEvent event) async* {
    yield* event.when(
      emailChanged: (String email) => _mapEmailChangedToState(email),
      passwordChanged: (String password) => _mapPasswordChangedToState(password),
      emailAndPasswordPressed: (String email, String password) =>
          _mapSignInWithEmailAndPasswordToState(
        email: email,
        password: password,
      ),
      googlePressed: () => _mapSignInWithGoogleToState(),
    );
  }

  Stream<SignInState> _mapEmailChangedToState(String email) async* {
    yield state.update(
      isEmailValid: isValidEmail(email),
      isPasswordValid: state.isPasswordValid,
      user: state.user,
    );
  }

  Stream<SignInState> _mapPasswordChangedToState(String password) async* {
    yield state.update(
      isEmailValid: state.isEmailValid,
      isPasswordValid: password.isNotEmpty,
      user: state.user,
    );
  }

  Stream<SignInState> _mapSignInWithEmailAndPasswordToState({
    String email,
    String password,
  }) async* {
    yield SignInState.signingIn();
    try {
      final FirebaseUser user = await _authRepository.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      await _analyticsService.logSignIn('signInWithEmailAndPassword');
      yield SignInState.success(user: user);
    } catch (exception) {
      await _authRepository.signOut();
      yield SignInState.failure(
        exceptionRaised: AppException.from(exception as Exception),
      );
    }
  }

  Stream<SignInState> _mapSignInWithGoogleToState() async* {
    try {
      final FirebaseUser user = await _authRepository.signInWithGoogle();
      // await _analyticsService.logSignIn('signInWithGoogle');
      yield SignInState.success(user: user);
    } catch (exception) {
      await _authRepository.signOut();
      yield SignInState.failure(
        exceptionRaised: AppException.from(exception as Exception),
      );
    }
  }
}
