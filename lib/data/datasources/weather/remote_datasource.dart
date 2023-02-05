import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_ehrlich_weather/data/endpoints.dart';
import 'package:flutter_ehrlich_weather/data/models/weather.dart';
import 'package:flutter_ehrlich_weather/di.dart';
import 'package:http/http.dart';

class WeatherRemoteDataSource {
  Future<Weather> getWeather(String city) async {
    final host = Uri.parse('$DOMAIN$CURRENT_WEATHER')
        .replace(queryParameters: {'q': city, 'appid': dotenv.env['APPID']});

    try {
      final result = await getIt<Client>().get(host);

      if (result.statusCode == 200) {
        final data = (json.decode(result.body) as Map<String, dynamic>);

        return Weather.fromJson(data);
      } else {
        final data = (json.decode(result.body) as Map<String, dynamic>);
        throw (data['message'] ?? 'Error getting weather info!');
      }
    } catch (_) {
      throw ('Error getting weather info!');
    }
  }
}
