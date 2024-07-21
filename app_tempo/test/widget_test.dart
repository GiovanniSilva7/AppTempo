import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mockito/mockito.dart';
import 'package:app_tempo/app/app_module.dart';
import 'package:app_tempo/app/app_widget.dart';
import 'package:app_tempo/services/push_notification_service.dart';
import 'package:app_tempo/services/api_service.dart';
import 'package:app_tempo/services/auth_service.dart';
import 'package:app_tempo/app/stores/auth_store.dart';
import 'package:app_tempo/app/stores/weather_store.dart';

// Mocking services to avoid actual initialization during tests
class MockPushNotificationService extends Mock implements PushNotificationService {}
class MockApiService extends Mock implements ApiService {}
class MockAuthService extends Mock implements AuthService {}

class TestAppModule extends AppModule {
  @override
  final List<Bind> binds = [
    Bind.singleton<PushNotificationService>((i) => MockPushNotificationService()),
    Bind.singleton<ApiService>((i) => MockApiService()),
    Bind.singleton<AuthService>((i) => MockAuthService()),
    Bind.singleton((i) => AuthStore(i.get<AuthService>())),
    Bind.singleton((i) => WeatherStore(i.get<ApiService>(), i.get<PushNotificationService>())),
  ];
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    print('Setting up test module');
    Modular.destroy();
    Modular.init(TestAppModule());
  });

  tearDown(() {
    print('Cleaning up test module');
    Modular.destroy();
  });

  testWidgets('App starts and displays home page', (WidgetTester tester) async {
    print('Starting test');
    await tester.pumpWidget(ModularApp(module: TestAppModule(), child: AppWidget()));
    print('Widget pumped');

    // Verify if the app starts and displays the home page
    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
