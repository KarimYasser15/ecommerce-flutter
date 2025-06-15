import 'package:ecommerce/core/constants.dart';
import 'package:ecommerce/core/error/exception.dart';
import 'package:ecommerce/features/auth/data/data_source/local/auth_local_data_source.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthSharedPrefLocalDataSource implements AuthLocalDataSource {
  @override
  Future<String> getToken() async {
    try {
      final SharedPreferences sharedPref =
          await SharedPreferences.getInstance();
      final String token = sharedPref.getString(SharedPrefConstants.tokenKey)!;
      return token;
    } catch (exception) {
      throw const LocalException("Failed to get token from shared preferences");
    }
  }

  @override
  Future<void> saveToken(String token) async {
    try {
      final SharedPreferences sharedPref =
          await SharedPreferences.getInstance();
      await sharedPref.setString(SharedPrefConstants.tokenKey, token);
    } catch (exception) {
      throw const LocalException("Failed to save token to shared preferences");
    }
  }
}
