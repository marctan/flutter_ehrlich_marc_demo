import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ehrlich_weather/domain/cubit/auth_cubit.dart'
    hide Status;
import 'package:flutter_ehrlich_weather/domain/cubit/weather_cubit.dart';
import 'package:flutter_ehrlich_weather/presentation/components/custom_appbar.dart';
import 'package:flutter_ehrlich_weather/presentation/components/drawer.dart';
import 'package:flutter_ehrlich_weather/utils/constants.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key, required this.city});

  final String city;

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  late WeatherCubit weatherCubit;
  late AuthCubit authCubit;
  @override
  void initState() {
    weatherCubit = context.read<WeatherCubit>();
    authCubit = context.read<AuthCubit>();
    super.initState();
    weatherCubit.getWeather(widget.city);
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        drawer: const MyDrawer(),
        body: BlocConsumer<WeatherCubit, WeatherState>(
          listener: (context, state) {
            if (state.status == Status.error) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                ),
              );
            }
          },
          builder: (context, state) {
            if (state.status == Status.loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state.status == Status.loaded) {
              final weather = state.weather;
              final icon = weather?.weather?.first.icon;
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomAppBar(
                      showBackButton: true,
                      showBottomSpace: false,
                      title: Label.weatherInfo,
                      showLogout: true,
                      onClick: () => authCubit.logout(),
                      isLoading: state.status == Status.loading,
                    ),
                  ),
                  SingleChildScrollView(
                    child: Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.topCenter,
                      children: [
                        Container(
                          color: Theme.of(context).primaryColor,
                          height: deviceSize.height * 0.35,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 7.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(vertical: 40),
                                child: Material(
                                  borderRadius: BorderRadius.circular(10),
                                  elevation: 10,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 30),
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 30),
                                    height: deviceSize.height * 0.60,
                                    width: deviceSize.width * 0.8,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            _buildInfo(weather?.name ?? '',
                                                Label.weatherCity),
                                            if (icon != null)
                                              Container(
                                                color: Colors.redAccent,
                                                child: Image.network(
                                                  fit: BoxFit.cover,
                                                  height: 65,
                                                  'http://openweathermap.org/img/wn/$icon@2x.png',
                                                ),
                                              )
                                          ],
                                        ),
                                        _buildInfo(
                                          '${weather?.mainWeather?.temp?.toString()} °С',
                                          Label.temp,
                                        ),
                                        _buildInfo(
                                          '${weather?.wind?.speed} m/s',
                                          Label.windSpeed,
                                        ),
                                        _buildInfo(
                                          '${weather?.clouds['all']} %',
                                          Label.clouds,
                                        ),
                                        _buildInfo(
                                          weather?.mainWeather?.pressure
                                                  ?.toString() ??
                                              '',
                                          Label.hpa,
                                        ),
                                        _buildInfo(
                                          weather?.weather?.first.description
                                                  ?.toUpperCase() ??
                                              '',
                                          Label.description,
                                        ),
                                        _buildInfo(
                                          weather?.coord['lon']?.toString() ??
                                              '',
                                          Label.lon,
                                        ),
                                        _buildInfo(
                                          weather?.coord['lat']?.toString() ??
                                              '',
                                          Label.lat,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }
            return const Center(
              child: Text('Error loading weather data!'),
            );
          },
        ),
      ),
    );
  }

  Widget _buildInfo(String title, String subtitle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        Text(
          subtitle,
          style: const TextStyle(fontSize: 19, fontWeight: FontWeight.w300),
        ),
      ],
    );
  }
}
