import 'package:flutter/material.dart';
import 'package:oeh/screens/pub/one_create_pub.dart';
import 'package:oeh/screens/pub/two_create_pub.dart';

class CreatePub extends StatelessWidget {
  const CreatePub({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Navigator(
        initialRoute: '/one',
        onGenerateRoute: (settings) {
          var route = settings.name;
          Widget page;
          switch (route) {
            case '/one':
              page = const OneCreatePub();
              break;
            case '/two':
              page = const TwoCreatePub();
              break;
            default:
              return null;
          }
          return MaterialPageRoute(builder: (context) => page);
        },
      ),
    );
  }
}
