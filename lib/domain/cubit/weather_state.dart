part of 'weather_cubit.dart';

enum Status { initial, loading, loaded, error }

@freezed
class WeatherState with _$WeatherState {
  const factory WeatherState({
    @Default(null) Weather? weather,
    @Default(Status.initial) Status status,
    @Default('') String message,
  }) = _WeatherState;
}
