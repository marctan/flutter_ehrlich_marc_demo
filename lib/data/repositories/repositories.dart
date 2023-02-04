import 'package:auth0_flutter/auth0_flutter.dart';

abstract class AuthRepositories {
  Future<void> logout();
  Future<Credentials> login();
}
