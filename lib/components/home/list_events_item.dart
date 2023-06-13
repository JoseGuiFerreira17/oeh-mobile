import 'package:flutter/material.dart';
import 'package:oeh/components/home/event_home.dart';
import 'package:oeh/models/event.dart';
import 'package:oeh/models/events_list.dart';
import 'package:provider/provider.dart';

class ListEventsItem extends StatelessWidget {
  const ListEventsItem({super.key});

  @override
  Widget build(BuildContext context) {
    final providerEvent = Provider.of<EventsList>(context).items;
    final List<Event> loadedEvents = providerEvent;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      height: 400,
      child: ListView.builder(
        shrinkWrap: true,
        itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
          value: loadedEvents[index],
          child: const EventHome(),
        ),
        itemCount: loadedEvents.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
