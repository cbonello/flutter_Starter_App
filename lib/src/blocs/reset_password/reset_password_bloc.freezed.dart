// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'reset_password_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$ResetPasswordEventTearOff {
  const _$ResetPasswordEventTearOff();

  _EmailChanged emailChanged({String email}) {
    return _EmailChanged(
      email: email,
    );
  }

  _ResetPressed resetPressed() {
    return const _ResetPressed();
  }
}

// ignore: unused_element
const $ResetPasswordEvent = _$ResetPasswordEventTearOff();

mixin _$ResetPasswordEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result emailChanged(String email),
    @required Result resetPressed(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result emailChanged(String email),
    Result resetPressed(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result emailChanged(_EmailChanged value),
    @required Result resetPressed(_ResetPressed value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result emailChanged(_EmailChanged value),
    Result resetPressed(_ResetPressed value),
    @required Result orElse(),
  });
}

abstract class $ResetPasswordEventCopyWith<$Res> {
  factory $ResetPasswordEventCopyWith(
          ResetPasswordEvent value, $Res Function(ResetPasswordEvent) then) =
      _$ResetPasswordEventCopyWithImpl<$Res>;
}

class _$ResetPasswordEventCopyWithImpl<$Res>
    implements $ResetPasswordEventCopyWith<$Res> {
  _$ResetPasswordEventCopyWithImpl(this._value, this._then);

  final ResetPasswordEvent _value;
  // ignore: unused_field
  final $Res Function(ResetPasswordEvent) _then;
}

abstract class _$EmailChangedCopyWith<$Res> {
  factory _$EmailChangedCopyWith(
          _EmailChanged value, $Res Function(_EmailChanged) then) =
      __$EmailChangedCopyWithImpl<$Res>;
  $Res call({String email});
}

class __$EmailChangedCopyWithImpl<$Res>
    extends _$ResetPasswordEventCopyWithImpl<$Res>
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
    return 'ResetPasswordEvent.emailChanged(email: $email)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ResetPasswordEvent.emailChanged'))
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
    @required Result resetPressed(),
  }) {
    assert(emailChanged != null);
    assert(resetPressed != null);
    return emailChanged(email);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result emailChanged(String email),
    Result resetPressed(),
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
    @required Result resetPressed(_ResetPressed value),
  }) {
    assert(emailChanged != null);
    assert(resetPressed != null);
    return emailChanged(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result emailChanged(_EmailChanged value),
    Result resetPressed(_ResetPressed value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (emailChanged != null) {
      return emailChanged(this);
    }
    return orElse();
  }
}

abstract class _EmailChanged implements ResetPasswordEvent {
  const factory _EmailChanged({String email}) = _$_EmailChanged;

  String get email;
  _$EmailChangedCopyWith<_EmailChanged> get copyWith;
}

abstract class _$ResetPressedCopyWith<$Res> {
  factory _$ResetPressedCopyWith(
          _ResetPressed value, $Res Function(_ResetPressed) then) =
      __$ResetPressedCopyWithImpl<$Res>;
}

class __$ResetPressedCopyWithImpl<$Res>
    extends _$ResetPasswordEventCopyWithImpl<$Res>
    implements _$ResetPressedCopyWith<$Res> {
  __$ResetPressedCopyWithImpl(
      _ResetPressed _value, $Res Function(_ResetPressed) _then)
      : super(_value, (v) => _then(v as _ResetPressed));

  @override
  _ResetPressed get _value => super._value as _ResetPressed;
}

class _$_ResetPressed with DiagnosticableTreeMixin implements _ResetPressed {
  const _$_ResetPressed();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ResetPasswordEvent.resetPressed()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ResetPasswordEvent.resetPressed'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _ResetPressed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result emailChanged(String email),
    @required Result resetPressed(),
  }) {
    assert(emailChanged != null);
    assert(resetPressed != null);
    return resetPressed();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result emailChanged(String email),
    Result resetPressed(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (resetPressed != null) {
      return resetPressed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result emailChanged(_EmailChanged value),
    @required Result resetPressed(_ResetPressed value),
  }) {
    assert(emailChanged != null);
    assert(resetPressed != null);
    return resetPressed(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result emailChanged(_EmailChanged value),
    Result resetPressed(_ResetPressed value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (resetPressed != null) {
      return resetPressed(this);
    }
    return orElse();
  }
}

abstract class _ResetPressed implements ResetPasswordEvent {
  const factory _ResetPressed() = _$_ResetPressed;
}

class _$ResetPasswordStateTearOff {
  const _$ResetPasswordStateTearOff();

  _ResetPasswordState call(
      {String email = '',
      bool isSubmitting = false,
      bool isResetEmailSent = false,
      @nullable AppException exceptionRaised}) {
    return _ResetPasswordState(
      email: email,
      isSubmitting: isSubmitting,
      isResetEmailSent: isResetEmailSent,
      exceptionRaised: exceptionRaised,
    );
  }
}

// ignore: unused_element
const $ResetPasswordState = _$ResetPasswordStateTearOff();

mixin _$ResetPasswordState {
  String get email;
  bool get isSubmitting;
  bool get isResetEmailSent;
  @nullable
  AppException get exceptionRaised;

  $ResetPasswordStateCopyWith<ResetPasswordState> get copyWith;
}

abstract class $ResetPasswordStateCopyWith<$Res> {
  factory $ResetPasswordStateCopyWith(
          ResetPasswordState value, $Res Function(ResetPasswordState) then) =
      _$ResetPasswordStateCopyWithImpl<$Res>;
  $Res call(
      {String email,
      bool isSubmitting,
      bool isResetEmailSent,
      @nullable AppException exceptionRaised});
}

class _$ResetPasswordStateCopyWithImpl<$Res>
    implements $ResetPasswordStateCopyWith<$Res> {
  _$ResetPasswordStateCopyWithImpl(this._value, this._then);

  final ResetPasswordState _value;
  // ignore: unused_field
  final $Res Function(ResetPasswordState) _then;

  @override
  $Res call({
    Object email = freezed,
    Object isSubmitting = freezed,
    Object isResetEmailSent = freezed,
    Object exceptionRaised = freezed,
  }) {
    return _then(_value.copyWith(
      email: email == freezed ? _value.email : email as String,
      isSubmitting:
          isSubmitting == freezed ? _value.isSubmitting : isSubmitting as bool,
      isResetEmailSent: isResetEmailSent == freezed
          ? _value.isResetEmailSent
          : isResetEmailSent as bool,
      exceptionRaised: exceptionRaised == freezed
          ? _value.exceptionRaised
          : exceptionRaised as AppException,
    ));
  }
}

abstract class _$ResetPasswordStateCopyWith<$Res>
    implements $ResetPasswordStateCopyWith<$Res> {
  factory _$ResetPasswordStateCopyWith(
          _ResetPasswordState value, $Res Function(_ResetPasswordState) then) =
      __$ResetPasswordStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {String email,
      bool isSubmitting,
      bool isResetEmailSent,
      @nullable AppException exceptionRaised});
}

class __$ResetPasswordStateCopyWithImpl<$Res>
    extends _$ResetPasswordStateCopyWithImpl<$Res>
    implements _$ResetPasswordStateCopyWith<$Res> {
  __$ResetPasswordStateCopyWithImpl(
      _ResetPasswordState _value, $Res Function(_ResetPasswordState) _then)
      : super(_value, (v) => _then(v as _ResetPasswordState));

  @override
  _ResetPasswordState get _value => super._value as _ResetPasswordState;

  @override
  $Res call({
    Object email = freezed,
    Object isSubmitting = freezed,
    Object isResetEmailSent = freezed,
    Object exceptionRaised = freezed,
  }) {
    return _then(_ResetPasswordState(
      email: email == freezed ? _value.email : email as String,
      isSubmitting:
          isSubmitting == freezed ? _value.isSubmitting : isSubmitting as bool,
      isResetEmailSent: isResetEmailSent == freezed
          ? _value.isResetEmailSent
          : isResetEmailSent as bool,
      exceptionRaised: exceptionRaised == freezed
          ? _value.exceptionRaised
          : exceptionRaised as AppException,
    ));
  }
}

class _$_ResetPasswordState extends _ResetPasswordState
    with DiagnosticableTreeMixin {
  const _$_ResetPasswordState(
      {this.email = '',
      this.isSubmitting = false,
      this.isResetEmailSent = false,
      @nullable this.exceptionRaised})
      : assert(email != null),
        assert(isSubmitting != null),
        assert(isResetEmailSent != null),
        super._();

  @JsonKey(defaultValue: '')
  @override
  final String email;
  @JsonKey(defaultValue: false)
  @override
  final bool isSubmitting;
  @JsonKey(defaultValue: false)
  @override
  final bool isResetEmailSent;
  @override
  @nullable
  final AppException exceptionRaised;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ResetPasswordState(email: $email, isSubmitting: $isSubmitting, isResetEmailSent: $isResetEmailSent, exceptionRaised: $exceptionRaised)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ResetPasswordState'))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('isSubmitting', isSubmitting))
      ..add(DiagnosticsProperty('isResetEmailSent', isResetEmailSent))
      ..add(DiagnosticsProperty('exceptionRaised', exceptionRaised));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ResetPasswordState &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.isSubmitting, isSubmitting) ||
                const DeepCollectionEquality()
                    .equals(other.isSubmitting, isSubmitting)) &&
            (identical(other.isResetEmailSent, isResetEmailSent) ||
                const DeepCollectionEquality()
                    .equals(other.isResetEmailSent, isResetEmailSent)) &&
            (identical(other.exceptionRaised, exceptionRaised) ||
                const DeepCollectionEquality()
                    .equals(other.exceptionRaised, exceptionRaised)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(isSubmitting) ^
      const DeepCollectionEquality().hash(isResetEmailSent) ^
      const DeepCollectionEquality().hash(exceptionRaised);

  @override
  _$ResetPasswordStateCopyWith<_ResetPasswordState> get copyWith =>
      __$ResetPasswordStateCopyWithImpl<_ResetPasswordState>(this, _$identity);
}

abstract class _ResetPasswordState extends ResetPasswordState {
  const _ResetPasswordState._() : super._();
  const factory _ResetPasswordState(
      {String email,
      bool isSubmitting,
      bool isResetEmailSent,
      @nullable AppException exceptionRaised}) = _$_ResetPasswordState;

  @override
  String get email;
  @override
  bool get isSubmitting;
  @override
  bool get isResetEmailSent;
  @override
  @nullable
  AppException get exceptionRaised;
  @override
  _$ResetPasswordStateCopyWith<_ResetPasswordState> get copyWith;
}
