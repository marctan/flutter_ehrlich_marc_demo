import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_ehrlich_weather/utils/constants.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  late Auth0 auth0;
  Credentials? _credentials;

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              _header(context),
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
                child: _body(context),
              )
            ],
          ),
        ),
      ),
    );
  }

  Column _body(BuildContext context) {
    return Column(
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
          onPressed: () async {
            final Credentials credentials = await auth0
                .webAuthentication(scheme: 'marcehrlichdemo')
                .login();
          },
          child: Text(
            Label.login,
            style: Theme.of(context).textTheme.bodyText2?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
          ),
        )
      ],
    );
  }

  Row _header(BuildContext context) {
    return Row(
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
    );
  }
}
