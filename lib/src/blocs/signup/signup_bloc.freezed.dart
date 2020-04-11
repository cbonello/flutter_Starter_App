// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'signup_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$SignUpEventTearOff {
  const _$SignUpEventTearOff();

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

  _Submitted submitted({String email, String password}) {
    return _Submitted(
      email: email,
      password: password,
    );
  }
}

// ignore: unused_element
const $SignUpEvent = _$SignUpEventTearOff();

mixin _$SignUpEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result emailChanged(String email),
    @required Result passwordChanged(String password),
    @required Result submitted(String email, String password),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result emailChanged(String email),
    Result passwordChanged(String password),
    Result submitted(String email, String password),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result emailChanged(_EmailChanged value),
    @required Result passwordChanged(_PasswordChanged value),
    @required Result submitted(_Submitted value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result emailChanged(_EmailChanged value),
    Result passwordChanged(_PasswordChanged value),
    Result submitted(_Submitted value),
    @required Result orElse(),
  });
}

abstract class $SignUpEventCopyWith<$Res> {
  factory $SignUpEventCopyWith(
          SignUpEvent value, $Res Function(SignUpEvent) then) =
      _$SignUpEventCopyWithImpl<$Res>;
}

class _$SignUpEventCopyWithImpl<$Res> implements $SignUpEventCopyWith<$Res> {
  _$SignUpEventCopyWithImpl(this._value, this._then);

  final SignUpEvent _value;
  // ignore: unused_field
  final $Res Function(SignUpEvent) _then;
}

abstract class _$EmailChangedCopyWith<$Res> {
  factory _$EmailChangedCopyWith(
          _EmailChanged value, $Res Function(_EmailChanged) then) =
      __$EmailChangedCopyWithImpl<$Res>;
  $Res call({String email});
}

class __$EmailChangedCopyWithImpl<$Res> extends _$SignUpEventCopyWithImpl<$Res>
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
    return 'SignUpEvent.emailChanged(email: $email)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SignUpEvent.emailChanged'))
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
    @required Result submitted(String email, String password),
  }) {
    assert(emailChanged != null);
    assert(passwordChanged != null);
    assert(submitted != null);
    return emailChanged(email);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result emailChanged(String email),
    Result passwordChanged(String password),
    Result submitted(String email, String password),
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
    @required Result submitted(_Submitted value),
  }) {
    assert(emailChanged != null);
    assert(passwordChanged != null);
    assert(submitted != null);
    return emailChanged(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result emailChanged(_EmailChanged value),
    Result passwordChanged(_PasswordChanged value),
    Result submitted(_Submitted value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (emailChanged != null) {
      return emailChanged(this);
    }
    return orElse();
  }
}

abstract class _EmailChanged implements SignUpEvent {
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
    extends _$SignUpEventCopyWithImpl<$Res>
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
    return 'SignUpEvent.passwordChanged(password: $password)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SignUpEvent.passwordChanged'))
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
    @required Result submitted(String email, String password),
  }) {
    assert(emailChanged != null);
    assert(passwordChanged != null);
    assert(submitted != null);
    return passwordChanged(password);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result emailChanged(String email),
    Result passwordChanged(String password),
    Result submitted(String email, String password),
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
    @required Result submitted(_Submitted value),
  }) {
    assert(emailChanged != null);
    assert(passwordChanged != null);
    assert(submitted != null);
    return passwordChanged(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result emailChanged(_EmailChanged value),
    Result passwordChanged(_PasswordChanged value),
    Result submitted(_Submitted value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (passwordChanged != null) {
      return passwordChanged(this);
    }
    return orElse();
  }
}

abstract class _PasswordChanged implements SignUpEvent {
  const factory _PasswordChanged({String password}) = _$_PasswordChanged;

  String get password;
  _$PasswordChangedCopyWith<_PasswordChanged> get copyWith;
}

abstract class _$SubmittedCopyWith<$Res> {
  factory _$SubmittedCopyWith(
          _Submitted value, $Res Function(_Submitted) then) =
      __$SubmittedCopyWithImpl<$Res>;
  $Res call({String email, String password});
}

class __$SubmittedCopyWithImpl<$Res> extends _$SignUpEventCopyWithImpl<$Res>
    implements _$SubmittedCopyWith<$Res> {
  __$SubmittedCopyWithImpl(_Submitted _value, $Res Function(_Submitted) _then)
      : super(_value, (v) => _then(v as _Submitted));

  @override
  _Submitted get _value => super._value as _Submitted;

  @override
  $Res call({
    Object email = freezed,
    Object password = freezed,
  }) {
    return _then(_Submitted(
      email: email == freezed ? _value.email : email as String,
      password: password == freezed ? _value.password : password as String,
    ));
  }
}

class _$_Submitted with DiagnosticableTreeMixin implements _Submitted {
  const _$_Submitted({this.email, this.password});

  @override
  final String email;
  @override
  final String password;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SignUpEvent.submitted(email: $email, password: $password)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SignUpEvent.submitted'))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('password', password));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Submitted &&
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
  _$SubmittedCopyWith<_Submitted> get copyWith =>
      __$SubmittedCopyWithImpl<_Submitted>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result emailChanged(String email),
    @required Result passwordChanged(String password),
    @required Result submitted(String email, String password),
  }) {
    assert(emailChanged != null);
    assert(passwordChanged != null);
    assert(submitted != null);
    return submitted(email, password);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result emailChanged(String email),
    Result passwordChanged(String password),
    Result submitted(String email, String password),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (submitted != null) {
      return submitted(email, password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result emailChanged(_EmailChanged value),
    @required Result passwordChanged(_PasswordChanged value),
    @required Result submitted(_Submitted value),
  }) {
    assert(emailChanged != null);
    assert(passwordChanged != null);
    assert(submitted != null);
    return submitted(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result emailChanged(_EmailChanged value),
    Result passwordChanged(_PasswordChanged value),
    Result submitted(_Submitted value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (submitted != null) {
      return submitted(this);
    }
    return orElse();
  }
}

abstract class _Submitted implements SignUpEvent {
  const factory _Submitted({String email, String password}) = _$_Submitted;

  String get email;
  String get password;
  _$SubmittedCopyWith<_Submitted> get copyWith;
}

class _$SignUpStateTearOff {
  const _$SignUpStateTearOff();

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

  _Loading loading(
      {bool isEmailValid = true,
      bool isPasswordValid = true,
      bool isSubmitting = true,
      bool isSuccess = false,
      @nullable FirebaseUser user,
      @nullable AppException exceptionRaised}) {
    return _Loading(
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
      AppException exceptionRaised}) {
    return _Failure(
      isEmailValid: isEmailValid,
      isPasswordValid: isPasswordValid,
      isSubmitting: isSubmitting,
      isSuccess: isSuccess,
      user: user,
      exceptionRaised: exceptionRaised,
    );
  }

  _Success emailSent(
      {bool isEmailValid = true,
      bool isPasswordValid = true,
      bool isSubmitting = false,
      bool isSuccess = true,
      FirebaseUser user,
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
const $SignUpState = _$SignUpStateTearOff();

mixin _$SignUpState {
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
        Result loading(
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
            AppException exceptionRaised),
    @required
        Result emailSent(
            bool isEmailValid,
            bool isPasswordValid,
            bool isSubmitting,
            bool isSuccess,
            FirebaseUser user,
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
    Result loading(
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
        AppException exceptionRaised),
    Result emailSent(
        bool isEmailValid,
        bool isPasswordValid,
        bool isSubmitting,
        bool isSuccess,
        FirebaseUser user,
        @nullable AppException exceptionRaised),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result empty(_Empty value),
    @required Result loading(_Loading value),
    @required Result failure(_Failure value),
    @required Result emailSent(_Success value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result empty(_Empty value),
    Result loading(_Loading value),
    Result failure(_Failure value),
    Result emailSent(_Success value),
    @required Result orElse(),
  });

  $SignUpStateCopyWith<SignUpState> get copyWith;
}

abstract class $SignUpStateCopyWith<$Res> {
  factory $SignUpStateCopyWith(
          SignUpState value, $Res Function(SignUpState) then) =
      _$SignUpStateCopyWithImpl<$Res>;
  $Res call(
      {bool isEmailValid,
      bool isPasswordValid,
      bool isSubmitting,
      bool isSuccess,
      @nullable FirebaseUser user,
      @nullable AppException exceptionRaised});
}

class _$SignUpStateCopyWithImpl<$Res> implements $SignUpStateCopyWith<$Res> {
  _$SignUpStateCopyWithImpl(this._value, this._then);

  final SignUpState _value;
  // ignore: unused_field
  final $Res Function(SignUpState) _then;

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

abstract class _$EmptyCopyWith<$Res> implements $SignUpStateCopyWith<$Res> {
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

class __$EmptyCopyWithImpl<$Res> extends _$SignUpStateCopyWithImpl<$Res>
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
    return 'SignUpState.empty(isEmailValid: $isEmailValid, isPasswordValid: $isPasswordValid, isSubmitting: $isSubmitting, isSuccess: $isSuccess, user: $user, exceptionRaised: $exceptionRaised, isFormValid: $isFormValid, isFailure: $isFailure)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SignUpState.empty'))
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
        Result loading(
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
            AppException exceptionRaised),
    @required
        Result emailSent(
            bool isEmailValid,
            bool isPasswordValid,
            bool isSubmitting,
            bool isSuccess,
            FirebaseUser user,
            @nullable AppException exceptionRaised),
  }) {
    assert(empty != null);
    assert(loading != null);
    assert(failure != null);
    assert(emailSent != null);
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
    Result loading(
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
        AppException exceptionRaised),
    Result emailSent(
        bool isEmailValid,
        bool isPasswordValid,
        bool isSubmitting,
        bool isSuccess,
        FirebaseUser user,
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
    @required Result loading(_Loading value),
    @required Result failure(_Failure value),
    @required Result emailSent(_Success value),
  }) {
    assert(empty != null);
    assert(loading != null);
    assert(failure != null);
    assert(emailSent != null);
    return empty(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result empty(_Empty value),
    Result loading(_Loading value),
    Result failure(_Failure value),
    Result emailSent(_Success value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class _Empty extends SignUpState {
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

abstract class _$LoadingCopyWith<$Res> implements $SignUpStateCopyWith<$Res> {
  factory _$LoadingCopyWith(_Loading value, $Res Function(_Loading) then) =
      __$LoadingCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isEmailValid,
      bool isPasswordValid,
      bool isSubmitting,
      bool isSuccess,
      @nullable FirebaseUser user,
      @nullable AppException exceptionRaised});
}

class __$LoadingCopyWithImpl<$Res> extends _$SignUpStateCopyWithImpl<$Res>
    implements _$LoadingCopyWith<$Res> {
  __$LoadingCopyWithImpl(_Loading _value, $Res Function(_Loading) _then)
      : super(_value, (v) => _then(v as _Loading));

  @override
  _Loading get _value => super._value as _Loading;

  @override
  $Res call({
    Object isEmailValid = freezed,
    Object isPasswordValid = freezed,
    Object isSubmitting = freezed,
    Object isSuccess = freezed,
    Object user = freezed,
    Object exceptionRaised = freezed,
  }) {
    return _then(_Loading(
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

class _$_Loading extends _Loading with DiagnosticableTreeMixin {
  _$_Loading(
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
    return 'SignUpState.loading(isEmailValid: $isEmailValid, isPasswordValid: $isPasswordValid, isSubmitting: $isSubmitting, isSuccess: $isSuccess, user: $user, exceptionRaised: $exceptionRaised, isFormValid: $isFormValid, isFailure: $isFailure)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SignUpState.loading'))
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
        (other is _Loading &&
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
  _$LoadingCopyWith<_Loading> get copyWith =>
      __$LoadingCopyWithImpl<_Loading>(this, _$identity);

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
        Result loading(
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
            AppException exceptionRaised),
    @required
        Result emailSent(
            bool isEmailValid,
            bool isPasswordValid,
            bool isSubmitting,
            bool isSuccess,
            FirebaseUser user,
            @nullable AppException exceptionRaised),
  }) {
    assert(empty != null);
    assert(loading != null);
    assert(failure != null);
    assert(emailSent != null);
    return loading(isEmailValid, isPasswordValid, isSubmitting, isSuccess, user,
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
    Result loading(
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
        AppException exceptionRaised),
    Result emailSent(
        bool isEmailValid,
        bool isPasswordValid,
        bool isSubmitting,
        bool isSuccess,
        FirebaseUser user,
        @nullable AppException exceptionRaised),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading(isEmailValid, isPasswordValid, isSubmitting, isSuccess,
          user, exceptionRaised);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result empty(_Empty value),
    @required Result loading(_Loading value),
    @required Result failure(_Failure value),
    @required Result emailSent(_Success value),
  }) {
    assert(empty != null);
    assert(loading != null);
    assert(failure != null);
    assert(emailSent != null);
    return loading(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result empty(_Empty value),
    Result loading(_Loading value),
    Result failure(_Failure value),
    Result emailSent(_Success value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading extends SignUpState {
  _Loading._() : super._();
  factory _Loading(
      {bool isEmailValid,
      bool isPasswordValid,
      bool isSubmitting,
      bool isSuccess,
      @nullable FirebaseUser user,
      @nullable AppException exceptionRaised}) = _$_Loading;

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
  _$LoadingCopyWith<_Loading> get copyWith;
}

abstract class _$FailureCopyWith<$Res> implements $SignUpStateCopyWith<$Res> {
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

class __$FailureCopyWithImpl<$Res> extends _$SignUpStateCopyWithImpl<$Res>
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
      this.exceptionRaised})
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
    return 'SignUpState.failure(isEmailValid: $isEmailValid, isPasswordValid: $isPasswordValid, isSubmitting: $isSubmitting, isSuccess: $isSuccess, user: $user, exceptionRaised: $exceptionRaised, isFormValid: $isFormValid, isFailure: $isFailure)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SignUpState.failure'))
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
        Result loading(
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
            AppException exceptionRaised),
    @required
        Result emailSent(
            bool isEmailValid,
            bool isPasswordValid,
            bool isSubmitting,
            bool isSuccess,
            FirebaseUser user,
            @nullable AppException exceptionRaised),
  }) {
    assert(empty != null);
    assert(loading != null);
    assert(failure != null);
    assert(emailSent != null);
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
    Result loading(
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
        AppException exceptionRaised),
    Result emailSent(
        bool isEmailValid,
        bool isPasswordValid,
        bool isSubmitting,
        bool isSuccess,
        FirebaseUser user,
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
    @required Result loading(_Loading value),
    @required Result failure(_Failure value),
    @required Result emailSent(_Success value),
  }) {
    assert(empty != null);
    assert(loading != null);
    assert(failure != null);
    assert(emailSent != null);
    return failure(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result empty(_Empty value),
    Result loading(_Loading value),
    Result failure(_Failure value),
    Result emailSent(_Success value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _Failure extends SignUpState {
  _Failure._() : super._();
  factory _Failure(
      {bool isEmailValid,
      bool isPasswordValid,
      bool isSubmitting,
      bool isSuccess,
      @nullable FirebaseUser user,
      AppException exceptionRaised}) = _$_Failure;

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

abstract class _$SuccessCopyWith<$Res> implements $SignUpStateCopyWith<$Res> {
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

class __$SuccessCopyWithImpl<$Res> extends _$SignUpStateCopyWithImpl<$Res>
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
      this.user,
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
    return 'SignUpState.emailSent(isEmailValid: $isEmailValid, isPasswordValid: $isPasswordValid, isSubmitting: $isSubmitting, isSuccess: $isSuccess, user: $user, exceptionRaised: $exceptionRaised, isFormValid: $isFormValid, isFailure: $isFailure)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SignUpState.emailSent'))
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
        Result loading(
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
            AppException exceptionRaised),
    @required
        Result emailSent(
            bool isEmailValid,
            bool isPasswordValid,
            bool isSubmitting,
            bool isSuccess,
            FirebaseUser user,
            @nullable AppException exceptionRaised),
  }) {
    assert(empty != null);
    assert(loading != null);
    assert(failure != null);
    assert(emailSent != null);
    return emailSent(isEmailValid, isPasswordValid, isSubmitting, isSuccess,
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
    Result loading(
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
        AppException exceptionRaised),
    Result emailSent(
        bool isEmailValid,
        bool isPasswordValid,
        bool isSubmitting,
        bool isSuccess,
        FirebaseUser user,
        @nullable AppException exceptionRaised),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (emailSent != null) {
      return emailSent(isEmailValid, isPasswordValid, isSubmitting, isSuccess,
          user, exceptionRaised);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result empty(_Empty value),
    @required Result loading(_Loading value),
    @required Result failure(_Failure value),
    @required Result emailSent(_Success value),
  }) {
    assert(empty != null);
    assert(loading != null);
    assert(failure != null);
    assert(emailSent != null);
    return emailSent(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result empty(_Empty value),
    Result loading(_Loading value),
    Result failure(_Failure value),
    Result emailSent(_Success value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (emailSent != null) {
      return emailSent(this);
    }
    return orElse();
  }
}

abstract class _Success extends SignUpState {
  _Success._() : super._();
  factory _Success(
      {bool isEmailValid,
      bool isPasswordValid,
      bool isSubmitting,
      bool isSuccess,
      FirebaseUser user,
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
