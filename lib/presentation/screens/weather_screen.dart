import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ehrlich_weather/domain/cubit/weather_cubit.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key, required this.city});

  final String city;

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  late WeatherCubit cubit;
  @override
  void initState() {
    cubit = context.read<WeatherCubit>();
    super.initState();
    cubit.getWeather(widget.city);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text('Weather Info')),
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
              return Center(
                child: Text(weather?.name ?? ''),
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
}
