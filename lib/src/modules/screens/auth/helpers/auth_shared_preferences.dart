import 'package:shared_preferences/shared_preferences.dart';

class AuthSharedPreferences {
  static const String tokenKey = 'auth_token';
  static const String agentUserNameKey = 'agent_username_key';
  static const String agentPasswordKey = 'agent_password_key';

  // Tokens
  static Future<void> setToken({String accessToken = ''}) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(tokenKey, accessToken);
  }

  static Future<String> getToken() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(tokenKey) ?? '';
  }

  static Future<void> cleanToken() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(tokenKey, '');
  }

  // Agent Username
  static Future<void> setAgentUserName({String username = ''}) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(agentUserNameKey, username);
  }

  static Future<String> getAgentUsername() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(agentUserNameKey) ?? '';
  }

  static Future<void> cleanAgentUsername() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(agentUserNameKey, '');
  }

  // Aget Password
  static Future<void> setAgentPassword({String password = ''}) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(agentPasswordKey, password);
  }

  static Future<String> getAgentPassword() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(agentPasswordKey) ?? '';
  }
}
