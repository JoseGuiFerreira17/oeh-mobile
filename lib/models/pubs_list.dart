import 'dart:math';

import 'package:flutter/material.dart';
import 'package:oeh/data/dummy_data.dart';
import 'package:oeh/models/pub.dart';

class PubsList with ChangeNotifier {
  final List<Pub> _items = dummyPubs;

  List<Pub> get items => [..._items];

  void addPub(Pub pub) {
    _items.add(pub);
    notifyListeners();
  }

  void addPubData(Map<String, Object> data) {
    bool hasId = data['id'] != null;
    final newPub = Pub(
      id: hasId ? data['id'] as String : Random().nextDouble().toString(),
      userId: '1',
      name: data['name'].toString(),
      phone: data['phone'].toString(),
      description: data['description'].toString(),
      opennigTime: data['opennigTime'].toString(),
      closingTime: data['closingTime'].toString(),
      state: data['state'].toString(),
      cep: data['cep'].toString(),
      city: data['city'].toString(),
      district: data['district'].toString(),
      street: data['street'].toString(),
      number: int.parse(data['number'].toString()),
      latitude: data['latitude'].toString(),
      longitude: data['longitude'].toString(),
      imageUrl: data['imageUrl'].toString(),
    );
    if (hasId) {
      updatePub(newPub);
    } else {
      addPub(newPub);
    }
  }

  void updatePub(Pub pub) {
    int index = _items.indexWhere((element) => element.id == pub.id);

    if (index >= 0) {
      _items[index] = pub;
      notifyListeners();
    }
  }

  void removePub(Pub pub) {
    int index = _items.indexWhere((element) => element.id == pub.id);
    if (index >= 0) {
      _items.removeWhere((value) => value.id == pub.id);
      notifyListeners();
    }
  }
}
