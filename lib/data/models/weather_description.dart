import 'package:freezed_annotation/freezed_annotation.dart';
part 'weather_description.freezed.dart';
part 'weather_description.g.dart';

@freezed
class WeatherDescription with _$WeatherDescription {
  const factory WeatherDescription({
    String? main,
    String? description,
    String? icon,
  }) = _WeatherDescription;

  factory WeatherDescription.fromJson(Map<String, Object?> json) =>
      _$WeatherDescriptionFromJson(json);
}
