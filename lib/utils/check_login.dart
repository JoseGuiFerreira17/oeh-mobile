// ignore_for_file: non_constant_identifier_names

import 'package:shared_preferences/shared_preferences.dart';

Future<bool> check_login() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var jwt = prefs.getString("access");
  if (jwt == null) {
    return false;
  } else {
    return true;
  }
}
