import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../repositories/repositories.dart';
import '../../utils/utils.dart';

part 'reset_password_bloc.freezed.dart';
part 'reset_password_event.dart';
part 'reset_password_state.dart';

class ResetPasswordBloc extends Bloc<ResetPasswordEvent, ResetPasswordState> {
  ResetPasswordBloc({@required AuthenticationRepositoryInterface authRepository})
      : assert(authRepository != null),
        _authRepository = authRepository,
        super(ResetPasswordState.empty());

  final AuthenticationRepositoryInterface _authRepository;

  @override
  Stream<ResetPasswordState> mapEventToState(
    ResetPasswordEvent event,
  ) async* {
    yield* event.when(
      emailChanged: (String email) => _mapEmailChangedToState(email),
      resetPressed: () => _mapResetPressedToState(),
    );
  }

  Stream<ResetPasswordState> _mapEmailChangedToState(String email) async* {
    yield state.copyWith(email: email, exceptionRaised: null);
  }

  Stream<ResetPasswordState> _mapResetPressedToState() async* {
    yield state.copyWith(isSubmitting: true);
    try {
      await _authRepository.sendPasswordResetEmail(email: state.email);
      yield state.copyWith(isSubmitting: false, isResetEmailSent: true);
    } catch (exception) {
      yield state.copyWith(
        isSubmitting: false,
        isResetEmailSent: false,
        exceptionRaised: AppException.from(exception as Exception),
      );
    }
  }
}
