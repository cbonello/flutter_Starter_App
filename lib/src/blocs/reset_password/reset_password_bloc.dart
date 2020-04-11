import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rxdart/rxdart.dart';
import 'package:starter_app/src/repositories/authentication_repository.dart';
import 'package:starter_app/src/utils/exceptions.dart';
import 'package:starter_app/src/utils/validators.dart';

part 'reset_password_bloc.freezed.dart';
part 'reset_password_event.dart';
part 'reset_password_state.dart';

class ResetPasswordBloc extends Bloc<ResetPasswordEvent, ResetPasswordState> {
  ResetPasswordBloc({@required AuthenticationRepository authRepository})
      : _authRepository = authRepository;

  final AuthenticationRepository _authRepository;

  @override
  ResetPasswordState get initialState => ResetPasswordState.empty();

  @override
  Stream<ResetPasswordState> transformEvents(
    Stream<ResetPasswordEvent> events,
    Stream<ResetPasswordState> Function(ResetPasswordEvent event) next,
  ) {
    final Stream<ResetPasswordEvent> nonDebounceStream =
        events.where((ResetPasswordEvent event) => event is! _EmailChanged);
    final Stream<ResetPasswordEvent> debounceStream = events
        .where((ResetPasswordEvent event) => event is _EmailChanged)
        .debounceTime(const Duration(milliseconds: 300));
    return super.transformEvents(
      nonDebounceStream.mergeWith(<Stream<ResetPasswordEvent>>[debounceStream]),
      next,
    );
  }

  @override
  Stream<ResetPasswordState> mapEventToState(
    ResetPasswordEvent event,
  ) async* {
    yield* event.when(
      emailChanged: (String email) => _mapEmailChangedToState(email),
      resetPressed: (String email) => _mapResetPressedToState(email),
    );
  }

  Stream<ResetPasswordState> _mapEmailChangedToState(String email) async* {
    yield state.update(isEmailValid: isValidEmail(email), email: email);
  }

  Stream<ResetPasswordState> _mapResetPressedToState(String email) async* {
    yield ResetPasswordState.resetting();
    try {
      await _authRepository.sendPasswordResetEmail(email: email);
      yield ResetPasswordState.success(email: email);
    } catch (exception) {
      yield ResetPasswordState.failure(
        exceptionRaised: AppException.from(exception as Exception),
      );
    }
  }
}
