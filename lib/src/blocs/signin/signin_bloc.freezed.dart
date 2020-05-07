// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'signin_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$SignInEventTearOff {
  const _$SignInEventTearOff();

  _EmailChanged emailChanged({String email}) {
    return _EmailChanged(
      email: email,
    );
  }

  _PasswordChanged passwordChanged({String password}) {
    return _PasswordChanged(
      password: password,
    );
  }

  _EmailAndPasswordPressed emailAndPasswordPressed() {
    return const _EmailAndPasswordPressed();
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
    @required Result emailChanged(String email),
    @required Result passwordChanged(String password),
    @required Result emailAndPasswordPressed(),
    @required Result googlePressed(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result emailChanged(String email),
    Result passwordChanged(String password),
    Result emailAndPasswordPressed(),
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
  const _$_EmailChanged({this.email});

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
    @required Result emailChanged(String email),
    @required Result passwordChanged(String password),
    @required Result emailAndPasswordPressed(),
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
    Result emailChanged(String email),
    Result passwordChanged(String password),
    Result emailAndPasswordPressed(),
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
  const factory _EmailChanged({String email}) = _$_EmailChanged;

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
  const _$_PasswordChanged({this.password});

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
    @required Result emailChanged(String email),
    @required Result passwordChanged(String password),
    @required Result emailAndPasswordPressed(),
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
    Result emailChanged(String email),
    Result passwordChanged(String password),
    Result emailAndPasswordPressed(),
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
  const factory _PasswordChanged({String password}) = _$_PasswordChanged;

  String get password;
  _$PasswordChangedCopyWith<_PasswordChanged> get copyWith;
}

abstract class _$EmailAndPasswordPressedCopyWith<$Res> {
  factory _$EmailAndPasswordPressedCopyWith(_EmailAndPasswordPressed value,
          $Res Function(_EmailAndPasswordPressed) then) =
      __$EmailAndPasswordPressedCopyWithImpl<$Res>;
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
}

class _$_EmailAndPasswordPressed
    with DiagnosticableTreeMixin
    implements _EmailAndPasswordPressed {
  const _$_EmailAndPasswordPressed();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SignInEvent.emailAndPasswordPressed()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SignInEvent.emailAndPasswordPressed'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _EmailAndPasswordPressed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result emailChanged(String email),
    @required Result passwordChanged(String password),
    @required Result emailAndPasswordPressed(),
    @required Result googlePressed(),
  }) {
    assert(emailChanged != null);
    assert(passwordChanged != null);
    assert(emailAndPasswordPressed != null);
    assert(googlePressed != null);
    return emailAndPasswordPressed();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result emailChanged(String email),
    Result passwordChanged(String password),
    Result emailAndPasswordPressed(),
    Result googlePressed(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (emailAndPasswordPressed != null) {
      return emailAndPasswordPressed();
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
  const factory _EmailAndPasswordPressed() = _$_EmailAndPasswordPressed;
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
    @required Result emailChanged(String email),
    @required Result passwordChanged(String password),
    @required Result emailAndPasswordPressed(),
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
    Result emailChanged(String email),
    Result passwordChanged(String password),
    Result emailAndPasswordPressed(),
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

  _SignInState call(
      {String email = '',
      String password = '',
      bool isSubmitting = false,
      @nullable FirebaseUser user,
      @nullable AppException exceptionRaised}) {
    return _SignInState(
      email: email,
      password: password,
      isSubmitting: isSubmitting,
      user: user,
      exceptionRaised: exceptionRaised,
    );
  }
}

// ignore: unused_element
const $SignInState = _$SignInStateTearOff();

mixin _$SignInState {
  String get email;
  String get password;
  bool get isSubmitting;
  @nullable
  FirebaseUser get user;
  @nullable
  AppException get exceptionRaised;

  $SignInStateCopyWith<SignInState> get copyWith;
}

abstract class $SignInStateCopyWith<$Res> {
  factory $SignInStateCopyWith(
          SignInState value, $Res Function(SignInState) then) =
      _$SignInStateCopyWithImpl<$Res>;
  $Res call(
      {String email,
      String password,
      bool isSubmitting,
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
    Object email = freezed,
    Object password = freezed,
    Object isSubmitting = freezed,
    Object user = freezed,
    Object exceptionRaised = freezed,
  }) {
    return _then(_value.copyWith(
      email: email == freezed ? _value.email : email as String,
      password: password == freezed ? _value.password : password as String,
      isSubmitting:
          isSubmitting == freezed ? _value.isSubmitting : isSubmitting as bool,
      user: user == freezed ? _value.user : user as FirebaseUser,
      exceptionRaised: exceptionRaised == freezed
          ? _value.exceptionRaised
          : exceptionRaised as AppException,
    ));
  }
}

abstract class _$SignInStateCopyWith<$Res>
    implements $SignInStateCopyWith<$Res> {
  factory _$SignInStateCopyWith(
          _SignInState value, $Res Function(_SignInState) then) =
      __$SignInStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {String email,
      String password,
      bool isSubmitting,
      @nullable FirebaseUser user,
      @nullable AppException exceptionRaised});
}

class __$SignInStateCopyWithImpl<$Res> extends _$SignInStateCopyWithImpl<$Res>
    implements _$SignInStateCopyWith<$Res> {
  __$SignInStateCopyWithImpl(
      _SignInState _value, $Res Function(_SignInState) _then)
      : super(_value, (v) => _then(v as _SignInState));

  @override
  _SignInState get _value => super._value as _SignInState;

  @override
  $Res call({
    Object email = freezed,
    Object password = freezed,
    Object isSubmitting = freezed,
    Object user = freezed,
    Object exceptionRaised = freezed,
  }) {
    return _then(_SignInState(
      email: email == freezed ? _value.email : email as String,
      password: password == freezed ? _value.password : password as String,
      isSubmitting:
          isSubmitting == freezed ? _value.isSubmitting : isSubmitting as bool,
      user: user == freezed ? _value.user : user as FirebaseUser,
      exceptionRaised: exceptionRaised == freezed
          ? _value.exceptionRaised
          : exceptionRaised as AppException,
    ));
  }
}

class _$_SignInState extends _SignInState with DiagnosticableTreeMixin {
  const _$_SignInState(
      {this.email = '',
      this.password = '',
      this.isSubmitting = false,
      @nullable this.user,
      @nullable this.exceptionRaised})
      : assert(email != null),
        assert(password != null),
        assert(isSubmitting != null),
        super._();

  @JsonKey(defaultValue: '')
  @override
  final String email;
  @JsonKey(defaultValue: '')
  @override
  final String password;
  @JsonKey(defaultValue: false)
  @override
  final bool isSubmitting;
  @override
  @nullable
  final FirebaseUser user;
  @override
  @nullable
  final AppException exceptionRaised;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SignInState(email: $email, password: $password, isSubmitting: $isSubmitting, user: $user, exceptionRaised: $exceptionRaised)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SignInState'))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('password', password))
      ..add(DiagnosticsProperty('isSubmitting', isSubmitting))
      ..add(DiagnosticsProperty('user', user))
      ..add(DiagnosticsProperty('exceptionRaised', exceptionRaised));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SignInState &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)) &&
            (identical(other.isSubmitting, isSubmitting) ||
                const DeepCollectionEquality()
                    .equals(other.isSubmitting, isSubmitting)) &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)) &&
            (identical(other.exceptionRaised, exceptionRaised) ||
                const DeepCollectionEquality()
                    .equals(other.exceptionRaised, exceptionRaised)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(password) ^
      const DeepCollectionEquality().hash(isSubmitting) ^
      const DeepCollectionEquality().hash(user) ^
      const DeepCollectionEquality().hash(exceptionRaised);

  @override
  _$SignInStateCopyWith<_SignInState> get copyWith =>
      __$SignInStateCopyWithImpl<_SignInState>(this, _$identity);
}

abstract class _SignInState extends SignInState {
  const _SignInState._() : super._();
  const factory _SignInState(
      {String email,
      String password,
      bool isSubmitting,
      @nullable FirebaseUser user,
      @nullable AppException exceptionRaised}) = _$_SignInState;

  @override
  String get email;
  @override
  String get password;
  @override
  bool get isSubmitting;
  @override
  @nullable
  FirebaseUser get user;
  @override
  @nullable
  AppException get exceptionRaised;
  @override
  _$SignInStateCopyWith<_SignInState> get copyWith;
}
