import 'dart:convert';

import 'package:restaurant/data/models/responses/auth/auth_response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthLocal {
  Future<bool> saveAuthData(AuthResponseModel model) async {
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
}
