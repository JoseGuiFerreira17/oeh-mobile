import 'package:flutter/material.dart';

class Event with ChangeNotifier {
  final String id;
  final String userId;
  final String name;
  final String phone;
  final String description;
  final String? imageUrl;
  final bool isActive;
  final DateTime? date;
  final String state;
  final String cep;
  final String city;
  final String district;
  final String street;
  final int? number;
  final String? latitude;
  final String? longitude;

  Event({
    required this.id,
    required this.userId,
    required this.name,
    required this.phone,
    required this.description,
    this.imageUrl,
    this.isActive = true,
    this.date,
    required this.state,
    required this.cep,
    required this.city,
    required this.district,
    required this.street,
    this.number,
    this.latitude,
    this.longitude,
  });
}
