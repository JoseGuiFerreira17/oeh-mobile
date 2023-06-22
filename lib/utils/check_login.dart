import 'package:shared_preferences/shared_preferences.dart';

Future<bool> check_login() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var jwt = await prefs.getString("access");
  if (jwt == null) {
    return false;
  } else {
    return true;
  }
}
