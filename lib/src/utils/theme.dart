import 'package:flutter/material.dart';

// ignore: avoid_classes_with_only_static_members
class AppTheme {
  static ThemeData theme(Brightness brightness) {
    if (brightness == Brightness.light) {
      return ThemeData.light().copyWith(
        bottomAppBarTheme: const BottomAppBarTheme(
          color: Colors.transparent,
          elevation: 0.0,
        ),
        // See https://github.com/flutter/flutter/issues/35826.
        buttonTheme: const ButtonThemeData(minWidth: 5),
        iconTheme: const IconThemeData(color: Colors.green),
        canvasColor: const Color(0xFFF3F3F3),
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: const TextStyle(color: Colors.black),
          errorStyle: const TextStyle(color: Color(0xFFEB3A37)),
          errorMaxLines: 1,
          filled: true,
          fillColor: Colors.white,
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFEB3A37)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black.withOpacity(0.1)),
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
        ),
        primaryColor: Colors.green,
      );
    }

    return ThemeData.dark().copyWith(
      // TODO(cbonello): TBD.
      bottomAppBarTheme: const BottomAppBarTheme(
        color: Colors.transparent,
        elevation: 0.0,
      ),
      // See https://github.com/flutter/flutter/issues/35826.
      buttonTheme: const ButtonThemeData(minWidth: 5),
      iconTheme: const IconThemeData(color: Colors.green),
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: const TextStyle(color: Colors.white),
        errorStyle: const TextStyle(color: Color(0xFFEB3A37)),
        errorMaxLines: 1,
        filled: true,
        fillColor: Colors.grey[600],
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFEB3A37)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.withOpacity(0.1)),
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
      ),
      primaryColor: Colors.green,
    );
  }

  static LinearGradient get widgetGradient => LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: <Color>[
          Colors.green.withGreen(0xF0),
          Colors.green,
        ],
      );

  static Color horizontalLineColor(Brightness brightness) {
    if (brightness == Brightness.light) {
      return Colors.black;
    }
    return Colors.grey[600];
  }

  static Color cardsBackgroundColor(Brightness brightness) {
    if (brightness == Brightness.light) {
      return Colors.white;
    }
    return Colors.grey[800];
  }

  static TextStyle get buttonEnabledTextStyle {
    return const TextStyle(
      color: Colors.white,
      fontSize: 16,
    );
  }

  static TextStyle get buttonDisabledTextStyle {
    return const TextStyle(
      color: Colors.black54,
      fontSize: 16,
    );
  }
}
