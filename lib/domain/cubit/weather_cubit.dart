import 'package:bloc/bloc.dart';
import 'package:flutter_ehrlich_weather/data/models/weather.dart';
import 'package:flutter_ehrlich_weather/data/repositories/repositories.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather_state.dart';
part 'weather_cubit.freezed.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final WeatherRepositories repository;

  WeatherCubit({required this.repository}) : super(const WeatherState());

  void getWeather(String city) async {
    try {
      emit(state.copyWith(status: Status.loading));
      final weather = await repository.getWeather(city);
      emit(state.copyWith(status: Status.loaded, weather: weather));
    } catch (e) {
      emit(state.copyWith(status: Status.error, message: e.toString()));
    }
  }
}
