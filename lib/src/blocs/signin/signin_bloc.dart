import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../repositories/repositories.dart';
import '../../services/services.dart';
import '../../utils/utils.dart';

part 'signin_bloc.freezed.dart';
part 'signin_event.dart';
part 'signin_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc({
    @required AuthenticationRepositoryInterface authRepository,
    @required AnalyticsService analyticsService,
  })  : assert(authRepository != null),
        _authRepository = authRepository,
        assert(analyticsService != null),
        _analyticsService = analyticsService,
        super(SignInState.empty());

  final AuthenticationRepositoryInterface _authRepository;
  final AnalyticsService _analyticsService;

  @override
  Stream<SignInState> mapEventToState(SignInEvent event) async* {
    yield* event.when(
      emailChanged: (String email) => _mapEmailChangedToState(email),
      passwordChanged: (String password) => _mapPasswordChangedToState(password),
      emailAndPasswordPressed: () => _mapSignInWithEmailAndPasswordToState(),
      googlePressed: () => _mapSignInWithGoogleToState(),
    );
  }

  Stream<SignInState> _mapEmailChangedToState(String email) async* {
    yield state.copyWith(email: email, user: null, exceptionRaised: null);
  }

  Stream<SignInState> _mapPasswordChangedToState(String password) async* {
    yield state.copyWith(password: password, user: null, exceptionRaised: null);
  }

  Stream<SignInState> _mapSignInWithEmailAndPasswordToState() async* {
    yield state.copyWith(isSubmitting: true);
    try {
      final FirebaseUser user = await _authRepository.signInWithEmailAndPassword(
        email: state.email,
        password: state.password,
      );
      await _analyticsService.logSignIn('signInWithEmailAndPassword');
      yield state.copyWith(isSubmitting: false, user: user);
    } catch (exception) {
      await _authRepository.signOut();
      yield state.copyWith(
        isSubmitting: false,
        user: null,
        exceptionRaised: AppException.from(exception as Exception),
      );
    }
  }

  Stream<SignInState> _mapSignInWithGoogleToState() async* {
    try {
      final FirebaseUser user = await _authRepository.signInWithGoogle();
      await _analyticsService.logSignIn('signInWithGoogle');
      yield state.copyWith(user: user);
    } catch (exception) {
      await _authRepository.signOut();
      yield state.copyWith(
        user: null,
        exceptionRaised: AppException.from(exception as Exception),
      );
    }
  }
}
