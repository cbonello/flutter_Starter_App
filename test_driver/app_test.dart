import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Counter App', () {
    // final SerializableFinder homeCounterField = find.byValueKey('HomeCounterField');
    final SerializableFinder signInEmailField = find.byValueKey('SignInEmailField');
    final SerializableFinder signInPasswordField = find.byValueKey('SignInPasswordField');
    final SerializableFinder signInSubmitButton = find.byValueKey('SignInSubmitButton');

    FlutterDriver driver;
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('check flutter driver health', () async {
      final Health health = await driver.checkHealth();
      expect(health, HealthStatus.ok);
    });

    // test('should sign-in successfully', () async {
    //   driver.requestData("signin");

    //   await driver.tap(signInEmailField);
    //   await driver.enterText('a@b.com');
    //   await driver.waitFor(find.text('a@b.com'));
    //   await driver.tap(signInPasswordField);
    //   await driver.enterText('abcom123456');
    //   await driver.waitFor(find.text('abcom123456'));
    //   await driver.tap(signInSubmitButton);
    //   expect(true, true);
    // });
  });
}
