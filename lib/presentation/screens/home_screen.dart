import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ehrlich_weather/domain/cubit/auth_cubit.dart';
import 'package:flutter_ehrlich_weather/presentation/components/custom_appbar.dart';
import 'package:flutter_ehrlich_weather/presentation/components/drawer.dart';
import 'package:flutter_ehrlich_weather/presentation/screens/weather_screen.dart';
import 'package:flutter_ehrlich_weather/utils/constants.dart';
import 'package:flutter_ehrlich_weather/utils/routes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late AuthCubit cubit;
  late TextEditingController cityController;

  @override
  void initState() {
    super.initState();
    cubit = context.read<AuthCubit>();
    cityController = TextEditingController();
  }

  @override
  void dispose() {
    cityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: const MyDrawer(),
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state.status == Status.error) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(state.message),
                      ),
                    );
                  } else if (state.status == Status.loaded) {
                    Navigator.pushReplacementNamed(
                      context,
                      RouteNav.WELCOME_SCREEN,
                    );
                  }
                },
                builder: (context, state) => CustomAppBar(
                  title: cubit.getName(),
                  showLogout: true,
                  onClick: () => cubit.logout(),
                  isLoading: state.status == Status.loading,
                  showUrl: true,
                  url: cubit.getUrl(),
                ),
              ),
              _body(context)
            ],
          ),
        ),
      ),
    );
  }

  Container _body(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Column(
        children: [
          TextField(
            cursorColor: Colors.black,
            controller: cityController,
            decoration: InputDecoration(
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(color: Colors.black),
              ),
              hintText: 'Enter City',
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(100, 40),
              backgroundColor: Theme.of(context).primaryColor,
            ),
            onPressed: () {
              if (cityController.text.isNotEmpty) {
                String city = cityController.text;
                cityController.clear();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WeatherScreen(
                        city: city,
                      ),
                    ));
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Please enter a city'),
                  ),
                );
              }
            },
            child: Text(
              Label.buttonDisplayWeather,
              style: Theme.of(context).textTheme.bodyText2?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          )
        ],
      ),
    );
  }
}
