import 'package:flutter/material.dart';
import 'package:oeh/utils/app_routes.dart';
import 'package:oeh/utils/check_login.dart';

class SplashScreenLogin extends StatefulWidget {
  const SplashScreenLogin({super.key});

  @override
  State<SplashScreenLogin> createState() => _SplashScreenLoginState();
}

class _SplashScreenLoginState extends State<SplashScreenLogin> {
  @override
  void initState() {
    super.initState();
    check_login().then((value) {
      if (value) {
        Navigator.pushReplacementNamed(context, AppRoutes.PUB_OVERVIEW);
      } else {
        Navigator.pushReplacementNamed(context, AppRoutes.LOGIN);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          color: Colors.purple,
        ),
      ),
    );
  }
}
