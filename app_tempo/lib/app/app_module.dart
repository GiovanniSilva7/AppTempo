import 'package:flutter_modular/flutter_modular.dart';
import '../services/api_service.dart';
import '../services/auth_service.dart';
import '../services/push_notification_service.dart';
import 'stores/auth_store.dart';
import 'stores/weather_store.dart';
import '../views/login_page.dart';
import '../views/register_page.dart';
import '../views/home_page.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton((i) => AuthService()),
    Bind.singleton((i) => ApiService()),
    Bind.singleton((i) => PushNotificationService()),
    Bind.singleton((i) => AuthStore(i.get<AuthService>())),
    Bind.singleton((i) => WeatherStore(i.get<ApiService>(), i.get<PushNotificationService>())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, __) => LoginPage()),
    ChildRoute('/register', child: (_, __) => RegisterPage()),
    ChildRoute('/home', child: (_, __) => HomePage()),
  ];
}