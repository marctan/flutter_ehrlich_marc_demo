import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ehrlich_weather/domain/cubit/auth_cubit.dart';
import 'package:flutter_ehrlich_weather/utils/constants.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  late AuthCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = context.read<AuthCubit>();
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
        BlocConsumer<AuthCubit, AuthState>(
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
            final isLoading = state.status == Status.loading;
            return ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(100, 40),
                backgroundColor: Theme.of(context).primaryColor,
              ),
              //disable button click if the previous action is not done yet
              onPressed: isLoading
                  ? null
                  : () {
                      cubit.login();
                    },
              //show loading indicator during login
              child: isLoading
                  ? const SizedBox(
                      height: 23,
                      width: 23,
                      child: Center(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      ),
                    )
                  : Text(
                      Label.login,
                      style: Theme.of(context).textTheme.bodyText2?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
            );
          },
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
