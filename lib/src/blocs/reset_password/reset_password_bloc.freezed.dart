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

  _ResetPressed resetPressed({String email}) {
    return _ResetPressed(
      email: email,
    );
  }
}

// ignore: unused_element
const $ResetPasswordEvent = _$ResetPasswordEventTearOff();

mixin _$ResetPasswordEvent {
  String get email;

  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result emailChanged(String email),
    @required Result resetPressed(String email),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result emailChanged(String email),
    Result resetPressed(String email),
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

  $ResetPasswordEventCopyWith<ResetPasswordEvent> get copyWith;
}

abstract class $ResetPasswordEventCopyWith<$Res> {
  factory $ResetPasswordEventCopyWith(
          ResetPasswordEvent value, $Res Function(ResetPasswordEvent) then) =
      _$ResetPasswordEventCopyWithImpl<$Res>;
  $Res call({String email});
}

class _$ResetPasswordEventCopyWithImpl<$Res>
    implements $ResetPasswordEventCopyWith<$Res> {
  _$ResetPasswordEventCopyWithImpl(this._value, this._then);

  final ResetPasswordEvent _value;
  // ignore: unused_field
  final $Res Function(ResetPasswordEvent) _then;

  @override
  $Res call({
    Object email = freezed,
  }) {
    return _then(_value.copyWith(
      email: email == freezed ? _value.email : email as String,
    ));
  }
}

abstract class _$EmailChangedCopyWith<$Res>
    implements $ResetPasswordEventCopyWith<$Res> {
  factory _$EmailChangedCopyWith(
          _EmailChanged value, $Res Function(_EmailChanged) then) =
      __$EmailChangedCopyWithImpl<$Res>;
  @override
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
    @required Result resetPressed(String email),
  }) {
    assert(emailChanged != null);
    assert(resetPressed != null);
    return emailChanged(email);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result emailChanged(String email),
    Result resetPressed(String email),
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

  @override
  String get email;
  @override
  _$EmailChangedCopyWith<_EmailChanged> get copyWith;
}

abstract class _$ResetPressedCopyWith<$Res>
    implements $ResetPasswordEventCopyWith<$Res> {
  factory _$ResetPressedCopyWith(
          _ResetPressed value, $Res Function(_ResetPressed) then) =
      __$ResetPressedCopyWithImpl<$Res>;
  @override
  $Res call({String email});
}

class __$ResetPressedCopyWithImpl<$Res>
    extends _$ResetPasswordEventCopyWithImpl<$Res>
    implements _$ResetPressedCopyWith<$Res> {
  __$ResetPressedCopyWithImpl(
      _ResetPressed _value, $Res Function(_ResetPressed) _then)
      : super(_value, (v) => _then(v as _ResetPressed));

  @override
  _ResetPressed get _value => super._value as _ResetPressed;

  @override
  $Res call({
    Object email = freezed,
  }) {
    return _then(_ResetPressed(
      email: email == freezed ? _value.email : email as String,
    ));
  }
}

class _$_ResetPressed with DiagnosticableTreeMixin implements _ResetPressed {
  const _$_ResetPressed({this.email});

  @override
  final String email;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ResetPasswordEvent.resetPressed(email: $email)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ResetPasswordEvent.resetPressed'))
      ..add(DiagnosticsProperty('email', email));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ResetPressed &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(email);

  @override
  _$ResetPressedCopyWith<_ResetPressed> get copyWith =>
      __$ResetPressedCopyWithImpl<_ResetPressed>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result emailChanged(String email),
    @required Result resetPressed(String email),
  }) {
    assert(emailChanged != null);
    assert(resetPressed != null);
    return resetPressed(email);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result emailChanged(String email),
    Result resetPressed(String email),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (resetPressed != null) {
      return resetPressed(email);
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
  const factory _ResetPressed({String email}) = _$_ResetPressed;

  @override
  String get email;
  @override
  _$ResetPressedCopyWith<_ResetPressed> get copyWith;
}

class _$ResetPasswordStateTearOff {
  const _$ResetPasswordStateTearOff();

  _Empty empty(
      {bool isEmailValid = true,
      bool isSubmitting = false,
      bool isSuccess = false,
      @nullable String email,
      @nullable AppException exceptionRaised}) {
    return _Empty(
      isEmailValid: isEmailValid,
      isSubmitting: isSubmitting,
      isSuccess: isSuccess,
      email: email,
      exceptionRaised: exceptionRaised,
    );
  }

  _Resetting resetting(
      {bool isEmailValid = true,
      bool isSubmitting = true,
      bool isSuccess = false,
      @nullable String email,
      @nullable AppException exceptionRaised}) {
    return _Resetting(
      isEmailValid: isEmailValid,
      isSubmitting: isSubmitting,
      isSuccess: isSuccess,
      email: email,
      exceptionRaised: exceptionRaised,
    );
  }

  _Failure failure(
      {bool isEmailValid = true,
      bool isSubmitting = false,
      bool isSuccess = false,
      @nullable String email,
      AppException exceptionRaised}) {
    return _Failure(
      isEmailValid: isEmailValid,
      isSubmitting: isSubmitting,
      isSuccess: isSuccess,
      email: email,
      exceptionRaised: exceptionRaised,
    );
  }

  _Success success(
      {bool isEmailValid = true,
      bool isSubmitting = false,
      bool isSuccess = true,
      String email,
      @nullable AppException exceptionRaised}) {
    return _Success(
      isEmailValid: isEmailValid,
      isSubmitting: isSubmitting,
      isSuccess: isSuccess,
      email: email,
      exceptionRaised: exceptionRaised,
    );
  }
}

// ignore: unused_element
const $ResetPasswordState = _$ResetPasswordStateTearOff();

mixin _$ResetPasswordState {
  bool get isEmailValid;
  bool get isSubmitting;
  bool get isSuccess;
  @nullable
  String get email;
  @nullable
  AppException get exceptionRaised;

  @optionalTypeArgs
  Result when<Result extends Object>({
    @required
        Result empty(bool isEmailValid, bool isSubmitting, bool isSuccess,
            @nullable String email, @nullable AppException exceptionRaised),
    @required
        Result resetting(bool isEmailValid, bool isSubmitting, bool isSuccess,
            @nullable String email, @nullable AppException exceptionRaised),
    @required
        Result failure(bool isEmailValid, bool isSubmitting, bool isSuccess,
            @nullable String email, AppException exceptionRaised),
    @required
        Result success(bool isEmailValid, bool isSubmitting, bool isSuccess,
            String email, @nullable AppException exceptionRaised),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result empty(bool isEmailValid, bool isSubmitting, bool isSuccess,
        @nullable String email, @nullable AppException exceptionRaised),
    Result resetting(bool isEmailValid, bool isSubmitting, bool isSuccess,
        @nullable String email, @nullable AppException exceptionRaised),
    Result failure(bool isEmailValid, bool isSubmitting, bool isSuccess,
        @nullable String email, AppException exceptionRaised),
    Result success(bool isEmailValid, bool isSubmitting, bool isSuccess,
        String email, @nullable AppException exceptionRaised),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result empty(_Empty value),
    @required Result resetting(_Resetting value),
    @required Result failure(_Failure value),
    @required Result success(_Success value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result empty(_Empty value),
    Result resetting(_Resetting value),
    Result failure(_Failure value),
    Result success(_Success value),
    @required Result orElse(),
  });

  $ResetPasswordStateCopyWith<ResetPasswordState> get copyWith;
}

abstract class $ResetPasswordStateCopyWith<$Res> {
  factory $ResetPasswordStateCopyWith(
          ResetPasswordState value, $Res Function(ResetPasswordState) then) =
      _$ResetPasswordStateCopyWithImpl<$Res>;
  $Res call(
      {bool isEmailValid,
      bool isSubmitting,
      bool isSuccess,
      @nullable String email,
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
    Object isEmailValid = freezed,
    Object isSubmitting = freezed,
    Object isSuccess = freezed,
    Object email = freezed,
    Object exceptionRaised = freezed,
  }) {
    return _then(_value.copyWith(
      isEmailValid:
          isEmailValid == freezed ? _value.isEmailValid : isEmailValid as bool,
      isSubmitting:
          isSubmitting == freezed ? _value.isSubmitting : isSubmitting as bool,
      isSuccess: isSuccess == freezed ? _value.isSuccess : isSuccess as bool,
      email: email == freezed ? _value.email : email as String,
      exceptionRaised: exceptionRaised == freezed
          ? _value.exceptionRaised
          : exceptionRaised as AppException,
    ));
  }
}

abstract class _$EmptyCopyWith<$Res>
    implements $ResetPasswordStateCopyWith<$Res> {
  factory _$EmptyCopyWith(_Empty value, $Res Function(_Empty) then) =
      __$EmptyCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isEmailValid,
      bool isSubmitting,
      bool isSuccess,
      @nullable String email,
      @nullable AppException exceptionRaised});
}

class __$EmptyCopyWithImpl<$Res> extends _$ResetPasswordStateCopyWithImpl<$Res>
    implements _$EmptyCopyWith<$Res> {
  __$EmptyCopyWithImpl(_Empty _value, $Res Function(_Empty) _then)
      : super(_value, (v) => _then(v as _Empty));

  @override
  _Empty get _value => super._value as _Empty;

  @override
  $Res call({
    Object isEmailValid = freezed,
    Object isSubmitting = freezed,
    Object isSuccess = freezed,
    Object email = freezed,
    Object exceptionRaised = freezed,
  }) {
    return _then(_Empty(
      isEmailValid:
          isEmailValid == freezed ? _value.isEmailValid : isEmailValid as bool,
      isSubmitting:
          isSubmitting == freezed ? _value.isSubmitting : isSubmitting as bool,
      isSuccess: isSuccess == freezed ? _value.isSuccess : isSuccess as bool,
      email: email == freezed ? _value.email : email as String,
      exceptionRaised: exceptionRaised == freezed
          ? _value.exceptionRaised
          : exceptionRaised as AppException,
    ));
  }
}

class _$_Empty extends _Empty with DiagnosticableTreeMixin {
  _$_Empty(
      {this.isEmailValid = true,
      this.isSubmitting = false,
      this.isSuccess = false,
      @nullable this.email,
      @nullable this.exceptionRaised})
      : assert(isEmailValid != null),
        assert(isSubmitting != null),
        assert(isSuccess != null),
        super._();

  @JsonKey(defaultValue: true)
  @override
  final bool isEmailValid;
  @JsonKey(defaultValue: false)
  @override
  final bool isSubmitting;
  @JsonKey(defaultValue: false)
  @override
  final bool isSuccess;
  @override
  @nullable
  final String email;
  @override
  @nullable
  final AppException exceptionRaised;

  bool _didisFormValid = false;
  bool _isFormValid;

  @override
  bool get isFormValid {
    if (_didisFormValid == false) {
      _didisFormValid = true;
      _isFormValid = isEmailValid;
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
    return 'ResetPasswordState.empty(isEmailValid: $isEmailValid, isSubmitting: $isSubmitting, isSuccess: $isSuccess, email: $email, exceptionRaised: $exceptionRaised, isFormValid: $isFormValid, isFailure: $isFailure)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ResetPasswordState.empty'))
      ..add(DiagnosticsProperty('isEmailValid', isEmailValid))
      ..add(DiagnosticsProperty('isSubmitting', isSubmitting))
      ..add(DiagnosticsProperty('isSuccess', isSuccess))
      ..add(DiagnosticsProperty('email', email))
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
            (identical(other.isSubmitting, isSubmitting) ||
                const DeepCollectionEquality()
                    .equals(other.isSubmitting, isSubmitting)) &&
            (identical(other.isSuccess, isSuccess) ||
                const DeepCollectionEquality()
                    .equals(other.isSuccess, isSuccess)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.exceptionRaised, exceptionRaised) ||
                const DeepCollectionEquality()
                    .equals(other.exceptionRaised, exceptionRaised)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(isEmailValid) ^
      const DeepCollectionEquality().hash(isSubmitting) ^
      const DeepCollectionEquality().hash(isSuccess) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(exceptionRaised);

  @override
  _$EmptyCopyWith<_Empty> get copyWith =>
      __$EmptyCopyWithImpl<_Empty>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required
        Result empty(bool isEmailValid, bool isSubmitting, bool isSuccess,
            @nullable String email, @nullable AppException exceptionRaised),
    @required
        Result resetting(bool isEmailValid, bool isSubmitting, bool isSuccess,
            @nullable String email, @nullable AppException exceptionRaised),
    @required
        Result failure(bool isEmailValid, bool isSubmitting, bool isSuccess,
            @nullable String email, AppException exceptionRaised),
    @required
        Result success(bool isEmailValid, bool isSubmitting, bool isSuccess,
            String email, @nullable AppException exceptionRaised),
  }) {
    assert(empty != null);
    assert(resetting != null);
    assert(failure != null);
    assert(success != null);
    return empty(isEmailValid, isSubmitting, isSuccess, email, exceptionRaised);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result empty(bool isEmailValid, bool isSubmitting, bool isSuccess,
        @nullable String email, @nullable AppException exceptionRaised),
    Result resetting(bool isEmailValid, bool isSubmitting, bool isSuccess,
        @nullable String email, @nullable AppException exceptionRaised),
    Result failure(bool isEmailValid, bool isSubmitting, bool isSuccess,
        @nullable String email, AppException exceptionRaised),
    Result success(bool isEmailValid, bool isSubmitting, bool isSuccess,
        String email, @nullable AppException exceptionRaised),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (empty != null) {
      return empty(
          isEmailValid, isSubmitting, isSuccess, email, exceptionRaised);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result empty(_Empty value),
    @required Result resetting(_Resetting value),
    @required Result failure(_Failure value),
    @required Result success(_Success value),
  }) {
    assert(empty != null);
    assert(resetting != null);
    assert(failure != null);
    assert(success != null);
    return empty(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result empty(_Empty value),
    Result resetting(_Resetting value),
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

abstract class _Empty extends ResetPasswordState {
  _Empty._() : super._();
  factory _Empty(
      {bool isEmailValid,
      bool isSubmitting,
      bool isSuccess,
      @nullable String email,
      @nullable AppException exceptionRaised}) = _$_Empty;

  @override
  bool get isEmailValid;
  @override
  bool get isSubmitting;
  @override
  bool get isSuccess;
  @override
  @nullable
  String get email;
  @override
  @nullable
  AppException get exceptionRaised;
  @override
  _$EmptyCopyWith<_Empty> get copyWith;
}

abstract class _$ResettingCopyWith<$Res>
    implements $ResetPasswordStateCopyWith<$Res> {
  factory _$ResettingCopyWith(
          _Resetting value, $Res Function(_Resetting) then) =
      __$ResettingCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isEmailValid,
      bool isSubmitting,
      bool isSuccess,
      @nullable String email,
      @nullable AppException exceptionRaised});
}

class __$ResettingCopyWithImpl<$Res>
    extends _$ResetPasswordStateCopyWithImpl<$Res>
    implements _$ResettingCopyWith<$Res> {
  __$ResettingCopyWithImpl(_Resetting _value, $Res Function(_Resetting) _then)
      : super(_value, (v) => _then(v as _Resetting));

  @override
  _Resetting get _value => super._value as _Resetting;

  @override
  $Res call({
    Object isEmailValid = freezed,
    Object isSubmitting = freezed,
    Object isSuccess = freezed,
    Object email = freezed,
    Object exceptionRaised = freezed,
  }) {
    return _then(_Resetting(
      isEmailValid:
          isEmailValid == freezed ? _value.isEmailValid : isEmailValid as bool,
      isSubmitting:
          isSubmitting == freezed ? _value.isSubmitting : isSubmitting as bool,
      isSuccess: isSuccess == freezed ? _value.isSuccess : isSuccess as bool,
      email: email == freezed ? _value.email : email as String,
      exceptionRaised: exceptionRaised == freezed
          ? _value.exceptionRaised
          : exceptionRaised as AppException,
    ));
  }
}

class _$_Resetting extends _Resetting with DiagnosticableTreeMixin {
  _$_Resetting(
      {this.isEmailValid = true,
      this.isSubmitting = true,
      this.isSuccess = false,
      @nullable this.email,
      @nullable this.exceptionRaised})
      : assert(isEmailValid != null),
        assert(isSubmitting != null),
        assert(isSuccess != null),
        super._();

  @JsonKey(defaultValue: true)
  @override
  final bool isEmailValid;
  @JsonKey(defaultValue: true)
  @override
  final bool isSubmitting;
  @JsonKey(defaultValue: false)
  @override
  final bool isSuccess;
  @override
  @nullable
  final String email;
  @override
  @nullable
  final AppException exceptionRaised;

  bool _didisFormValid = false;
  bool _isFormValid;

  @override
  bool get isFormValid {
    if (_didisFormValid == false) {
      _didisFormValid = true;
      _isFormValid = isEmailValid;
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
    return 'ResetPasswordState.resetting(isEmailValid: $isEmailValid, isSubmitting: $isSubmitting, isSuccess: $isSuccess, email: $email, exceptionRaised: $exceptionRaised, isFormValid: $isFormValid, isFailure: $isFailure)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ResetPasswordState.resetting'))
      ..add(DiagnosticsProperty('isEmailValid', isEmailValid))
      ..add(DiagnosticsProperty('isSubmitting', isSubmitting))
      ..add(DiagnosticsProperty('isSuccess', isSuccess))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('exceptionRaised', exceptionRaised))
      ..add(DiagnosticsProperty('isFormValid', isFormValid))
      ..add(DiagnosticsProperty('isFailure', isFailure));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Resetting &&
            (identical(other.isEmailValid, isEmailValid) ||
                const DeepCollectionEquality()
                    .equals(other.isEmailValid, isEmailValid)) &&
            (identical(other.isSubmitting, isSubmitting) ||
                const DeepCollectionEquality()
                    .equals(other.isSubmitting, isSubmitting)) &&
            (identical(other.isSuccess, isSuccess) ||
                const DeepCollectionEquality()
                    .equals(other.isSuccess, isSuccess)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.exceptionRaised, exceptionRaised) ||
                const DeepCollectionEquality()
                    .equals(other.exceptionRaised, exceptionRaised)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(isEmailValid) ^
      const DeepCollectionEquality().hash(isSubmitting) ^
      const DeepCollectionEquality().hash(isSuccess) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(exceptionRaised);

  @override
  _$ResettingCopyWith<_Resetting> get copyWith =>
      __$ResettingCopyWithImpl<_Resetting>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required
        Result empty(bool isEmailValid, bool isSubmitting, bool isSuccess,
            @nullable String email, @nullable AppException exceptionRaised),
    @required
        Result resetting(bool isEmailValid, bool isSubmitting, bool isSuccess,
            @nullable String email, @nullable AppException exceptionRaised),
    @required
        Result failure(bool isEmailValid, bool isSubmitting, bool isSuccess,
            @nullable String email, AppException exceptionRaised),
    @required
        Result success(bool isEmailValid, bool isSubmitting, bool isSuccess,
            String email, @nullable AppException exceptionRaised),
  }) {
    assert(empty != null);
    assert(resetting != null);
    assert(failure != null);
    assert(success != null);
    return resetting(
        isEmailValid, isSubmitting, isSuccess, email, exceptionRaised);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result empty(bool isEmailValid, bool isSubmitting, bool isSuccess,
        @nullable String email, @nullable AppException exceptionRaised),
    Result resetting(bool isEmailValid, bool isSubmitting, bool isSuccess,
        @nullable String email, @nullable AppException exceptionRaised),
    Result failure(bool isEmailValid, bool isSubmitting, bool isSuccess,
        @nullable String email, AppException exceptionRaised),
    Result success(bool isEmailValid, bool isSubmitting, bool isSuccess,
        String email, @nullable AppException exceptionRaised),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (resetting != null) {
      return resetting(
          isEmailValid, isSubmitting, isSuccess, email, exceptionRaised);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result empty(_Empty value),
    @required Result resetting(_Resetting value),
    @required Result failure(_Failure value),
    @required Result success(_Success value),
  }) {
    assert(empty != null);
    assert(resetting != null);
    assert(failure != null);
    assert(success != null);
    return resetting(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result empty(_Empty value),
    Result resetting(_Resetting value),
    Result failure(_Failure value),
    Result success(_Success value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (resetting != null) {
      return resetting(this);
    }
    return orElse();
  }
}

abstract class _Resetting extends ResetPasswordState {
  _Resetting._() : super._();
  factory _Resetting(
      {bool isEmailValid,
      bool isSubmitting,
      bool isSuccess,
      @nullable String email,
      @nullable AppException exceptionRaised}) = _$_Resetting;

  @override
  bool get isEmailValid;
  @override
  bool get isSubmitting;
  @override
  bool get isSuccess;
  @override
  @nullable
  String get email;
  @override
  @nullable
  AppException get exceptionRaised;
  @override
  _$ResettingCopyWith<_Resetting> get copyWith;
}

abstract class _$FailureCopyWith<$Res>
    implements $ResetPasswordStateCopyWith<$Res> {
  factory _$FailureCopyWith(_Failure value, $Res Function(_Failure) then) =
      __$FailureCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isEmailValid,
      bool isSubmitting,
      bool isSuccess,
      @nullable String email,
      AppException exceptionRaised});
}

class __$FailureCopyWithImpl<$Res>
    extends _$ResetPasswordStateCopyWithImpl<$Res>
    implements _$FailureCopyWith<$Res> {
  __$FailureCopyWithImpl(_Failure _value, $Res Function(_Failure) _then)
      : super(_value, (v) => _then(v as _Failure));

  @override
  _Failure get _value => super._value as _Failure;

  @override
  $Res call({
    Object isEmailValid = freezed,
    Object isSubmitting = freezed,
    Object isSuccess = freezed,
    Object email = freezed,
    Object exceptionRaised = freezed,
  }) {
    return _then(_Failure(
      isEmailValid:
          isEmailValid == freezed ? _value.isEmailValid : isEmailValid as bool,
      isSubmitting:
          isSubmitting == freezed ? _value.isSubmitting : isSubmitting as bool,
      isSuccess: isSuccess == freezed ? _value.isSuccess : isSuccess as bool,
      email: email == freezed ? _value.email : email as String,
      exceptionRaised: exceptionRaised == freezed
          ? _value.exceptionRaised
          : exceptionRaised as AppException,
    ));
  }
}

class _$_Failure extends _Failure with DiagnosticableTreeMixin {
  _$_Failure(
      {this.isEmailValid = true,
      this.isSubmitting = false,
      this.isSuccess = false,
      @nullable this.email,
      this.exceptionRaised})
      : assert(isEmailValid != null),
        assert(isSubmitting != null),
        assert(isSuccess != null),
        super._();

  @JsonKey(defaultValue: true)
  @override
  final bool isEmailValid;
  @JsonKey(defaultValue: false)
  @override
  final bool isSubmitting;
  @JsonKey(defaultValue: false)
  @override
  final bool isSuccess;
  @override
  @nullable
  final String email;
  @override
  final AppException exceptionRaised;

  bool _didisFormValid = false;
  bool _isFormValid;

  @override
  bool get isFormValid {
    if (_didisFormValid == false) {
      _didisFormValid = true;
      _isFormValid = isEmailValid;
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
    return 'ResetPasswordState.failure(isEmailValid: $isEmailValid, isSubmitting: $isSubmitting, isSuccess: $isSuccess, email: $email, exceptionRaised: $exceptionRaised, isFormValid: $isFormValid, isFailure: $isFailure)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ResetPasswordState.failure'))
      ..add(DiagnosticsProperty('isEmailValid', isEmailValid))
      ..add(DiagnosticsProperty('isSubmitting', isSubmitting))
      ..add(DiagnosticsProperty('isSuccess', isSuccess))
      ..add(DiagnosticsProperty('email', email))
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
            (identical(other.isSubmitting, isSubmitting) ||
                const DeepCollectionEquality()
                    .equals(other.isSubmitting, isSubmitting)) &&
            (identical(other.isSuccess, isSuccess) ||
                const DeepCollectionEquality()
                    .equals(other.isSuccess, isSuccess)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.exceptionRaised, exceptionRaised) ||
                const DeepCollectionEquality()
                    .equals(other.exceptionRaised, exceptionRaised)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(isEmailValid) ^
      const DeepCollectionEquality().hash(isSubmitting) ^
      const DeepCollectionEquality().hash(isSuccess) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(exceptionRaised);

  @override
  _$FailureCopyWith<_Failure> get copyWith =>
      __$FailureCopyWithImpl<_Failure>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required
        Result empty(bool isEmailValid, bool isSubmitting, bool isSuccess,
            @nullable String email, @nullable AppException exceptionRaised),
    @required
        Result resetting(bool isEmailValid, bool isSubmitting, bool isSuccess,
            @nullable String email, @nullable AppException exceptionRaised),
    @required
        Result failure(bool isEmailValid, bool isSubmitting, bool isSuccess,
            @nullable String email, AppException exceptionRaised),
    @required
        Result success(bool isEmailValid, bool isSubmitting, bool isSuccess,
            String email, @nullable AppException exceptionRaised),
  }) {
    assert(empty != null);
    assert(resetting != null);
    assert(failure != null);
    assert(success != null);
    return failure(
        isEmailValid, isSubmitting, isSuccess, email, exceptionRaised);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result empty(bool isEmailValid, bool isSubmitting, bool isSuccess,
        @nullable String email, @nullable AppException exceptionRaised),
    Result resetting(bool isEmailValid, bool isSubmitting, bool isSuccess,
        @nullable String email, @nullable AppException exceptionRaised),
    Result failure(bool isEmailValid, bool isSubmitting, bool isSuccess,
        @nullable String email, AppException exceptionRaised),
    Result success(bool isEmailValid, bool isSubmitting, bool isSuccess,
        String email, @nullable AppException exceptionRaised),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (failure != null) {
      return failure(
          isEmailValid, isSubmitting, isSuccess, email, exceptionRaised);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result empty(_Empty value),
    @required Result resetting(_Resetting value),
    @required Result failure(_Failure value),
    @required Result success(_Success value),
  }) {
    assert(empty != null);
    assert(resetting != null);
    assert(failure != null);
    assert(success != null);
    return failure(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result empty(_Empty value),
    Result resetting(_Resetting value),
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

abstract class _Failure extends ResetPasswordState {
  _Failure._() : super._();
  factory _Failure(
      {bool isEmailValid,
      bool isSubmitting,
      bool isSuccess,
      @nullable String email,
      AppException exceptionRaised}) = _$_Failure;

  @override
  bool get isEmailValid;
  @override
  bool get isSubmitting;
  @override
  bool get isSuccess;
  @override
  @nullable
  String get email;
  @override
  AppException get exceptionRaised;
  @override
  _$FailureCopyWith<_Failure> get copyWith;
}

abstract class _$SuccessCopyWith<$Res>
    implements $ResetPasswordStateCopyWith<$Res> {
  factory _$SuccessCopyWith(_Success value, $Res Function(_Success) then) =
      __$SuccessCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isEmailValid,
      bool isSubmitting,
      bool isSuccess,
      String email,
      @nullable AppException exceptionRaised});
}

class __$SuccessCopyWithImpl<$Res>
    extends _$ResetPasswordStateCopyWithImpl<$Res>
    implements _$SuccessCopyWith<$Res> {
  __$SuccessCopyWithImpl(_Success _value, $Res Function(_Success) _then)
      : super(_value, (v) => _then(v as _Success));

  @override
  _Success get _value => super._value as _Success;

  @override
  $Res call({
    Object isEmailValid = freezed,
    Object isSubmitting = freezed,
    Object isSuccess = freezed,
    Object email = freezed,
    Object exceptionRaised = freezed,
  }) {
    return _then(_Success(
      isEmailValid:
          isEmailValid == freezed ? _value.isEmailValid : isEmailValid as bool,
      isSubmitting:
          isSubmitting == freezed ? _value.isSubmitting : isSubmitting as bool,
      isSuccess: isSuccess == freezed ? _value.isSuccess : isSuccess as bool,
      email: email == freezed ? _value.email : email as String,
      exceptionRaised: exceptionRaised == freezed
          ? _value.exceptionRaised
          : exceptionRaised as AppException,
    ));
  }
}

class _$_Success extends _Success with DiagnosticableTreeMixin {
  _$_Success(
      {this.isEmailValid = true,
      this.isSubmitting = false,
      this.isSuccess = true,
      this.email,
      @nullable this.exceptionRaised})
      : assert(isEmailValid != null),
        assert(isSubmitting != null),
        assert(isSuccess != null),
        super._();

  @JsonKey(defaultValue: true)
  @override
  final bool isEmailValid;
  @JsonKey(defaultValue: false)
  @override
  final bool isSubmitting;
  @JsonKey(defaultValue: true)
  @override
  final bool isSuccess;
  @override
  final String email;
  @override
  @nullable
  final AppException exceptionRaised;

  bool _didisFormValid = false;
  bool _isFormValid;

  @override
  bool get isFormValid {
    if (_didisFormValid == false) {
      _didisFormValid = true;
      _isFormValid = isEmailValid;
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
    return 'ResetPasswordState.success(isEmailValid: $isEmailValid, isSubmitting: $isSubmitting, isSuccess: $isSuccess, email: $email, exceptionRaised: $exceptionRaised, isFormValid: $isFormValid, isFailure: $isFailure)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ResetPasswordState.success'))
      ..add(DiagnosticsProperty('isEmailValid', isEmailValid))
      ..add(DiagnosticsProperty('isSubmitting', isSubmitting))
      ..add(DiagnosticsProperty('isSuccess', isSuccess))
      ..add(DiagnosticsProperty('email', email))
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
            (identical(other.isSubmitting, isSubmitting) ||
                const DeepCollectionEquality()
                    .equals(other.isSubmitting, isSubmitting)) &&
            (identical(other.isSuccess, isSuccess) ||
                const DeepCollectionEquality()
                    .equals(other.isSuccess, isSuccess)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.exceptionRaised, exceptionRaised) ||
                const DeepCollectionEquality()
                    .equals(other.exceptionRaised, exceptionRaised)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(isEmailValid) ^
      const DeepCollectionEquality().hash(isSubmitting) ^
      const DeepCollectionEquality().hash(isSuccess) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(exceptionRaised);

  @override
  _$SuccessCopyWith<_Success> get copyWith =>
      __$SuccessCopyWithImpl<_Success>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required
        Result empty(bool isEmailValid, bool isSubmitting, bool isSuccess,
            @nullable String email, @nullable AppException exceptionRaised),
    @required
        Result resetting(bool isEmailValid, bool isSubmitting, bool isSuccess,
            @nullable String email, @nullable AppException exceptionRaised),
    @required
        Result failure(bool isEmailValid, bool isSubmitting, bool isSuccess,
            @nullable String email, AppException exceptionRaised),
    @required
        Result success(bool isEmailValid, bool isSubmitting, bool isSuccess,
            String email, @nullable AppException exceptionRaised),
  }) {
    assert(empty != null);
    assert(resetting != null);
    assert(failure != null);
    assert(success != null);
    return success(
        isEmailValid, isSubmitting, isSuccess, email, exceptionRaised);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result empty(bool isEmailValid, bool isSubmitting, bool isSuccess,
        @nullable String email, @nullable AppException exceptionRaised),
    Result resetting(bool isEmailValid, bool isSubmitting, bool isSuccess,
        @nullable String email, @nullable AppException exceptionRaised),
    Result failure(bool isEmailValid, bool isSubmitting, bool isSuccess,
        @nullable String email, AppException exceptionRaised),
    Result success(bool isEmailValid, bool isSubmitting, bool isSuccess,
        String email, @nullable AppException exceptionRaised),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (success != null) {
      return success(
          isEmailValid, isSubmitting, isSuccess, email, exceptionRaised);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result empty(_Empty value),
    @required Result resetting(_Resetting value),
    @required Result failure(_Failure value),
    @required Result success(_Success value),
  }) {
    assert(empty != null);
    assert(resetting != null);
    assert(failure != null);
    assert(success != null);
    return success(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result empty(_Empty value),
    Result resetting(_Resetting value),
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

abstract class _Success extends ResetPasswordState {
  _Success._() : super._();
  factory _Success(
      {bool isEmailValid,
      bool isSubmitting,
      bool isSuccess,
      String email,
      @nullable AppException exceptionRaised}) = _$_Success;

  @override
  bool get isEmailValid;
  @override
  bool get isSubmitting;
  @override
  bool get isSuccess;
  @override
  String get email;
  @override
  @nullable
  AppException get exceptionRaised;
  @override
  _$SuccessCopyWith<_Success> get copyWith;
}
