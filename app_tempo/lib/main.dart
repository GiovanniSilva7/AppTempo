import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'app/app_module.dart';
import 'app/app_widget.dart';
import 'services/push_notification_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Modular.get<PushNotificationService>().initialize(); // Inicializa o serviço de notificação push
  runApp(ModularApp(module: AppModule(), child: AppWidget()));
}
