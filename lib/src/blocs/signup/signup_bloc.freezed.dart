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

  _ToSChanged tosChanged({bool tos}) {
    return _ToSChanged(
      tos: tos,
    );
  }

  _Submitted submitted() {
    return const _Submitted();
  }
}

// ignore: unused_element
const $SignUpEvent = _$SignUpEventTearOff();

mixin _$SignUpEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result emailChanged(String email),
    @required Result passwordChanged(String password),
    @required Result tosChanged(bool tos),
    @required Result submitted(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result emailChanged(String email),
    Result passwordChanged(String password),
    Result tosChanged(bool tos),
    Result submitted(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result emailChanged(_EmailChanged value),
    @required Result passwordChanged(_PasswordChanged value),
    @required Result tosChanged(_ToSChanged value),
    @required Result submitted(_Submitted value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result emailChanged(_EmailChanged value),
    Result passwordChanged(_PasswordChanged value),
    Result tosChanged(_ToSChanged value),
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
    @required Result tosChanged(bool tos),
    @required Result submitted(),
  }) {
    assert(emailChanged != null);
    assert(passwordChanged != null);
    assert(tosChanged != null);
    assert(submitted != null);
    return emailChanged(email);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result emailChanged(String email),
    Result passwordChanged(String password),
    Result tosChanged(bool tos),
    Result submitted(),
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
    @required Result tosChanged(_ToSChanged value),
    @required Result submitted(_Submitted value),
  }) {
    assert(emailChanged != null);
    assert(passwordChanged != null);
    assert(tosChanged != null);
    assert(submitted != null);
    return emailChanged(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result emailChanged(_EmailChanged value),
    Result passwordChanged(_PasswordChanged value),
    Result tosChanged(_ToSChanged value),
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
    @required Result tosChanged(bool tos),
    @required Result submitted(),
  }) {
    assert(emailChanged != null);
    assert(passwordChanged != null);
    assert(tosChanged != null);
    assert(submitted != null);
    return passwordChanged(password);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result emailChanged(String email),
    Result passwordChanged(String password),
    Result tosChanged(bool tos),
    Result submitted(),
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
    @required Result tosChanged(_ToSChanged value),
    @required Result submitted(_Submitted value),
  }) {
    assert(emailChanged != null);
    assert(passwordChanged != null);
    assert(tosChanged != null);
    assert(submitted != null);
    return passwordChanged(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result emailChanged(_EmailChanged value),
    Result passwordChanged(_PasswordChanged value),
    Result tosChanged(_ToSChanged value),
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

abstract class _$ToSChangedCopyWith<$Res> {
  factory _$ToSChangedCopyWith(
          _ToSChanged value, $Res Function(_ToSChanged) then) =
      __$ToSChangedCopyWithImpl<$Res>;
  $Res call({bool tos});
}

class __$ToSChangedCopyWithImpl<$Res> extends _$SignUpEventCopyWithImpl<$Res>
    implements _$ToSChangedCopyWith<$Res> {
  __$ToSChangedCopyWithImpl(
      _ToSChanged _value, $Res Function(_ToSChanged) _then)
      : super(_value, (v) => _then(v as _ToSChanged));

  @override
  _ToSChanged get _value => super._value as _ToSChanged;

  @override
  $Res call({
    Object tos = freezed,
  }) {
    return _then(_ToSChanged(
      tos: tos == freezed ? _value.tos : tos as bool,
    ));
  }
}

class _$_ToSChanged with DiagnosticableTreeMixin implements _ToSChanged {
  const _$_ToSChanged({this.tos});

  @override
  final bool tos;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SignUpEvent.tosChanged(tos: $tos)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SignUpEvent.tosChanged'))
      ..add(DiagnosticsProperty('tos', tos));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ToSChanged &&
            (identical(other.tos, tos) ||
                const DeepCollectionEquality().equals(other.tos, tos)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(tos);

  @override
  _$ToSChangedCopyWith<_ToSChanged> get copyWith =>
      __$ToSChangedCopyWithImpl<_ToSChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result emailChanged(String email),
    @required Result passwordChanged(String password),
    @required Result tosChanged(bool tos),
    @required Result submitted(),
  }) {
    assert(emailChanged != null);
    assert(passwordChanged != null);
    assert(tosChanged != null);
    assert(submitted != null);
    return tosChanged(tos);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result emailChanged(String email),
    Result passwordChanged(String password),
    Result tosChanged(bool tos),
    Result submitted(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (tosChanged != null) {
      return tosChanged(tos);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result emailChanged(_EmailChanged value),
    @required Result passwordChanged(_PasswordChanged value),
    @required Result tosChanged(_ToSChanged value),
    @required Result submitted(_Submitted value),
  }) {
    assert(emailChanged != null);
    assert(passwordChanged != null);
    assert(tosChanged != null);
    assert(submitted != null);
    return tosChanged(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result emailChanged(_EmailChanged value),
    Result passwordChanged(_PasswordChanged value),
    Result tosChanged(_ToSChanged value),
    Result submitted(_Submitted value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (tosChanged != null) {
      return tosChanged(this);
    }
    return orElse();
  }
}

abstract class _ToSChanged implements SignUpEvent {
  const factory _ToSChanged({bool tos}) = _$_ToSChanged;

  bool get tos;
  _$ToSChangedCopyWith<_ToSChanged> get copyWith;
}

abstract class _$SubmittedCopyWith<$Res> {
  factory _$SubmittedCopyWith(
          _Submitted value, $Res Function(_Submitted) then) =
      __$SubmittedCopyWithImpl<$Res>;
}

class __$SubmittedCopyWithImpl<$Res> extends _$SignUpEventCopyWithImpl<$Res>
    implements _$SubmittedCopyWith<$Res> {
  __$SubmittedCopyWithImpl(_Submitted _value, $Res Function(_Submitted) _then)
      : super(_value, (v) => _then(v as _Submitted));

  @override
  _Submitted get _value => super._value as _Submitted;
}

class _$_Submitted with DiagnosticableTreeMixin implements _Submitted {
  const _$_Submitted();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SignUpEvent.submitted()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'SignUpEvent.submitted'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Submitted);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result emailChanged(String email),
    @required Result passwordChanged(String password),
    @required Result tosChanged(bool tos),
    @required Result submitted(),
  }) {
    assert(emailChanged != null);
    assert(passwordChanged != null);
    assert(tosChanged != null);
    assert(submitted != null);
    return submitted();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result emailChanged(String email),
    Result passwordChanged(String password),
    Result tosChanged(bool tos),
    Result submitted(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (submitted != null) {
      return submitted();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result emailChanged(_EmailChanged value),
    @required Result passwordChanged(_PasswordChanged value),
    @required Result tosChanged(_ToSChanged value),
    @required Result submitted(_Submitted value),
  }) {
    assert(emailChanged != null);
    assert(passwordChanged != null);
    assert(tosChanged != null);
    assert(submitted != null);
    return submitted(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result emailChanged(_EmailChanged value),
    Result passwordChanged(_PasswordChanged value),
    Result tosChanged(_ToSChanged value),
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
  const factory _Submitted() = _$_Submitted;
}

class _$SignUpStateTearOff {
  const _$SignUpStateTearOff();

  _SignUpState call(
      {String email = '',
      String password = '',
      bool tosAccepted = false,
      bool isSubmitting = false,
      bool isVerificationEmailSent = false,
      @nullable AppException exceptionRaised}) {
    return _SignUpState(
      email: email,
      password: password,
      tosAccepted: tosAccepted,
      isSubmitting: isSubmitting,
      isVerificationEmailSent: isVerificationEmailSent,
      exceptionRaised: exceptionRaised,
    );
  }
}

// ignore: unused_element
const $SignUpState = _$SignUpStateTearOff();

mixin _$SignUpState {
  String get email;
  String get password;
  bool get tosAccepted;
  bool get isSubmitting;
  bool get isVerificationEmailSent;
  @nullable
  AppException get exceptionRaised;

  $SignUpStateCopyWith<SignUpState> get copyWith;
}

abstract class $SignUpStateCopyWith<$Res> {
  factory $SignUpStateCopyWith(
          SignUpState value, $Res Function(SignUpState) then) =
      _$SignUpStateCopyWithImpl<$Res>;
  $Res call(
      {String email,
      String password,
      bool tosAccepted,
      bool isSubmitting,
      bool isVerificationEmailSent,
      @nullable AppException exceptionRaised});
}

class _$SignUpStateCopyWithImpl<$Res> implements $SignUpStateCopyWith<$Res> {
  _$SignUpStateCopyWithImpl(this._value, this._then);

  final SignUpState _value;
  // ignore: unused_field
  final $Res Function(SignUpState) _then;

  @override
  $Res call({
    Object email = freezed,
    Object password = freezed,
    Object tosAccepted = freezed,
    Object isSubmitting = freezed,
    Object isVerificationEmailSent = freezed,
    Object exceptionRaised = freezed,
  }) {
    return _then(_value.copyWith(
      email: email == freezed ? _value.email : email as String,
      password: password == freezed ? _value.password : password as String,
      tosAccepted:
          tosAccepted == freezed ? _value.tosAccepted : tosAccepted as bool,
      isSubmitting:
          isSubmitting == freezed ? _value.isSubmitting : isSubmitting as bool,
      isVerificationEmailSent: isVerificationEmailSent == freezed
          ? _value.isVerificationEmailSent
          : isVerificationEmailSent as bool,
      exceptionRaised: exceptionRaised == freezed
          ? _value.exceptionRaised
          : exceptionRaised as AppException,
    ));
  }
}

abstract class _$SignUpStateCopyWith<$Res>
    implements $SignUpStateCopyWith<$Res> {
  factory _$SignUpStateCopyWith(
          _SignUpState value, $Res Function(_SignUpState) then) =
      __$SignUpStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {String email,
      String password,
      bool tosAccepted,
      bool isSubmitting,
      bool isVerificationEmailSent,
      @nullable AppException exceptionRaised});
}

class __$SignUpStateCopyWithImpl<$Res> extends _$SignUpStateCopyWithImpl<$Res>
    implements _$SignUpStateCopyWith<$Res> {
  __$SignUpStateCopyWithImpl(
      _SignUpState _value, $Res Function(_SignUpState) _then)
      : super(_value, (v) => _then(v as _SignUpState));

  @override
  _SignUpState get _value => super._value as _SignUpState;

  @override
  $Res call({
    Object email = freezed,
    Object password = freezed,
    Object tosAccepted = freezed,
    Object isSubmitting = freezed,
    Object isVerificationEmailSent = freezed,
    Object exceptionRaised = freezed,
  }) {
    return _then(_SignUpState(
      email: email == freezed ? _value.email : email as String,
      password: password == freezed ? _value.password : password as String,
      tosAccepted:
          tosAccepted == freezed ? _value.tosAccepted : tosAccepted as bool,
      isSubmitting:
          isSubmitting == freezed ? _value.isSubmitting : isSubmitting as bool,
      isVerificationEmailSent: isVerificationEmailSent == freezed
          ? _value.isVerificationEmailSent
          : isVerificationEmailSent as bool,
      exceptionRaised: exceptionRaised == freezed
          ? _value.exceptionRaised
          : exceptionRaised as AppException,
    ));
  }
}

class _$_SignUpState extends _SignUpState with DiagnosticableTreeMixin {
  const _$_SignUpState(
      {this.email = '',
      this.password = '',
      this.tosAccepted = false,
      this.isSubmitting = false,
      this.isVerificationEmailSent = false,
      @nullable this.exceptionRaised})
      : assert(email != null),
        assert(password != null),
        assert(tosAccepted != null),
        assert(isSubmitting != null),
        assert(isVerificationEmailSent != null),
        super._();

  @JsonKey(defaultValue: '')
  @override
  final String email;
  @JsonKey(defaultValue: '')
  @override
  final String password;
  @JsonKey(defaultValue: false)
  @override
  final bool tosAccepted;
  @JsonKey(defaultValue: false)
  @override
  final bool isSubmitting;
  @JsonKey(defaultValue: false)
  @override
  final bool isVerificationEmailSent;
  @override
  @nullable
  final AppException exceptionRaised;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SignUpState(email: $email, password: $password, tosAccepted: $tosAccepted, isSubmitting: $isSubmitting, isVerificationEmailSent: $isVerificationEmailSent, exceptionRaised: $exceptionRaised)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SignUpState'))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('password', password))
      ..add(DiagnosticsProperty('tosAccepted', tosAccepted))
      ..add(DiagnosticsProperty('isSubmitting', isSubmitting))
      ..add(DiagnosticsProperty(
          'isVerificationEmailSent', isVerificationEmailSent))
      ..add(DiagnosticsProperty('exceptionRaised', exceptionRaised));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SignUpState &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)) &&
            (identical(other.tosAccepted, tosAccepted) ||
                const DeepCollectionEquality()
                    .equals(other.tosAccepted, tosAccepted)) &&
            (identical(other.isSubmitting, isSubmitting) ||
                const DeepCollectionEquality()
                    .equals(other.isSubmitting, isSubmitting)) &&
            (identical(
                    other.isVerificationEmailSent, isVerificationEmailSent) ||
                const DeepCollectionEquality().equals(
                    other.isVerificationEmailSent, isVerificationEmailSent)) &&
            (identical(other.exceptionRaised, exceptionRaised) ||
                const DeepCollectionEquality()
                    .equals(other.exceptionRaised, exceptionRaised)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(password) ^
      const DeepCollectionEquality().hash(tosAccepted) ^
      const DeepCollectionEquality().hash(isSubmitting) ^
      const DeepCollectionEquality().hash(isVerificationEmailSent) ^
      const DeepCollectionEquality().hash(exceptionRaised);

  @override
  _$SignUpStateCopyWith<_SignUpState> get copyWith =>
      __$SignUpStateCopyWithImpl<_SignUpState>(this, _$identity);
}

abstract class _SignUpState extends SignUpState {
  const _SignUpState._() : super._();
  const factory _SignUpState(
      {String email,
      String password,
      bool tosAccepted,
      bool isSubmitting,
      bool isVerificationEmailSent,
      @nullable AppException exceptionRaised}) = _$_SignUpState;

  @override
  String get email;
  @override
  String get password;
  @override
  bool get tosAccepted;
  @override
  bool get isSubmitting;
  @override
  bool get isVerificationEmailSent;
  @override
  @nullable
  AppException get exceptionRaised;
  @override
  _$SignUpStateCopyWith<_SignUpState> get copyWith;
}
