// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$WeatherStore on _WeatherStore, Store {
  late final _$weatherAlertsAtom =
      Atom(name: '_WeatherStore.weatherAlerts', context: context);

  @override
  ObservableList<WeatherModel> get weatherAlerts {
    _$weatherAlertsAtom.reportRead();
    return super.weatherAlerts;
  }

  @override
  set weatherAlerts(ObservableList<WeatherModel> value) {
    _$weatherAlertsAtom.reportWrite(value, super.weatherAlerts, () {
      super.weatherAlerts = value;
    });
  }

  late final _$fetchWeatherDataAsyncAction =
      AsyncAction('_WeatherStore.fetchWeatherData', context: context);

  @override
  Future<void> fetchWeatherData(String location) {
    return _$fetchWeatherDataAsyncAction
        .run(() => super.fetchWeatherData(location));
  }

  late final _$sendWeatherAlertAsyncAction =
      AsyncAction('_WeatherStore.sendWeatherAlert', context: context);

  @override
  Future<void> sendWeatherAlert(String location) {
    return _$sendWeatherAlertAsyncAction
        .run(() => super.sendWeatherAlert(location));
  }

  @override
  String toString() {
    return '''
weatherAlerts: ${weatherAlerts}
    ''';
  }
}
