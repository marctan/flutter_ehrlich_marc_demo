import 'package:flutter_ehrlich_weather/data/datasources/auth/local_datasource.dart';
import 'package:flutter_ehrlich_weather/data/datasources/auth/remote_datasource.dart';
import 'package:flutter_ehrlich_weather/data/repositories/auth/auth_repository.dart';
import 'package:flutter_ehrlich_weather/data/repositories/repositories.dart';
import 'package:flutter_ehrlich_weather/domain/cubit/auth_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerLazySingleton<AuthLocalDataSource>(() => AuthLocalDataSource());
  getIt.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSource(),
  );
  getIt.registerLazySingleton<AuthRepositories>(
    () => AuthRepository(
        localDataSource: getIt<AuthLocalDataSource>(),
        remoteDataSource: getIt<AuthRemoteDataSource>()),
  );
  getIt.registerLazySingleton<AuthCubit>(
    () => AuthCubit(repository: getIt<AuthRepositories>()),
  );
  getIt.registerSingletonAsync<SharedPreferences>(
    () async => await SharedPreferences.getInstance(),
  );
}
