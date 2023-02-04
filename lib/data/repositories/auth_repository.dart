import 'package:auth0_flutter_platform_interface/src/credentials.dart';
import 'package:flutter_ehrlich_weather/data/datasources/local_datasource.dart';
import 'package:flutter_ehrlich_weather/data/datasources/remote_datasource.dart';
import 'package:flutter_ehrlich_weather/data/repositories/repositories.dart';

class AuthRepository implements AuthRepositories {
  AuthRepository({
    required this.localDataSource,
    required this.remoteDataSource,
  });

  final AuthLocalDataSource localDataSource;
  final AuthRemoteDataSource remoteDataSource;

  @override
  Future<Credentials> login() async {
    return await remoteDataSource.login();
  }

  @override
  Future<void> logout() async {
    return await remoteDataSource.logout();
  }
}
