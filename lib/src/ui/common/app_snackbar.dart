import 'package:flutter/material.dart';

class AppSnackBar {
  static SnackBar createLoading({
    @required String message,
    Color progressIndicatorValueColor,
  }) {
    return SnackBar(
      content: ListTile(
        title: LinearProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(progressIndicatorValueColor),
        ),
        subtitle: Text(message),
      ),
    );
  }

  static SnackBar createInfo({@required String title, @required String message}) {
    return SnackBar(
      content: ListTile(
        leading: const Icon(Icons.info_outline, size: 48.0, color: Colors.green),
        title: Text(title),
        subtitle: Text(message),
      ),
    );
  }

  static SnackBar createError({@required String title, @required String message}) {
    return SnackBar(
      content: ListTile(
        leading: const Icon(Icons.error_outline, size: 48.0, color: Colors.red),
        title: Text(title),
        subtitle: Text(message),
      ),
    );
  }
}
