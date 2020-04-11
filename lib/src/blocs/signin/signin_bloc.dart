import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rxdart/rxdart.dart';
import 'package:starter_app/src/repositories/authentication_repository.dart';
import 'package:starter_app/src/utils/exceptions.dart';
import 'package:starter_app/src/utils/validators.dart';

part 'signin_bloc.freezed.dart';
part 'signin_event.dart';
part 'signin_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc({@required AuthenticationRepository authRepository})
      : _authRepository = authRepository;

  final AuthenticationRepository _authRepository;

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
          _mapSignInWithEmailAndPasswordPressedToState(
        email: email,
        password: password,
      ),
      googlePressed: () => _mapSignInWithGooglePressedToState(),
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
    // Check of password strength is not required; it was done during sign up.
    yield state.update(
      isEmailValid: state.isPasswordValid,
      isPasswordValid: password.isNotEmpty,
      user: state.user,
    );
  }

  Stream<SignInState> _mapSignInWithEmailAndPasswordPressedToState({
    String email,
    String password,
  }) async* {
    yield SignInState.signingIn();
    try {
      final FirebaseUser user = await _authRepository.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      yield SignInState.success(user: user);
    } catch (exception) {
      yield SignInState.failure(
        exceptionRaised: AppException.from(exception as Exception),
      );
    }
  }

  Stream<SignInState> _mapSignInWithGooglePressedToState() async* {
    try {
      final FirebaseUser user = await _authRepository.signInWithGoogle();
      yield SignInState.success(user: user);
    } catch (exception) {
      yield SignInState.failure(
        exceptionRaised: AppException.from(exception as Exception),
      );
    }
  }
}
