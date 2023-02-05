import 'package:flutter_ehrlich_weather/data/models/temperature.dart';
import 'package:flutter_ehrlich_weather/data/models/weather_description.dart';
import 'package:flutter_ehrlich_weather/data/models/wind.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'weather.freezed.dart';
part 'weather.g.dart';

@freezed
class Weather with _$Weather {
  const factory Weather({
    @Default({}) Map<String, String> coord,
    @Default({}) Map<String, int> clouds,
    Wind? wind,
    List<WeatherDescription>? weather,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'main') Temperature? mainWeather,
    String? name,
  }) = _Weather;

  factory Weather.fromJson(Map<String, Object?> json) =>
      _$WeatherFromJson(json);
}
