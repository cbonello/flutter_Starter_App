import 'package:flutter_driver/driver_extension.dart';

import 'package:flutter_starter_app/main.dart' as app;

void main() {
  // ignore: missing_return
  Future<String> dataHandler(String msg) async {
    switch (msg) {
      case "signin":
        return Future.value('success');
        break;
      default:
        break;
    }
  }

  enableFlutterDriverExtension(handler: dataHandler);

  app.main();
}
