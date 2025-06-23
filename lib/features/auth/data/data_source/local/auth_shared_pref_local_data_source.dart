import 'package:ecommerce/core/constants.dart';
import 'package:ecommerce/core/error/exception.dart';
import 'package:ecommerce/features/auth/data/data_source/local/auth_local_data_source.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Singleton(as: AuthLocalDataSource)
class AuthSharedPrefLocalDataSource implements AuthLocalDataSource {
  final SharedPreferences _sharedPreferences;
  const AuthSharedPrefLocalDataSource(this._sharedPreferences);
  @override
  Future<String> getToken() async {
    try {
      final String token =
          _sharedPreferences.getString(SharedPrefConstants.tokenKey)!;
      return token;
    } catch (exception) {
      throw const LocalException("Failed to get token from shared preferences");
    }
  }

  @override
  Future<void> saveToken(String token) async {
    try {
      await _sharedPreferences.setString(SharedPrefConstants.tokenKey, token);
    } catch (exception) {
      throw const LocalException("Failed to save token to shared preferences");
    }
  }
}
