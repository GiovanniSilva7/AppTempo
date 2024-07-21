import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../app/stores/weather_store.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final WeatherStore _weatherStore = Modular.get<WeatherStore>();

  @override
  void initState() {
    super.initState();
    _weatherStore.fetchWeatherData('user_location'); // Fetch initial weather data
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather Alerts'),
      ),
      body: Observer(
        builder: (_) {
          if (_weatherStore.weatherAlerts.isEmpty) {
            return Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
              itemCount: _weatherStore.weatherAlerts.length,
              itemBuilder: (context, index) {
                final alert = _weatherStore.weatherAlerts[index];
                return ListTile(
                  title: Text(alert.title),
                  subtitle: Text(alert.description),
                );
              },
            );
          }
        },
      ),
    );
  }
}
