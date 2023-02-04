import 'package:flutter/material.dart';
import 'package:flutter_ehrlich_weather/utils/constants.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                children: [
                  Image.asset(
                    'assets/images/weather_logo.png',
                    height: 70,
                    width: 70,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Text(
                    Label.weatherTitle,
                    style: Theme.of(context).textTheme.bodyText1,
                  )
                ],
              ),
              const Divider(
                thickness: 0.9,
                color: Colors.black,
                height: 1,
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                margin: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      Label.welcomeText,
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(100, 40),
                        backgroundColor: Theme.of(context).primaryColor,
                      ),
                      onPressed: () {},
                      child: Text(
                        Label.login,
                        style: Theme.of(context).textTheme.bodyText2?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
