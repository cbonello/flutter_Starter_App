import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../repositories/repositories.dart';
import '../../utils/utils.dart';

part 'signup_bloc.freezed.dart';
part 'signup_event.dart';
part 'signup_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc({@required AuthenticationRepositoryInterface authRepository})
      : assert(authRepository != null),
        _authRepository = authRepository,
        super(SignUpState.empty());

  final AuthenticationRepositoryInterface _authRepository;

  @override
  Stream<SignUpState> mapEventToState(
    SignUpEvent event,
  ) async* {
    yield* event.when(
      emailChanged: (String email) => _mapEmailChangedToState(email),
      passwordChanged: (String password) => _mapPasswordChangedToState(password),
      tosChanged: (bool tos) => _mapToSChangedToState(tos),
      submitted: () => _mapFormSubmittedToState(),
    );
  }

  Stream<SignUpState> _mapEmailChangedToState(String email) async* {
    yield state.copyWith(
      email: email,
      isVerificationEmailSent: false,
      exceptionRaised: null,
    );
  }

  Stream<SignUpState> _mapPasswordChangedToState(String password) async* {
    yield state.copyWith(
      password: password,
      isVerificationEmailSent: false,
      exceptionRaised: null,
    );
  }

  Stream<SignUpState> _mapToSChangedToState(bool tos) async* {
    yield state.copyWith(
      tosAccepted: tos,
      isVerificationEmailSent: false,
      exceptionRaised: null,
    );
  }

  Stream<SignUpState> _mapFormSubmittedToState() async* {
    yield state.copyWith(isSubmitting: true);
    try {
      await _authRepository.signUp(email: state.email, password: state.password);
      yield state.copyWith(isSubmitting: false, isVerificationEmailSent: true);
    } catch (exception) {
      yield state.copyWith(
        isSubmitting: false,
        isVerificationEmailSent: false,
        exceptionRaised: AppException.from(exception as Exception),
      );
    }
  }
}
