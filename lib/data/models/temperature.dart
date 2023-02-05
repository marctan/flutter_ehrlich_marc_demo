import 'package:freezed_annotation/freezed_annotation.dart';
part 'temperature.freezed.dart';
part 'temperature.g.dart';

@freezed
class Temperature with _$Temperature {
  const factory Temperature({
    double? temp,
    double? feelsLike,
    int? pressure,
    int? humidity,
    int? seaLevel,
  }) = _Temperature;

  factory Temperature.fromJson(Map<String, Object?> json) =>
      _$TemperatureFromJson(json);
}
