import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AuthRemoteDataSource {
  final _auth0 = Auth0(
    'dev-y71vyvngi0szg4zh.us.auth0.com',
    dotenv.env['AUTH0_CLIENT_ID'] ?? '',
  );
  final _scheme = 'marcehrlichdemo';

  Future<Credentials> login() async {
    try {
      final Credentials credentials =
          await _auth0.webAuthentication(scheme: _scheme).login();
      return credentials;
    } on WebAuthenticationException catch (e) {
      throw (e.message);
    } catch (_) {
      throw ('Error logging in!');
    }
  }

  Future<void> logout() async {
    try {
      return await _auth0.webAuthentication(scheme: _scheme).logout();
    } on WebAuthenticationException catch (e) {
      throw (e.message);
    } catch (_) {
      throw ('Error logging out!');
    }
  }
}
