import 'dart:convert';

import 'package:restaurant/data/models/responses/auth/auth_response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthLocal {
  static Future<bool> saveAuthData(AuthResponseModel model) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    final res = pref.setString("authdata", jsonEncode(model.toJson()));
    return res;
  }

  static Future<String> getToken() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    final res = pref.getString("authdata") ?? "";
    final model = AuthResponseModel.fromJson(jsonDecode(res));
    return model.jwt;
  }

  static Future<bool> isLogin() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    final authJson = pref.getString('authdata') ?? '';

    return authJson.isNotEmpty;
  }

  static Future<int> getUserId() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    final res = pref.getString("authdata") ?? "";
    final model = AuthResponseModel.fromJson(jsonDecode(res));
    String id = model.user.id.toString();
    return int.parse(id);
  }
}
