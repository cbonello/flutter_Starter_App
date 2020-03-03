import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';
import 'package:starter_app/src/repositories/authentication_repository.dart';
import 'package:starter_app/src/utils/exceptions.dart';
import 'package:starter_app/src/utils/validators.dart';

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
      return event is! EmailChangedSignInEvent && event is! PasswordChangedSignInEvent;
    });
    final Stream<SignInEvent> debounceStream = events.where((SignInEvent event) {
      return event is EmailChangedSignInEvent || event is PasswordChangedSignInEvent;
    }).debounceTime(const Duration(milliseconds: 300));
    return super.transformEvents(
      nonDebounceStream.mergeWith(<Stream<SignInEvent>>[debounceStream]),
      next,
    );
  }

  @override
  Stream<SignInState> mapEventToState(SignInEvent event) async* {
    if (event is EmailChangedSignInEvent) {
      yield* _mapEmailChangedToState(event.email);
    } else if (event is PasswordChangedSignInEvent) {
      yield* _mapPasswordChangedToState(event.password);
    } else if (event is GooglePressedSignInEvent) {
      yield* _mapSignInWithGooglePressedToState();
    } else if (event is EmailAndPasswordPressedSignInEvent) {
      yield* _mapSignInWithEmailAndPasswordPressedToState(
        email: event.email,
        password: event.password,
      );
    }
  }

  Stream<SignInState> _mapEmailChangedToState(String email) async* {
    yield state.update(isEmailValid: isValidEmail(email));
  }

  Stream<SignInState> _mapPasswordChangedToState(String password) async* {
    // Check of password strength is not required; it was done during sign up.
    yield state.update(isPasswordValid: password.isNotEmpty);
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
      yield SignInState.success(user);
    } catch (exception, stacktrace) {
      print(stacktrace);
      yield SignInState.failure(AppException.from(exception));
    }
  }

  Stream<SignInState> _mapSignInWithGooglePressedToState() async* {
    try {
      final FirebaseUser user = await _authRepository.signInWithGoogle();
      yield SignInState.success(user);
    } catch (exception, stacktrace) {
      print(stacktrace);
      yield SignInState.failure(AppException.from(exception));
    }
  }
}
