import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Counter App', () {
    final SerializableFinder splashImage = find.byValueKey('SplashImage');

    FlutterDriver driver;
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      driver?.close();
    });

    test('check flutter driver health', () async {
      final Health health = await driver.checkHealth();
      expect(health.status, HealthStatus.ok);
    });

    test('splash screen should be displayed', () async {
      await driver.waitFor(splashImage);
    });
  });
}
