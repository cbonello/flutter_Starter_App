// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'signin_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$SignInEventTearOff {
  const _$SignInEventTearOff();

  _EmailChanged emailChanged({@required String email}) {
    return _EmailChanged(
      email: email,
    );
  }

  _PasswordChanged passwordChanged({@required String password}) {
    return _PasswordChanged(
      password: password,
    );
  }

  _EmailAndPasswordPressed emailAndPasswordPressed(
      {@required String email, @required String password}) {
    return _EmailAndPasswordPressed(
      email: email,
      password: password,
    );
  }

  _GooglePressed googlePressed() {
    return const _GooglePressed();
  }
}

// ignore: unused_element
const $SignInEvent = _$SignInEventTearOff();

mixin _$SignInEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result emailChanged(@required String email),
    @required Result passwordChanged(@required String password),
    @required
        Result emailAndPasswordPressed(
            @required String email, @required String password),
    @required Result googlePressed(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result emailChanged(@required String email),
    Result passwordChanged(@required String password),
    Result emailAndPasswordPressed(
        @required String email, @required String password),
    Result googlePressed(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result emailChanged(_EmailChanged value),
    @required Result passwordChanged(_PasswordChanged value),
    @required Result emailAndPasswordPressed(_EmailAndPasswordPressed value),
    @required Result googlePressed(_GooglePressed value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result emailChanged(_EmailChanged value),
    Result passwordChanged(_PasswordChanged value),
    Result emailAndPasswordPressed(_EmailAndPasswordPressed value),
    Result googlePressed(_GooglePressed value),
    @required Result orElse(),
  });
}

abstract class $SignInEventCopyWith<$Res> {
  factory $SignInEventCopyWith(
          SignInEvent value, $Res Function(SignInEvent) then) =
      _$SignInEventCopyWithImpl<$Res>;
}

class _$SignInEventCopyWithImpl<$Res> implements $SignInEventCopyWith<$Res> {
  _$SignInEventCopyWithImpl(this._value, this._then);

  final SignInEvent _value;
  // ignore: unused_field
  final $Res Function(SignInEvent) _then;
}

abstract class _$EmailChangedCopyWith<$Res> {
  factory _$EmailChangedCopyWith(
          _EmailChanged value, $Res Function(_EmailChanged) then) =
      __$EmailChangedCopyWithImpl<$Res>;
  $Res call({String email});
}

class __$EmailChangedCopyWithImpl<$Res> extends _$SignInEventCopyWithImpl<$Res>
    implements _$EmailChangedCopyWith<$Res> {
  __$EmailChangedCopyWithImpl(
      _EmailChanged _value, $Res Function(_EmailChanged) _then)
      : super(_value, (v) => _then(v as _EmailChanged));

  @override
  _EmailChanged get _value => super._value as _EmailChanged;

  @override
  $Res call({
    Object email = freezed,
  }) {
    return _then(_EmailChanged(
      email: email == freezed ? _value.email : email as String,
    ));
  }
}

class _$_EmailChanged with DiagnosticableTreeMixin implements _EmailChanged {
  const _$_EmailChanged({@required this.email}) : assert(email != null);

  @override
  final String email;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SignInEvent.emailChanged(email: $email)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SignInEvent.emailChanged'))
      ..add(DiagnosticsProperty('email', email));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _EmailChanged &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(email);

  @override
  _$EmailChangedCopyWith<_EmailChanged> get copyWith =>
      __$EmailChangedCopyWithImpl<_EmailChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result emailChanged(@required String email),
    @required Result passwordChanged(@required String password),
    @required
        Result emailAndPasswordPressed(
            @required String email, @required String password),
    @required Result googlePressed(),
  }) {
    assert(emailChanged != null);
    assert(passwordChanged != null);
    assert(emailAndPasswordPressed != null);
    assert(googlePressed != null);
    return emailChanged(email);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result emailChanged(@required String email),
    Result passwordChanged(@required String password),
    Result emailAndPasswordPressed(
        @required String email, @required String password),
    Result googlePressed(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (emailChanged != null) {
      return emailChanged(email);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result emailChanged(_EmailChanged value),
    @required Result passwordChanged(_PasswordChanged value),
    @required Result emailAndPasswordPressed(_EmailAndPasswordPressed value),
    @required Result googlePressed(_GooglePressed value),
  }) {
    assert(emailChanged != null);
    assert(passwordChanged != null);
    assert(emailAndPasswordPressed != null);
    assert(googlePressed != null);
    return emailChanged(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result emailChanged(_EmailChanged value),
    Result passwordChanged(_PasswordChanged value),
    Result emailAndPasswordPressed(_EmailAndPasswordPressed value),
    Result googlePressed(_GooglePressed value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (emailChanged != null) {
      return emailChanged(this);
    }
    return orElse();
  }
}

abstract class _EmailChanged implements SignInEvent {
  const factory _EmailChanged({@required String email}) = _$_EmailChanged;

  String get email;
  _$EmailChangedCopyWith<_EmailChanged> get copyWith;
}

abstract class _$PasswordChangedCopyWith<$Res> {
  factory _$PasswordChangedCopyWith(
          _PasswordChanged value, $Res Function(_PasswordChanged) then) =
      __$PasswordChangedCopyWithImpl<$Res>;
  $Res call({String password});
}

class __$PasswordChangedCopyWithImpl<$Res>
    extends _$SignInEventCopyWithImpl<$Res>
    implements _$PasswordChangedCopyWith<$Res> {
  __$PasswordChangedCopyWithImpl(
      _PasswordChanged _value, $Res Function(_PasswordChanged) _then)
      : super(_value, (v) => _then(v as _PasswordChanged));

  @override
  _PasswordChanged get _value => super._value as _PasswordChanged;

  @override
  $Res call({
    Object password = freezed,
  }) {
    return _then(_PasswordChanged(
      password: password == freezed ? _value.password : password as String,
    ));
  }
}

class _$_PasswordChanged
    with DiagnosticableTreeMixin
    implements _PasswordChanged {
  const _$_PasswordChanged({@required this.password})
      : assert(password != null);

  @override
  final String password;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SignInEvent.passwordChanged(password: $password)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SignInEvent.passwordChanged'))
      ..add(DiagnosticsProperty('password', password));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PasswordChanged &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(password);

  @override
  _$PasswordChangedCopyWith<_PasswordChanged> get copyWith =>
      __$PasswordChangedCopyWithImpl<_PasswordChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result emailChanged(@required String email),
    @required Result passwordChanged(@required String password),
    @required
        Result emailAndPasswordPressed(
            @required String email, @required String password),
    @required Result googlePressed(),
  }) {
    assert(emailChanged != null);
    assert(passwordChanged != null);
    assert(emailAndPasswordPressed != null);
    assert(googlePressed != null);
    return passwordChanged(password);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result emailChanged(@required String email),
    Result passwordChanged(@required String password),
    Result emailAndPasswordPressed(
        @required String email, @required String password),
    Result googlePressed(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (passwordChanged != null) {
      return passwordChanged(password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result emailChanged(_EmailChanged value),
    @required Result passwordChanged(_PasswordChanged value),
    @required Result emailAndPasswordPressed(_EmailAndPasswordPressed value),
    @required Result googlePressed(_GooglePressed value),
  }) {
    assert(emailChanged != null);
    assert(passwordChanged != null);
    assert(emailAndPasswordPressed != null);
    assert(googlePressed != null);
    return passwordChanged(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result emailChanged(_EmailChanged value),
    Result passwordChanged(_PasswordChanged value),
    Result emailAndPasswordPressed(_EmailAndPasswordPressed value),
    Result googlePressed(_GooglePressed value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (passwordChanged != null) {
      return passwordChanged(this);
    }
    return orElse();
  }
}

abstract class _PasswordChanged implements SignInEvent {
  const factory _PasswordChanged({@required String password}) =
      _$_PasswordChanged;

  String get password;
  _$PasswordChangedCopyWith<_PasswordChanged> get copyWith;
}

abstract class _$EmailAndPasswordPressedCopyWith<$Res> {
  factory _$EmailAndPasswordPressedCopyWith(_EmailAndPasswordPressed value,
          $Res Function(_EmailAndPasswordPressed) then) =
      __$EmailAndPasswordPressedCopyWithImpl<$Res>;
  $Res call({String email, String password});
}

class __$EmailAndPasswordPressedCopyWithImpl<$Res>
    extends _$SignInEventCopyWithImpl<$Res>
    implements _$EmailAndPasswordPressedCopyWith<$Res> {
  __$EmailAndPasswordPressedCopyWithImpl(_EmailAndPasswordPressed _value,
      $Res Function(_EmailAndPasswordPressed) _then)
      : super(_value, (v) => _then(v as _EmailAndPasswordPressed));

  @override
  _EmailAndPasswordPressed get _value =>
      super._value as _EmailAndPasswordPressed;

  @override
  $Res call({
    Object email = freezed,
    Object password = freezed,
  }) {
    return _then(_EmailAndPasswordPressed(
      email: email == freezed ? _value.email : email as String,
      password: password == freezed ? _value.password : password as String,
    ));
  }
}

class _$_EmailAndPasswordPressed
    with DiagnosticableTreeMixin
    implements _EmailAndPasswordPressed {
  const _$_EmailAndPasswordPressed(
      {@required this.email, @required this.password})
      : assert(email != null),
        assert(password != null);

  @override
  final String email;
  @override
  final String password;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SignInEvent.emailAndPasswordPressed(email: $email, password: $password)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SignInEvent.emailAndPasswordPressed'))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('password', password));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _EmailAndPasswordPressed &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(password);

  @override
  _$EmailAndPasswordPressedCopyWith<_EmailAndPasswordPressed> get copyWith =>
      __$EmailAndPasswordPressedCopyWithImpl<_EmailAndPasswordPressed>(
          this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result emailChanged(@required String email),
    @required Result passwordChanged(@required String password),
    @required
        Result emailAndPasswordPressed(
            @required String email, @required String password),
    @required Result googlePressed(),
  }) {
    assert(emailChanged != null);
    assert(passwordChanged != null);
    assert(emailAndPasswordPressed != null);
    assert(googlePressed != null);
    return emailAndPasswordPressed(email, password);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result emailChanged(@required String email),
    Result passwordChanged(@required String password),
    Result emailAndPasswordPressed(
        @required String email, @required String password),
    Result googlePressed(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (emailAndPasswordPressed != null) {
      return emailAndPasswordPressed(email, password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result emailChanged(_EmailChanged value),
    @required Result passwordChanged(_PasswordChanged value),
    @required Result emailAndPasswordPressed(_EmailAndPasswordPressed value),
    @required Result googlePressed(_GooglePressed value),
  }) {
    assert(emailChanged != null);
    assert(passwordChanged != null);
    assert(emailAndPasswordPressed != null);
    assert(googlePressed != null);
    return emailAndPasswordPressed(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result emailChanged(_EmailChanged value),
    Result passwordChanged(_PasswordChanged value),
    Result emailAndPasswordPressed(_EmailAndPasswordPressed value),
    Result googlePressed(_GooglePressed value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (emailAndPasswordPressed != null) {
      return emailAndPasswordPressed(this);
    }
    return orElse();
  }
}

abstract class _EmailAndPasswordPressed implements SignInEvent {
  const factory _EmailAndPasswordPressed(
      {@required String email,
      @required String password}) = _$_EmailAndPasswordPressed;

  String get email;
  String get password;
  _$EmailAndPasswordPressedCopyWith<_EmailAndPasswordPressed> get copyWith;
}

abstract class _$GooglePressedCopyWith<$Res> {
  factory _$GooglePressedCopyWith(
          _GooglePressed value, $Res Function(_GooglePressed) then) =
      __$GooglePressedCopyWithImpl<$Res>;
}

class __$GooglePressedCopyWithImpl<$Res> extends _$SignInEventCopyWithImpl<$Res>
    implements _$GooglePressedCopyWith<$Res> {
  __$GooglePressedCopyWithImpl(
      _GooglePressed _value, $Res Function(_GooglePressed) _then)
      : super(_value, (v) => _then(v as _GooglePressed));

  @override
  _GooglePressed get _value => super._value as _GooglePressed;
}

class _$_GooglePressed with DiagnosticableTreeMixin implements _GooglePressed {
  const _$_GooglePressed();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SignInEvent.googlePressed()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'SignInEvent.googlePressed'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _GooglePressed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result emailChanged(@required String email),
    @required Result passwordChanged(@required String password),
    @required
        Result emailAndPasswordPressed(
            @required String email, @required String password),
    @required Result googlePressed(),
  }) {
    assert(emailChanged != null);
    assert(passwordChanged != null);
    assert(emailAndPasswordPressed != null);
    assert(googlePressed != null);
    return googlePressed();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result emailChanged(@required String email),
    Result passwordChanged(@required String password),
    Result emailAndPasswordPressed(
        @required String email, @required String password),
    Result googlePressed(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (googlePressed != null) {
      return googlePressed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result emailChanged(_EmailChanged value),
    @required Result passwordChanged(_PasswordChanged value),
    @required Result emailAndPasswordPressed(_EmailAndPasswordPressed value),
    @required Result googlePressed(_GooglePressed value),
  }) {
    assert(emailChanged != null);
    assert(passwordChanged != null);
    assert(emailAndPasswordPressed != null);
    assert(googlePressed != null);
    return googlePressed(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result emailChanged(_EmailChanged value),
    Result passwordChanged(_PasswordChanged value),
    Result emailAndPasswordPressed(_EmailAndPasswordPressed value),
    Result googlePressed(_GooglePressed value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (googlePressed != null) {
      return googlePressed(this);
    }
    return orElse();
  }
}

abstract class _GooglePressed implements SignInEvent {
  const factory _GooglePressed() = _$_GooglePressed;
}

class _$SignInStateTearOff {
  const _$SignInStateTearOff();

  _Empty empty(
      {bool isEmailValid = true,
      bool isPasswordValid = true,
      bool isSubmitting = false,
      bool isSuccess = false,
      @nullable FirebaseUser user,
      @nullable AppException exceptionRaised}) {
    return _Empty(
      isEmailValid: isEmailValid,
      isPasswordValid: isPasswordValid,
      isSubmitting: isSubmitting,
      isSuccess: isSuccess,
      user: user,
      exceptionRaised: exceptionRaised,
    );
  }

  _SigningIn signingIn(
      {bool isEmailValid = true,
      bool isPasswordValid = true,
      bool isSubmitting = true,
      bool isSuccess = false,
      @nullable FirebaseUser user,
      @nullable AppException exceptionRaised}) {
    return _SigningIn(
      isEmailValid: isEmailValid,
      isPasswordValid: isPasswordValid,
      isSubmitting: isSubmitting,
      isSuccess: isSuccess,
      user: user,
      exceptionRaised: exceptionRaised,
    );
  }

  _Failure failure(
      {bool isEmailValid = true,
      bool isPasswordValid = true,
      bool isSubmitting = false,
      bool isSuccess = false,
      @nullable FirebaseUser user,
      @required AppException exceptionRaised}) {
    return _Failure(
      isEmailValid: isEmailValid,
      isPasswordValid: isPasswordValid,
      isSubmitting: isSubmitting,
      isSuccess: isSuccess,
      user: user,
      exceptionRaised: exceptionRaised,
    );
  }

  _Success success(
      {bool isEmailValid = true,
      bool isPasswordValid = true,
      bool isSubmitting = false,
      bool isSuccess = true,
      @required FirebaseUser user,
      @nullable AppException exceptionRaised}) {
    return _Success(
      isEmailValid: isEmailValid,
      isPasswordValid: isPasswordValid,
      isSubmitting: isSubmitting,
      isSuccess: isSuccess,
      user: user,
      exceptionRaised: exceptionRaised,
    );
  }
}

// ignore: unused_element
const $SignInState = _$SignInStateTearOff();

mixin _$SignInState {
  bool get isEmailValid;
  bool get isPasswordValid;
  bool get isSubmitting;
  bool get isSuccess;
  @nullable
  FirebaseUser get user;
  @nullable
  AppException get exceptionRaised;

  @optionalTypeArgs
  Result when<Result extends Object>({
    @required
        Result empty(
            bool isEmailValid,
            bool isPasswordValid,
            bool isSubmitting,
            bool isSuccess,
            @nullable FirebaseUser user,
            @nullable AppException exceptionRaised),
    @required
        Result signingIn(
            bool isEmailValid,
            bool isPasswordValid,
            bool isSubmitting,
            bool isSuccess,
            @nullable FirebaseUser user,
            @nullable AppException exceptionRaised),
    @required
        Result failure(
            bool isEmailValid,
            bool isPasswordValid,
            bool isSubmitting,
            bool isSuccess,
            @nullable FirebaseUser user,
            @required AppException exceptionRaised),
    @required
        Result success(
            bool isEmailValid,
            bool isPasswordValid,
            bool isSubmitting,
            bool isSuccess,
            @required FirebaseUser user,
            @nullable AppException exceptionRaised),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result empty(
        bool isEmailValid,
        bool isPasswordValid,
        bool isSubmitting,
        bool isSuccess,
        @nullable FirebaseUser user,
        @nullable AppException exceptionRaised),
    Result signingIn(
        bool isEmailValid,
        bool isPasswordValid,
        bool isSubmitting,
        bool isSuccess,
        @nullable FirebaseUser user,
        @nullable AppException exceptionRaised),
    Result failure(
        bool isEmailValid,
        bool isPasswordValid,
        bool isSubmitting,
        bool isSuccess,
        @nullable FirebaseUser user,
        @required AppException exceptionRaised),
    Result success(
        bool isEmailValid,
        bool isPasswordValid,
        bool isSubmitting,
        bool isSuccess,
        @required FirebaseUser user,
        @nullable AppException exceptionRaised),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result empty(_Empty value),
    @required Result signingIn(_SigningIn value),
    @required Result failure(_Failure value),
    @required Result success(_Success value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result empty(_Empty value),
    Result signingIn(_SigningIn value),
    Result failure(_Failure value),
    Result success(_Success value),
    @required Result orElse(),
  });

  $SignInStateCopyWith<SignInState> get copyWith;
}

abstract class $SignInStateCopyWith<$Res> {
  factory $SignInStateCopyWith(
          SignInState value, $Res Function(SignInState) then) =
      _$SignInStateCopyWithImpl<$Res>;
  $Res call(
      {bool isEmailValid,
      bool isPasswordValid,
      bool isSubmitting,
      bool isSuccess,
      @nullable FirebaseUser user,
      @nullable AppException exceptionRaised});
}

class _$SignInStateCopyWithImpl<$Res> implements $SignInStateCopyWith<$Res> {
  _$SignInStateCopyWithImpl(this._value, this._then);

  final SignInState _value;
  // ignore: unused_field
  final $Res Function(SignInState) _then;

  @override
  $Res call({
    Object isEmailValid = freezed,
    Object isPasswordValid = freezed,
    Object isSubmitting = freezed,
    Object isSuccess = freezed,
    Object user = freezed,
    Object exceptionRaised = freezed,
  }) {
    return _then(_value.copyWith(
      isEmailValid:
          isEmailValid == freezed ? _value.isEmailValid : isEmailValid as bool,
      isPasswordValid: isPasswordValid == freezed
          ? _value.isPasswordValid
          : isPasswordValid as bool,
      isSubmitting:
          isSubmitting == freezed ? _value.isSubmitting : isSubmitting as bool,
      isSuccess: isSuccess == freezed ? _value.isSuccess : isSuccess as bool,
      user: user == freezed ? _value.user : user as FirebaseUser,
      exceptionRaised: exceptionRaised == freezed
          ? _value.exceptionRaised
          : exceptionRaised as AppException,
    ));
  }
}

abstract class _$EmptyCopyWith<$Res> implements $SignInStateCopyWith<$Res> {
  factory _$EmptyCopyWith(_Empty value, $Res Function(_Empty) then) =
      __$EmptyCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isEmailValid,
      bool isPasswordValid,
      bool isSubmitting,
      bool isSuccess,
      @nullable FirebaseUser user,
      @nullable AppException exceptionRaised});
}

class __$EmptyCopyWithImpl<$Res> extends _$SignInStateCopyWithImpl<$Res>
    implements _$EmptyCopyWith<$Res> {
  __$EmptyCopyWithImpl(_Empty _value, $Res Function(_Empty) _then)
      : super(_value, (v) => _then(v as _Empty));

  @override
  _Empty get _value => super._value as _Empty;

  @override
  $Res call({
    Object isEmailValid = freezed,
    Object isPasswordValid = freezed,
    Object isSubmitting = freezed,
    Object isSuccess = freezed,
    Object user = freezed,
    Object exceptionRaised = freezed,
  }) {
    return _then(_Empty(
      isEmailValid:
          isEmailValid == freezed ? _value.isEmailValid : isEmailValid as bool,
      isPasswordValid: isPasswordValid == freezed
          ? _value.isPasswordValid
          : isPasswordValid as bool,
      isSubmitting:
          isSubmitting == freezed ? _value.isSubmitting : isSubmitting as bool,
      isSuccess: isSuccess == freezed ? _value.isSuccess : isSuccess as bool,
      user: user == freezed ? _value.user : user as FirebaseUser,
      exceptionRaised: exceptionRaised == freezed
          ? _value.exceptionRaised
          : exceptionRaised as AppException,
    ));
  }
}

class _$_Empty extends _Empty with DiagnosticableTreeMixin {
  _$_Empty(
      {this.isEmailValid = true,
      this.isPasswordValid = true,
      this.isSubmitting = false,
      this.isSuccess = false,
      @nullable this.user,
      @nullable this.exceptionRaised})
      : assert(isEmailValid != null),
        assert(isPasswordValid != null),
        assert(isSubmitting != null),
        assert(isSuccess != null),
        super._();

  @JsonKey(defaultValue: true)
  @override
  final bool isEmailValid;
  @JsonKey(defaultValue: true)
  @override
  final bool isPasswordValid;
  @JsonKey(defaultValue: false)
  @override
  final bool isSubmitting;
  @JsonKey(defaultValue: false)
  @override
  final bool isSuccess;
  @override
  @nullable
  final FirebaseUser user;
  @override
  @nullable
  final AppException exceptionRaised;

  bool _didisFormValid = false;
  bool _isFormValid;

  @override
  bool get isFormValid {
    if (_didisFormValid == false) {
      _didisFormValid = true;
      _isFormValid = isEmailValid && isPasswordValid;
    }
    return _isFormValid;
  }

  bool _didisFailure = false;
  bool _isFailure;

  @override
  bool get isFailure {
    if (_didisFailure == false) {
      _didisFailure = true;
      _isFailure = exceptionRaised != null;
    }
    return _isFailure;
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SignInState.empty(isEmailValid: $isEmailValid, isPasswordValid: $isPasswordValid, isSubmitting: $isSubmitting, isSuccess: $isSuccess, user: $user, exceptionRaised: $exceptionRaised, isFormValid: $isFormValid, isFailure: $isFailure)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SignInState.empty'))
      ..add(DiagnosticsProperty('isEmailValid', isEmailValid))
      ..add(DiagnosticsProperty('isPasswordValid', isPasswordValid))
      ..add(DiagnosticsProperty('isSubmitting', isSubmitting))
      ..add(DiagnosticsProperty('isSuccess', isSuccess))
      ..add(DiagnosticsProperty('user', user))
      ..add(DiagnosticsProperty('exceptionRaised', exceptionRaised))
      ..add(DiagnosticsProperty('isFormValid', isFormValid))
      ..add(DiagnosticsProperty('isFailure', isFailure));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Empty &&
            (identical(other.isEmailValid, isEmailValid) ||
                const DeepCollectionEquality()
                    .equals(other.isEmailValid, isEmailValid)) &&
            (identical(other.isPasswordValid, isPasswordValid) ||
                const DeepCollectionEquality()
                    .equals(other.isPasswordValid, isPasswordValid)) &&
            (identical(other.isSubmitting, isSubmitting) ||
                const DeepCollectionEquality()
                    .equals(other.isSubmitting, isSubmitting)) &&
            (identical(other.isSuccess, isSuccess) ||
                const DeepCollectionEquality()
                    .equals(other.isSuccess, isSuccess)) &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)) &&
            (identical(other.exceptionRaised, exceptionRaised) ||
                const DeepCollectionEquality()
                    .equals(other.exceptionRaised, exceptionRaised)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(isEmailValid) ^
      const DeepCollectionEquality().hash(isPasswordValid) ^
      const DeepCollectionEquality().hash(isSubmitting) ^
      const DeepCollectionEquality().hash(isSuccess) ^
      const DeepCollectionEquality().hash(user) ^
      const DeepCollectionEquality().hash(exceptionRaised);

  @override
  _$EmptyCopyWith<_Empty> get copyWith =>
      __$EmptyCopyWithImpl<_Empty>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required
        Result empty(
            bool isEmailValid,
            bool isPasswordValid,
            bool isSubmitting,
            bool isSuccess,
            @nullable FirebaseUser user,
            @nullable AppException exceptionRaised),
    @required
        Result signingIn(
            bool isEmailValid,
            bool isPasswordValid,
            bool isSubmitting,
            bool isSuccess,
            @nullable FirebaseUser user,
            @nullable AppException exceptionRaised),
    @required
        Result failure(
            bool isEmailValid,
            bool isPasswordValid,
            bool isSubmitting,
            bool isSuccess,
            @nullable FirebaseUser user,
            @required AppException exceptionRaised),
    @required
        Result success(
            bool isEmailValid,
            bool isPasswordValid,
            bool isSubmitting,
            bool isSuccess,
            @required FirebaseUser user,
            @nullable AppException exceptionRaised),
  }) {
    assert(empty != null);
    assert(signingIn != null);
    assert(failure != null);
    assert(success != null);
    return empty(isEmailValid, isPasswordValid, isSubmitting, isSuccess, user,
        exceptionRaised);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result empty(
        bool isEmailValid,
        bool isPasswordValid,
        bool isSubmitting,
        bool isSuccess,
        @nullable FirebaseUser user,
        @nullable AppException exceptionRaised),
    Result signingIn(
        bool isEmailValid,
        bool isPasswordValid,
        bool isSubmitting,
        bool isSuccess,
        @nullable FirebaseUser user,
        @nullable AppException exceptionRaised),
    Result failure(
        bool isEmailValid,
        bool isPasswordValid,
        bool isSubmitting,
        bool isSuccess,
        @nullable FirebaseUser user,
        @required AppException exceptionRaised),
    Result success(
        bool isEmailValid,
        bool isPasswordValid,
        bool isSubmitting,
        bool isSuccess,
        @required FirebaseUser user,
        @nullable AppException exceptionRaised),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (empty != null) {
      return empty(isEmailValid, isPasswordValid, isSubmitting, isSuccess, user,
          exceptionRaised);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result empty(_Empty value),
    @required Result signingIn(_SigningIn value),
    @required Result failure(_Failure value),
    @required Result success(_Success value),
  }) {
    assert(empty != null);
    assert(signingIn != null);
    assert(failure != null);
    assert(success != null);
    return empty(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result empty(_Empty value),
    Result signingIn(_SigningIn value),
    Result failure(_Failure value),
    Result success(_Success value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class _Empty extends SignInState {
  _Empty._() : super._();
  factory _Empty(
      {bool isEmailValid,
      bool isPasswordValid,
      bool isSubmitting,
      bool isSuccess,
      @nullable FirebaseUser user,
      @nullable AppException exceptionRaised}) = _$_Empty;

  @override
  bool get isEmailValid;
  @override
  bool get isPasswordValid;
  @override
  bool get isSubmitting;
  @override
  bool get isSuccess;
  @override
  @nullable
  FirebaseUser get user;
  @override
  @nullable
  AppException get exceptionRaised;
  @override
  _$EmptyCopyWith<_Empty> get copyWith;
}

abstract class _$SigningInCopyWith<$Res> implements $SignInStateCopyWith<$Res> {
  factory _$SigningInCopyWith(
          _SigningIn value, $Res Function(_SigningIn) then) =
      __$SigningInCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isEmailValid,
      bool isPasswordValid,
      bool isSubmitting,
      bool isSuccess,
      @nullable FirebaseUser user,
      @nullable AppException exceptionRaised});
}

class __$SigningInCopyWithImpl<$Res> extends _$SignInStateCopyWithImpl<$Res>
    implements _$SigningInCopyWith<$Res> {
  __$SigningInCopyWithImpl(_SigningIn _value, $Res Function(_SigningIn) _then)
      : super(_value, (v) => _then(v as _SigningIn));

  @override
  _SigningIn get _value => super._value as _SigningIn;

  @override
  $Res call({
    Object isEmailValid = freezed,
    Object isPasswordValid = freezed,
    Object isSubmitting = freezed,
    Object isSuccess = freezed,
    Object user = freezed,
    Object exceptionRaised = freezed,
  }) {
    return _then(_SigningIn(
      isEmailValid:
          isEmailValid == freezed ? _value.isEmailValid : isEmailValid as bool,
      isPasswordValid: isPasswordValid == freezed
          ? _value.isPasswordValid
          : isPasswordValid as bool,
      isSubmitting:
          isSubmitting == freezed ? _value.isSubmitting : isSubmitting as bool,
      isSuccess: isSuccess == freezed ? _value.isSuccess : isSuccess as bool,
      user: user == freezed ? _value.user : user as FirebaseUser,
      exceptionRaised: exceptionRaised == freezed
          ? _value.exceptionRaised
          : exceptionRaised as AppException,
    ));
  }
}

class _$_SigningIn extends _SigningIn with DiagnosticableTreeMixin {
  _$_SigningIn(
      {this.isEmailValid = true,
      this.isPasswordValid = true,
      this.isSubmitting = true,
      this.isSuccess = false,
      @nullable this.user,
      @nullable this.exceptionRaised})
      : assert(isEmailValid != null),
        assert(isPasswordValid != null),
        assert(isSubmitting != null),
        assert(isSuccess != null),
        super._();

  @JsonKey(defaultValue: true)
  @override
  final bool isEmailValid;
  @JsonKey(defaultValue: true)
  @override
  final bool isPasswordValid;
  @JsonKey(defaultValue: true)
  @override
  final bool isSubmitting;
  @JsonKey(defaultValue: false)
  @override
  final bool isSuccess;
  @override
  @nullable
  final FirebaseUser user;
  @override
  @nullable
  final AppException exceptionRaised;

  bool _didisFormValid = false;
  bool _isFormValid;

  @override
  bool get isFormValid {
    if (_didisFormValid == false) {
      _didisFormValid = true;
      _isFormValid = isEmailValid && isPasswordValid;
    }
    return _isFormValid;
  }

  bool _didisFailure = false;
  bool _isFailure;

  @override
  bool get isFailure {
    if (_didisFailure == false) {
      _didisFailure = true;
      _isFailure = exceptionRaised != null;
    }
    return _isFailure;
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SignInState.signingIn(isEmailValid: $isEmailValid, isPasswordValid: $isPasswordValid, isSubmitting: $isSubmitting, isSuccess: $isSuccess, user: $user, exceptionRaised: $exceptionRaised, isFormValid: $isFormValid, isFailure: $isFailure)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SignInState.signingIn'))
      ..add(DiagnosticsProperty('isEmailValid', isEmailValid))
      ..add(DiagnosticsProperty('isPasswordValid', isPasswordValid))
      ..add(DiagnosticsProperty('isSubmitting', isSubmitting))
      ..add(DiagnosticsProperty('isSuccess', isSuccess))
      ..add(DiagnosticsProperty('user', user))
      ..add(DiagnosticsProperty('exceptionRaised', exceptionRaised))
      ..add(DiagnosticsProperty('isFormValid', isFormValid))
      ..add(DiagnosticsProperty('isFailure', isFailure));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SigningIn &&
            (identical(other.isEmailValid, isEmailValid) ||
                const DeepCollectionEquality()
                    .equals(other.isEmailValid, isEmailValid)) &&
            (identical(other.isPasswordValid, isPasswordValid) ||
                const DeepCollectionEquality()
                    .equals(other.isPasswordValid, isPasswordValid)) &&
            (identical(other.isSubmitting, isSubmitting) ||
                const DeepCollectionEquality()
                    .equals(other.isSubmitting, isSubmitting)) &&
            (identical(other.isSuccess, isSuccess) ||
                const DeepCollectionEquality()
                    .equals(other.isSuccess, isSuccess)) &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)) &&
            (identical(other.exceptionRaised, exceptionRaised) ||
                const DeepCollectionEquality()
                    .equals(other.exceptionRaised, exceptionRaised)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(isEmailValid) ^
      const DeepCollectionEquality().hash(isPasswordValid) ^
      const DeepCollectionEquality().hash(isSubmitting) ^
      const DeepCollectionEquality().hash(isSuccess) ^
      const DeepCollectionEquality().hash(user) ^
      const DeepCollectionEquality().hash(exceptionRaised);

  @override
  _$SigningInCopyWith<_SigningIn> get copyWith =>
      __$SigningInCopyWithImpl<_SigningIn>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required
        Result empty(
            bool isEmailValid,
            bool isPasswordValid,
            bool isSubmitting,
            bool isSuccess,
            @nullable FirebaseUser user,
            @nullable AppException exceptionRaised),
    @required
        Result signingIn(
            bool isEmailValid,
            bool isPasswordValid,
            bool isSubmitting,
            bool isSuccess,
            @nullable FirebaseUser user,
            @nullable AppException exceptionRaised),
    @required
        Result failure(
            bool isEmailValid,
            bool isPasswordValid,
            bool isSubmitting,
            bool isSuccess,
            @nullable FirebaseUser user,
            @required AppException exceptionRaised),
    @required
        Result success(
            bool isEmailValid,
            bool isPasswordValid,
            bool isSubmitting,
            bool isSuccess,
            @required FirebaseUser user,
            @nullable AppException exceptionRaised),
  }) {
    assert(empty != null);
    assert(signingIn != null);
    assert(failure != null);
    assert(success != null);
    return signingIn(isEmailValid, isPasswordValid, isSubmitting, isSuccess,
        user, exceptionRaised);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result empty(
        bool isEmailValid,
        bool isPasswordValid,
        bool isSubmitting,
        bool isSuccess,
        @nullable FirebaseUser user,
        @nullable AppException exceptionRaised),
    Result signingIn(
        bool isEmailValid,
        bool isPasswordValid,
        bool isSubmitting,
        bool isSuccess,
        @nullable FirebaseUser user,
        @nullable AppException exceptionRaised),
    Result failure(
        bool isEmailValid,
        bool isPasswordValid,
        bool isSubmitting,
        bool isSuccess,
        @nullable FirebaseUser user,
        @required AppException exceptionRaised),
    Result success(
        bool isEmailValid,
        bool isPasswordValid,
        bool isSubmitting,
        bool isSuccess,
        @required FirebaseUser user,
        @nullable AppException exceptionRaised),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (signingIn != null) {
      return signingIn(isEmailValid, isPasswordValid, isSubmitting, isSuccess,
          user, exceptionRaised);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result empty(_Empty value),
    @required Result signingIn(_SigningIn value),
    @required Result failure(_Failure value),
    @required Result success(_Success value),
  }) {
    assert(empty != null);
    assert(signingIn != null);
    assert(failure != null);
    assert(success != null);
    return signingIn(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result empty(_Empty value),
    Result signingIn(_SigningIn value),
    Result failure(_Failure value),
    Result success(_Success value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (signingIn != null) {
      return signingIn(this);
    }
    return orElse();
  }
}

abstract class _SigningIn extends SignInState {
  _SigningIn._() : super._();
  factory _SigningIn(
      {bool isEmailValid,
      bool isPasswordValid,
      bool isSubmitting,
      bool isSuccess,
      @nullable FirebaseUser user,
      @nullable AppException exceptionRaised}) = _$_SigningIn;

  @override
  bool get isEmailValid;
  @override
  bool get isPasswordValid;
  @override
  bool get isSubmitting;
  @override
  bool get isSuccess;
  @override
  @nullable
  FirebaseUser get user;
  @override
  @nullable
  AppException get exceptionRaised;
  @override
  _$SigningInCopyWith<_SigningIn> get copyWith;
}

abstract class _$FailureCopyWith<$Res> implements $SignInStateCopyWith<$Res> {
  factory _$FailureCopyWith(_Failure value, $Res Function(_Failure) then) =
      __$FailureCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isEmailValid,
      bool isPasswordValid,
      bool isSubmitting,
      bool isSuccess,
      @nullable FirebaseUser user,
      AppException exceptionRaised});
}

class __$FailureCopyWithImpl<$Res> extends _$SignInStateCopyWithImpl<$Res>
    implements _$FailureCopyWith<$Res> {
  __$FailureCopyWithImpl(_Failure _value, $Res Function(_Failure) _then)
      : super(_value, (v) => _then(v as _Failure));

  @override
  _Failure get _value => super._value as _Failure;

  @override
  $Res call({
    Object isEmailValid = freezed,
    Object isPasswordValid = freezed,
    Object isSubmitting = freezed,
    Object isSuccess = freezed,
    Object user = freezed,
    Object exceptionRaised = freezed,
  }) {
    return _then(_Failure(
      isEmailValid:
          isEmailValid == freezed ? _value.isEmailValid : isEmailValid as bool,
      isPasswordValid: isPasswordValid == freezed
          ? _value.isPasswordValid
          : isPasswordValid as bool,
      isSubmitting:
          isSubmitting == freezed ? _value.isSubmitting : isSubmitting as bool,
      isSuccess: isSuccess == freezed ? _value.isSuccess : isSuccess as bool,
      user: user == freezed ? _value.user : user as FirebaseUser,
      exceptionRaised: exceptionRaised == freezed
          ? _value.exceptionRaised
          : exceptionRaised as AppException,
    ));
  }
}

class _$_Failure extends _Failure with DiagnosticableTreeMixin {
  _$_Failure(
      {this.isEmailValid = true,
      this.isPasswordValid = true,
      this.isSubmitting = false,
      this.isSuccess = false,
      @nullable this.user,
      @required this.exceptionRaised})
      : assert(isEmailValid != null),
        assert(isPasswordValid != null),
        assert(isSubmitting != null),
        assert(isSuccess != null),
        assert(exceptionRaised != null),
        super._();

  @JsonKey(defaultValue: true)
  @override
  final bool isEmailValid;
  @JsonKey(defaultValue: true)
  @override
  final bool isPasswordValid;
  @JsonKey(defaultValue: false)
  @override
  final bool isSubmitting;
  @JsonKey(defaultValue: false)
  @override
  final bool isSuccess;
  @override
  @nullable
  final FirebaseUser user;
  @override
  final AppException exceptionRaised;

  bool _didisFormValid = false;
  bool _isFormValid;

  @override
  bool get isFormValid {
    if (_didisFormValid == false) {
      _didisFormValid = true;
      _isFormValid = isEmailValid && isPasswordValid;
    }
    return _isFormValid;
  }

  bool _didisFailure = false;
  bool _isFailure;

  @override
  bool get isFailure {
    if (_didisFailure == false) {
      _didisFailure = true;
      _isFailure = exceptionRaised != null;
    }
    return _isFailure;
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SignInState.failure(isEmailValid: $isEmailValid, isPasswordValid: $isPasswordValid, isSubmitting: $isSubmitting, isSuccess: $isSuccess, user: $user, exceptionRaised: $exceptionRaised, isFormValid: $isFormValid, isFailure: $isFailure)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SignInState.failure'))
      ..add(DiagnosticsProperty('isEmailValid', isEmailValid))
      ..add(DiagnosticsProperty('isPasswordValid', isPasswordValid))
      ..add(DiagnosticsProperty('isSubmitting', isSubmitting))
      ..add(DiagnosticsProperty('isSuccess', isSuccess))
      ..add(DiagnosticsProperty('user', user))
      ..add(DiagnosticsProperty('exceptionRaised', exceptionRaised))
      ..add(DiagnosticsProperty('isFormValid', isFormValid))
      ..add(DiagnosticsProperty('isFailure', isFailure));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Failure &&
            (identical(other.isEmailValid, isEmailValid) ||
                const DeepCollectionEquality()
                    .equals(other.isEmailValid, isEmailValid)) &&
            (identical(other.isPasswordValid, isPasswordValid) ||
                const DeepCollectionEquality()
                    .equals(other.isPasswordValid, isPasswordValid)) &&
            (identical(other.isSubmitting, isSubmitting) ||
                const DeepCollectionEquality()
                    .equals(other.isSubmitting, isSubmitting)) &&
            (identical(other.isSuccess, isSuccess) ||
                const DeepCollectionEquality()
                    .equals(other.isSuccess, isSuccess)) &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)) &&
            (identical(other.exceptionRaised, exceptionRaised) ||
                const DeepCollectionEquality()
                    .equals(other.exceptionRaised, exceptionRaised)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(isEmailValid) ^
      const DeepCollectionEquality().hash(isPasswordValid) ^
      const DeepCollectionEquality().hash(isSubmitting) ^
      const DeepCollectionEquality().hash(isSuccess) ^
      const DeepCollectionEquality().hash(user) ^
      const DeepCollectionEquality().hash(exceptionRaised);

  @override
  _$FailureCopyWith<_Failure> get copyWith =>
      __$FailureCopyWithImpl<_Failure>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required
        Result empty(
            bool isEmailValid,
            bool isPasswordValid,
            bool isSubmitting,
            bool isSuccess,
            @nullable FirebaseUser user,
            @nullable AppException exceptionRaised),
    @required
        Result signingIn(
            bool isEmailValid,
            bool isPasswordValid,
            bool isSubmitting,
            bool isSuccess,
            @nullable FirebaseUser user,
            @nullable AppException exceptionRaised),
    @required
        Result failure(
            bool isEmailValid,
            bool isPasswordValid,
            bool isSubmitting,
            bool isSuccess,
            @nullable FirebaseUser user,
            @required AppException exceptionRaised),
    @required
        Result success(
            bool isEmailValid,
            bool isPasswordValid,
            bool isSubmitting,
            bool isSuccess,
            @required FirebaseUser user,
            @nullable AppException exceptionRaised),
  }) {
    assert(empty != null);
    assert(signingIn != null);
    assert(failure != null);
    assert(success != null);
    return failure(isEmailValid, isPasswordValid, isSubmitting, isSuccess, user,
        exceptionRaised);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result empty(
        bool isEmailValid,
        bool isPasswordValid,
        bool isSubmitting,
        bool isSuccess,
        @nullable FirebaseUser user,
        @nullable AppException exceptionRaised),
    Result signingIn(
        bool isEmailValid,
        bool isPasswordValid,
        bool isSubmitting,
        bool isSuccess,
        @nullable FirebaseUser user,
        @nullable AppException exceptionRaised),
    Result failure(
        bool isEmailValid,
        bool isPasswordValid,
        bool isSubmitting,
        bool isSuccess,
        @nullable FirebaseUser user,
        @required AppException exceptionRaised),
    Result success(
        bool isEmailValid,
        bool isPasswordValid,
        bool isSubmitting,
        bool isSuccess,
        @required FirebaseUser user,
        @nullable AppException exceptionRaised),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (failure != null) {
      return failure(isEmailValid, isPasswordValid, isSubmitting, isSuccess,
          user, exceptionRaised);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result empty(_Empty value),
    @required Result signingIn(_SigningIn value),
    @required Result failure(_Failure value),
    @required Result success(_Success value),
  }) {
    assert(empty != null);
    assert(signingIn != null);
    assert(failure != null);
    assert(success != null);
    return failure(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result empty(_Empty value),
    Result signingIn(_SigningIn value),
    Result failure(_Failure value),
    Result success(_Success value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _Failure extends SignInState {
  _Failure._() : super._();
  factory _Failure(
      {bool isEmailValid,
      bool isPasswordValid,
      bool isSubmitting,
      bool isSuccess,
      @nullable FirebaseUser user,
      @required AppException exceptionRaised}) = _$_Failure;

  @override
  bool get isEmailValid;
  @override
  bool get isPasswordValid;
  @override
  bool get isSubmitting;
  @override
  bool get isSuccess;
  @override
  @nullable
  FirebaseUser get user;
  @override
  AppException get exceptionRaised;
  @override
  _$FailureCopyWith<_Failure> get copyWith;
}

abstract class _$SuccessCopyWith<$Res> implements $SignInStateCopyWith<$Res> {
  factory _$SuccessCopyWith(_Success value, $Res Function(_Success) then) =
      __$SuccessCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isEmailValid,
      bool isPasswordValid,
      bool isSubmitting,
      bool isSuccess,
      FirebaseUser user,
      @nullable AppException exceptionRaised});
}

class __$SuccessCopyWithImpl<$Res> extends _$SignInStateCopyWithImpl<$Res>
    implements _$SuccessCopyWith<$Res> {
  __$SuccessCopyWithImpl(_Success _value, $Res Function(_Success) _then)
      : super(_value, (v) => _then(v as _Success));

  @override
  _Success get _value => super._value as _Success;

  @override
  $Res call({
    Object isEmailValid = freezed,
    Object isPasswordValid = freezed,
    Object isSubmitting = freezed,
    Object isSuccess = freezed,
    Object user = freezed,
    Object exceptionRaised = freezed,
  }) {
    return _then(_Success(
      isEmailValid:
          isEmailValid == freezed ? _value.isEmailValid : isEmailValid as bool,
      isPasswordValid: isPasswordValid == freezed
          ? _value.isPasswordValid
          : isPasswordValid as bool,
      isSubmitting:
          isSubmitting == freezed ? _value.isSubmitting : isSubmitting as bool,
      isSuccess: isSuccess == freezed ? _value.isSuccess : isSuccess as bool,
      user: user == freezed ? _value.user : user as FirebaseUser,
      exceptionRaised: exceptionRaised == freezed
          ? _value.exceptionRaised
          : exceptionRaised as AppException,
    ));
  }
}

class _$_Success extends _Success with DiagnosticableTreeMixin {
  _$_Success(
      {this.isEmailValid = true,
      this.isPasswordValid = true,
      this.isSubmitting = false,
      this.isSuccess = true,
      @required this.user,
      @nullable this.exceptionRaised})
      : assert(isEmailValid != null),
        assert(isPasswordValid != null),
        assert(isSubmitting != null),
        assert(isSuccess != null),
        assert(user != null),
        super._();

  @JsonKey(defaultValue: true)
  @override
  final bool isEmailValid;
  @JsonKey(defaultValue: true)
  @override
  final bool isPasswordValid;
  @JsonKey(defaultValue: false)
  @override
  final bool isSubmitting;
  @JsonKey(defaultValue: true)
  @override
  final bool isSuccess;
  @override
  final FirebaseUser user;
  @override
  @nullable
  final AppException exceptionRaised;

  bool _didisFormValid = false;
  bool _isFormValid;

  @override
  bool get isFormValid {
    if (_didisFormValid == false) {
      _didisFormValid = true;
      _isFormValid = isEmailValid && isPasswordValid;
    }
    return _isFormValid;
  }

  bool _didisFailure = false;
  bool _isFailure;

  @override
  bool get isFailure {
    if (_didisFailure == false) {
      _didisFailure = true;
      _isFailure = exceptionRaised != null;
    }
    return _isFailure;
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SignInState.success(isEmailValid: $isEmailValid, isPasswordValid: $isPasswordValid, isSubmitting: $isSubmitting, isSuccess: $isSuccess, user: $user, exceptionRaised: $exceptionRaised, isFormValid: $isFormValid, isFailure: $isFailure)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SignInState.success'))
      ..add(DiagnosticsProperty('isEmailValid', isEmailValid))
      ..add(DiagnosticsProperty('isPasswordValid', isPasswordValid))
      ..add(DiagnosticsProperty('isSubmitting', isSubmitting))
      ..add(DiagnosticsProperty('isSuccess', isSuccess))
      ..add(DiagnosticsProperty('user', user))
      ..add(DiagnosticsProperty('exceptionRaised', exceptionRaised))
      ..add(DiagnosticsProperty('isFormValid', isFormValid))
      ..add(DiagnosticsProperty('isFailure', isFailure));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Success &&
            (identical(other.isEmailValid, isEmailValid) ||
                const DeepCollectionEquality()
                    .equals(other.isEmailValid, isEmailValid)) &&
            (identical(other.isPasswordValid, isPasswordValid) ||
                const DeepCollectionEquality()
                    .equals(other.isPasswordValid, isPasswordValid)) &&
            (identical(other.isSubmitting, isSubmitting) ||
                const DeepCollectionEquality()
                    .equals(other.isSubmitting, isSubmitting)) &&
            (identical(other.isSuccess, isSuccess) ||
                const DeepCollectionEquality()
                    .equals(other.isSuccess, isSuccess)) &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)) &&
            (identical(other.exceptionRaised, exceptionRaised) ||
                const DeepCollectionEquality()
                    .equals(other.exceptionRaised, exceptionRaised)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(isEmailValid) ^
      const DeepCollectionEquality().hash(isPasswordValid) ^
      const DeepCollectionEquality().hash(isSubmitting) ^
      const DeepCollectionEquality().hash(isSuccess) ^
      const DeepCollectionEquality().hash(user) ^
      const DeepCollectionEquality().hash(exceptionRaised);

  @override
  _$SuccessCopyWith<_Success> get copyWith =>
      __$SuccessCopyWithImpl<_Success>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required
        Result empty(
            bool isEmailValid,
            bool isPasswordValid,
            bool isSubmitting,
            bool isSuccess,
            @nullable FirebaseUser user,
            @nullable AppException exceptionRaised),
    @required
        Result signingIn(
            bool isEmailValid,
            bool isPasswordValid,
            bool isSubmitting,
            bool isSuccess,
            @nullable FirebaseUser user,
            @nullable AppException exceptionRaised),
    @required
        Result failure(
            bool isEmailValid,
            bool isPasswordValid,
            bool isSubmitting,
            bool isSuccess,
            @nullable FirebaseUser user,
            @required AppException exceptionRaised),
    @required
        Result success(
            bool isEmailValid,
            bool isPasswordValid,
            bool isSubmitting,
            bool isSuccess,
            @required FirebaseUser user,
            @nullable AppException exceptionRaised),
  }) {
    assert(empty != null);
    assert(signingIn != null);
    assert(failure != null);
    assert(success != null);
    return success(isEmailValid, isPasswordValid, isSubmitting, isSuccess, user,
        exceptionRaised);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result empty(
        bool isEmailValid,
        bool isPasswordValid,
        bool isSubmitting,
        bool isSuccess,
        @nullable FirebaseUser user,
        @nullable AppException exceptionRaised),
    Result signingIn(
        bool isEmailValid,
        bool isPasswordValid,
        bool isSubmitting,
        bool isSuccess,
        @nullable FirebaseUser user,
        @nullable AppException exceptionRaised),
    Result failure(
        bool isEmailValid,
        bool isPasswordValid,
        bool isSubmitting,
        bool isSuccess,
        @nullable FirebaseUser user,
        @required AppException exceptionRaised),
    Result success(
        bool isEmailValid,
        bool isPasswordValid,
        bool isSubmitting,
        bool isSuccess,
        @required FirebaseUser user,
        @nullable AppException exceptionRaised),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (success != null) {
      return success(isEmailValid, isPasswordValid, isSubmitting, isSuccess,
          user, exceptionRaised);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result empty(_Empty value),
    @required Result signingIn(_SigningIn value),
    @required Result failure(_Failure value),
    @required Result success(_Success value),
  }) {
    assert(empty != null);
    assert(signingIn != null);
    assert(failure != null);
    assert(success != null);
    return success(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result empty(_Empty value),
    Result signingIn(_SigningIn value),
    Result failure(_Failure value),
    Result success(_Success value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success extends SignInState {
  _Success._() : super._();
  factory _Success(
      {bool isEmailValid,
      bool isPasswordValid,
      bool isSubmitting,
      bool isSuccess,
      @required FirebaseUser user,
      @nullable AppException exceptionRaised}) = _$_Success;

  @override
  bool get isEmailValid;
  @override
  bool get isPasswordValid;
  @override
  bool get isSubmitting;
  @override
  bool get isSuccess;
  @override
  FirebaseUser get user;
  @override
  @nullable
  AppException get exceptionRaised;
  @override
  _$SuccessCopyWith<_Success> get copyWith;
}
