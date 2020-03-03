import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';
import 'package:starter_app/src/repositories/authentication_repository.dart';
import 'package:starter_app/src/utils/exceptions.dart';
import 'package:starter_app/src/utils/validators.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc({@required AuthenticationRepository authRepository})
      : _authRepository = authRepository;

  final AuthenticationRepository _authRepository;

  @override
  SignUpState get initialState => SignUpState.empty();

  @override
  Stream<SignUpState> transformEvents(
    Stream<SignUpEvent> events,
    Stream<SignUpState> Function(SignUpEvent event) next,
  ) {
    final Stream<SignUpEvent> observableStream = events;

    final Stream<SignUpEvent> nonDebounceStream =
        observableStream.where((SignUpEvent event) {
      return event is! EmailChangedSignUpEvent && event is! PasswordChangedSignUpEvent;
    });
    final Stream<SignUpEvent> debounceStream =
        observableStream.where((SignUpEvent event) {
      return event is EmailChangedSignUpEvent || event is PasswordChangedSignUpEvent;
    }).debounceTime(const Duration(milliseconds: 300));
    return super.transformEvents(
      nonDebounceStream.mergeWith(<Stream<SignUpEvent>>[debounceStream]),
      next,
    );
  }

  @override
  Stream<SignUpState> mapEventToState(
    SignUpEvent event,
  ) async* {
    if (event is EmailChangedSignUpEvent) {
      yield* _mapEmailChangedToState(event.email);
    } else if (event is PasswordChangedSignUpEvent) {
      yield* _mapPasswordChangedToState(event.password);
    } else if (event is TOSPrivacyChangedSignUpEvent) {
      yield* _mapTOSPrivacyChangedToState(event.tosPrivacyAccepted);
    } else if (event is SubmittedSignUpEvent) {
      yield* _mapFormSubmittedToState(event.email, event.password);
    }
  }

  Stream<SignUpState> _mapEmailChangedToState(String email) async* {
    yield state.update(
      isEmailValid: isValidEmail(email),
    );
  }

  Stream<SignUpState> _mapPasswordChangedToState(String password) async* {
    yield state.update(
      isPasswordValid: isValidPassword(password),
    );
  }

  Stream<SignUpState> _mapTOSPrivacyChangedToState(bool tosPrivacyAccepted) async* {
    yield state.update(
      isTOSPrivacyAccepted: tosPrivacyAccepted,
    );
  }

  Stream<SignUpState> _mapFormSubmittedToState(
    String email,
    String password,
  ) async* {
    yield SignUpState.loading();
    try {
      final FirebaseUser user = await _authRepository.signUp(
        email: email,
        password: password,
      );
      yield SignUpState.success(user);
    } catch (exception, stacktrace) {
      print(stacktrace);
      yield SignUpState.failure(AppException.from(exception));
    }
  }
}
