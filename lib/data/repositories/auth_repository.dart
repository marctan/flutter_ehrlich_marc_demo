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
    final credentials = await remoteDataSource.login();
    //save token to sharedPref. we will be using this during login
    await localDataSource.saveData(
      credentials.accessToken,
      credentials.user.nickname!,
      credentials.user.name!,
    );
    return credentials;
  }

  @override
  Future<void> logout() async {
    //remove token data from shared pref
    await localDataSource.clearUserData();
    return await remoteDataSource.logout();
  }

  @override
  bool isLoggedIn() {
    return localDataSource.isTokenExist();
  }

  @override
  String getName() {
    return localDataSource.getName();
  }

  @override
  String getNickname() {
    return localDataSource.getNickname();
  }
}
