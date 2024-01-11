import 'dart:convert';

import 'package:ecommerce/login&register/dataModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RememberUserPref {
  static Future<void> saveRememberUser(UserModel userInfo) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String userJson = jsonEncode(userInfo.toJson());
    await preferences.setString("currentUser", userJson);
  }
}
