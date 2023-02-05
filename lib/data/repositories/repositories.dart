import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:flutter_ehrlich_weather/data/models/weather.dart';

abstract class AuthRepositories {
  Future<void> logout();
  Future<Credentials> login();
  bool isLoggedIn();
  String getName();
  String getNickname();
}

abstract class WeatherRepositories {
  Future<Weather> getWeather(String city);
}
