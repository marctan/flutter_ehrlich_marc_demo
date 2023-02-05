import 'package:flutter/material.dart';
import 'package:flutter_ehrlich_weather/di.dart';
import 'package:flutter_ehrlich_weather/domain/cubit/auth_cubit.dart';
import 'package:flutter_ehrlich_weather/presentation/components/alert_dialog.dart';
import 'package:flutter_ehrlich_weather/presentation/screens/weather_screen.dart';
import 'package:flutter_ehrlich_weather/utils/routes.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            child: const SizedBox.shrink(),
          ),
          ListTile(
            leading: const Icon(Icons.account_balance),
            title: const Text(
              'Landing',
              style: TextStyle(fontSize: 16),
            ),
            onTap: () {
              Navigator.pushReplacementNamed(context, RouteNav.WELCOME_SCREEN);
            },
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text(
              'Home',
              style: TextStyle(fontSize: 16),
            ),
            onTap: () async {
              if (getIt<AuthCubit>().isLoggedIn()) {
                Navigator.pushReplacementNamed(context, RouteNav.HOME_SCREEN);
              } else {
                showDialog(
                  context: context,
                  builder: ((context) => CustomAlertDialog(
                        title: 'Error',
                        content: 'Please login first!',
                        onPressed: () {},
                        isError: true,
                      )),
                );
              }
            },
          ),
          ListTile(
            leading: const Icon(Icons.schedule),
            title: const Text(
              'Weather',
              style: TextStyle(fontSize: 16),
            ),
            onTap: () {
              if (getIt<AuthCubit>().isLoggedIn()) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const WeatherScreen(city: ''),
                  ),
                );
              } else {
                showDialog(
                  context: context,
                  builder: ((context) => CustomAlertDialog(
                        title: 'Error',
                        content: 'Please login first!',
                        onPressed: () {},
                        isError: true,
                      )),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
