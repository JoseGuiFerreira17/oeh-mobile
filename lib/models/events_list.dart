import 'dart:math';

import 'package:flutter/material.dart';
import 'package:oeh/data/dummy_event.dart';
import 'package:oeh/models/event.dart';

class EventsList with ChangeNotifier {
  final List<Event> _items = dummyEvents;

  List<Event> get items => [..._items];

  void addEvent(Event event) {
    _items.add(event);
    notifyListeners();
  }

  void addEventData(Map<String, Object> data) {
    bool hasId = data['id'] != null;
    final newEvent = Event(
      id: hasId ? data['id'] as String : Random().nextDouble().toString(),
      userId: '1',
      name: data['name'].toString(),
      phone: data['phone'].toString(),
      description: data['description'].toString(),
      state: data['state'].toString(),
      cep: data['cep'].toString(),
      city: data['city'].toString(),
      district: data['district'].toString(),
      street: data['street'].toString(),
      number: int.parse(data['number'].toString()),
      latitude: data['latitude'].toString(),
      longitude: data['longitude'].toString(),
      imageUrl: data['imageUrl'].toString(),
      date: DateTime.parse(data['date'].toString()),
    );
    if (hasId) {
      updateEvent(newEvent);
    } else {
      addEvent(newEvent);
    }
  }

  void updateEvent(Event event) {
    int index = _items.indexWhere((element) => element.id == event.id);

    if (index >= 0) {
      _items[index] = event;
      notifyListeners();
    }
  }

  void removeEvent(Event event) {
    int index = _items.indexWhere((element) => element.id == event.id);
    if (index >= 0) {
      _items.removeWhere((value) => value.id == event.id);
      notifyListeners();
    }
  }
}
