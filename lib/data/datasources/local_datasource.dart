import 'package:flutter_ehrlich_weather/di.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthLocalDataSource {
  final pref = getIt<SharedPreferences>();
  Future<void> saveData(String token, String nickname, String name) async {
    await pref.setString('token', token);
    await pref.setString('nickname', nickname);
    await pref.setString('name', name);
  }

  Future<void> clearUserData() async {
    await pref.remove('token');
    await pref.remove('nickname');
    await pref.remove('name');
  }

  bool isTokenExist() {
    return pref.containsKey('token');
  }

  String getName() {
    return pref.getString('name') ?? '';
  }

  String getNickname() {
    return pref.getString('nickname') ?? '';
  }
}
