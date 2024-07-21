import 'package:mobx/mobx.dart';
import 'package:app_tempo/services/api_service.dart';
import 'package:app_tempo/services/push_notification_service.dart';
import 'package:app_tempo/models/weather_model.dart';

part 'weather_store.g.dart';

class WeatherStore = _WeatherStore with _$WeatherStore;

abstract class _WeatherStore with Store {
  final ApiService _apiService;
  final PushNotificationService _pushNotificationService;

  _WeatherStore(this._apiService, this._pushNotificationService);

  @observable
  ObservableList<WeatherModel> weatherAlerts = ObservableList<WeatherModel>();

  @action
  Future<void> fetchWeatherData(String location) async {
    final weatherData = await _apiService.getWeather(location);
    weatherAlerts.clear();
    weatherAlerts.addAll(weatherData);
  }

  @action
  Future<void> sendWeatherAlert(String location) async {
    await _pushNotificationService.sendWeatherNotification(location);
  }
}
