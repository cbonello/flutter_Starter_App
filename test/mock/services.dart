import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:mockito/mockito.dart';
import 'package:starter_app/src/services/local_storage.dart';

class MockLocalStorageService extends Mock implements LocalStorageService {}

class MockFirebaseAnalytics extends Mock implements FirebaseAnalytics {}
