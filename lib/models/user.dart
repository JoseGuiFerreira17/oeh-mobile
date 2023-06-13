import 'package:flutter/material.dart';

class User with ChangeNotifier {
  final String id;
  final String name;
  final String email;
  final String password;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
  });
}
