import 'package:flutter/material.dart';

class Pub with ChangeNotifier {
  final String id;
  final String userId;
  final String name;
  final String phone;
  final String description;
  final String? imageUrl;
  bool isActive;
  final String opennigTime;
  final String closingTime;
  final String state;
  final String cep;
  final String city;
  final String district;
  final String street;
  final int? number;
  final String? latitude;
  final String? longitude;

  Pub({
    required this.id,
    required this.userId,
    required this.name,
    required this.phone,
    required this.description,
    this.imageUrl,
    this.isActive = true,
    required this.opennigTime,
    required this.closingTime,
    required this.state,
    required this.cep,
    required this.city,
    required this.district,
    required this.street,
    this.number,
    this.latitude,
    this.longitude,
  });

  void toggleActive() {
    isActive = !isActive;
    notifyListeners();
  }
}
