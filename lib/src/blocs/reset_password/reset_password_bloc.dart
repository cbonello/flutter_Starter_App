import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:starter_app/src/repositories/authentication_repository.dart';
import 'package:starter_app/src/utils/exceptions.dart';
import 'package:starter_app/src/utils/validators.dart';

part 'reset_password_event.dart';
part 'reset_password_state.dart';

class ResetPasswordBloc extends Bloc<ResetPasswordEvent, ResetPasswordState> {
  ResetPasswordBloc({@required AuthenticationRepository authRepository})
      : _authRepository = authRepository;

  final AuthenticationRepository _authRepository;

  @override
  ResetPasswordState get initialState => ResetPasswordState.empty();

  @override
  Stream<ResetPasswordState> mapEventToState(
    ResetPasswordEvent event,
  ) async* {
    if (event is EmailChangedResetPasswordEvent) {
      yield* _mapEmailChangedToState(event.email);
    } else if (event is ResetPressedResetPasswordEvent) {
      yield* _mapResetPressedToState(event.email);
    }
  }

  Stream<ResetPasswordState> _mapEmailChangedToState(String email) async* {
    yield state.update(isEmailValid: isValidEmail(email));
  }

  Stream<ResetPasswordState> _mapResetPressedToState(String email) async* {
    try {
      await _authRepository.resetPassword(email);
      yield ResetPasswordState.success(email);
    } catch (exception, stacktrace) {
      print(stacktrace);
      yield ResetPasswordState.failure(AppException.from(exception));
    }
  }
}
