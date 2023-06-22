import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:oeh/data/dummy_user.dart';
import 'package:oeh/models/user.dart';

class UsersList with ChangeNotifier {
  final List<User> _items = dummyUsers;
  final _baseUrl = 'http://192.168.0.119:8000/api/v1/user/user/';
  List<User> get items => [..._items];

  Future<void> addUserData(Map<String, Object> data) {
    bool hasId = data['id'] != null;
    final newUser = User(
      id: hasId ? data['id'] as String : Random().nextDouble().toString(),
      name: data['name'].toString(),
      email: data['email'].toString(),
      password: data['password1'].toString(),
    );
    if (hasId) {
      return updateUser(newUser);
    } else {
      return addUser(newUser);
    }
  }

  Future<void> addUser(User user) {
    final request = http.post(
      Uri.parse(_baseUrl),
      body: {
        'name': user.name,
        'email': user.email,
        'password1': user.password,
        'password2': user.password,
      },
    );

    return request.then((value) {
      print(value.body);
      final id = jsonDecode(value.body)['id'];
      _items.add(
        User(
          id: id,
          name: user.name,
          email: user.email,
          password: user.password,
        ),
      );
      notifyListeners();
    });
  }

  Future<void> updateUser(User user) {
    int index = _items.indexWhere((element) => element.id == user.id);

    if (index >= 0) {
      _items[index] = user;
      notifyListeners();
    }
    return Future.value();
  }
}
