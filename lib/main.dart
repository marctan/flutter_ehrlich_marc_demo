import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_ehrlich_weather/data/datasources/local_datasource.dart';
import 'package:flutter_ehrlich_weather/data/datasources/remote_datasource.dart';
import 'package:flutter_ehrlich_weather/data/repositories/auth_repository.dart';
import 'package:flutter_ehrlich_weather/domain/cubit/auth_cubit.dart';
import 'package:flutter_ehrlich_weather/presentation/screens/home_screen.dart';
import 'package:flutter_ehrlich_weather/presentation/screens/welcome_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ehrlich_weather/utils/routes.dart';

void main() async {
  await dotenv.load();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(
        repository: AuthRepository(
          localDataSource: AuthLocalDataSource(),
          remoteDataSource: AuthRemoteDataSource(),
        ),
      ),
      child: MaterialApp(
        routes: <String, WidgetBuilder>{
          RouteNav.WELCOME_SCREEN: (BuildContext context) =>
              const WelcomeScreen(),
          RouteNav.HOME_SCREEN: (BuildContext context) => const HomeScreen(),
        },
        theme: ThemeData(
          fontFamily: 'ComicNeue',
          primaryColor: Colors.red,
          colorScheme: ColorScheme.fromSwatch().copyWith(
            secondary: Colors.redAccent,
          ),
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.red,
          ),
          textTheme: const TextTheme(
            bodyText1: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            bodyText2: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
        ),
        home: const WelcomeScreen(),
      ),
    );
  }
}
