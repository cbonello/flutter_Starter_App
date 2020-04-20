import 'package:mockito/mockito.dart';

import 'package:flutter_auth/src/services/analytics.dart';
import 'package:flutter_auth/src/services/local_storage.dart';

class MockLocalStorageService extends Mock implements LocalStorageService {}

class MockAnalyticsService extends Mock implements AnalyticsService {}
