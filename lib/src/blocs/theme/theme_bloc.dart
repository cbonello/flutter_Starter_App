import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../services/services.dart';

class ThemeBloc extends Bloc<ThemeMode, ThemeMode> {
  ThemeBloc({
    @required LocalStorageService localStorageService,
  })  : assert(localStorageService != null),
        _localStorageService = localStorageService;

  final LocalStorageService _localStorageService;
  ThemeMode _preferredTheme;

  @override
  ThemeMode get initialState {
    // ignore: join_return_with_assignment
    _preferredTheme = _localStorageService.getPreferredTheme();
    return _preferredTheme;
  }

  @override
  Stream<ThemeMode> mapEventToState(ThemeMode theme) async* {
    _preferredTheme = theme;
    _localStorageService.setPreferredTheme(_preferredTheme);
    yield _preferredTheme;
  }
}
