import 'package:flutter/material.dart';
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
              Navigator.pushNamed(context, RouteNav.WELCOME_SCREEN);
            },
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text(
              'Home',
              style: TextStyle(fontSize: 16),
            ),
            onTap: () {
              Navigator.pushNamed(context, RouteNav.HOME_SCREEN);
            },
          ),
          ListTile(
            leading: const Icon(Icons.schedule),
            title: const Text(
              'Weather',
              style: TextStyle(fontSize: 16),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const WeatherScreen(city: ''),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
