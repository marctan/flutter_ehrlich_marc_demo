import 'package:flutter_ehrlich_weather/data/datasources/weather/local_datasource.dart';
import 'package:flutter_ehrlich_weather/data/datasources/weather/remote_datasource.dart';
import 'package:flutter_ehrlich_weather/data/models/weather.dart';
import 'package:flutter_ehrlich_weather/data/repositories/repositories.dart';

class WeatherRepository implements WeatherRepositories {
  WeatherRepository({required this.localDataSource,required  this.remoteDataSource});

  final WeatherLocalDataSource localDataSource;
  final WeatherRemoteDataSource remoteDataSource;

  @override
  Future<Weather> getWeather(String city) async {
    return await remoteDataSource.getWeather(city);
  }
}
