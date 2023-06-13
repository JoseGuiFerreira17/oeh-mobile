import 'dart:math';

import 'package:flutter/material.dart';
import 'package:oeh/data/dummy_user.dart';
import 'package:oeh/models/user.dart';

class UsersList with ChangeNotifier {
  final List<User> _items = dummyUsers;

  List<User> get items => [..._items];

  void addUser(User user) {
    _items.add(user);
    notifyListeners();
  }

  void addUserData(Map<String, Object> data) {
    bool hasId = data['id'] != null;
    final newUser = User(
      id: hasId ? data['id'] as String : Random().nextDouble().toString(),
      name: data['name'].toString(),
      email: data['phone'].toString(),
      password: data['password1'].toString(),
    );
    if (hasId) {
      updateUser(newUser);
    } else {
      addUser(newUser);
    }
  }

  void updateUser(User user) {
    int index = _items.indexWhere((element) => element.id == user.id);

    if (index >= 0) {
      _items[index] = user;
      notifyListeners();
    }
  }
}
