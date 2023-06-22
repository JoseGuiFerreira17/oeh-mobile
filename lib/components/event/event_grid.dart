import 'package:flutter/material.dart';
import 'package:oeh/components/event/event_item.dart';
import 'package:oeh/models/event.dart';
import 'package:oeh/models/events_list.dart';
import 'package:provider/provider.dart';

class EventGrid extends StatelessWidget {
  const EventGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<EventsList>(context).items;
    final List<Event> loadedEvents = provider;
    return SizedBox(
      height: 200,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
          value: loadedEvents[index],
          child: const EventItem(),
        ),
        itemCount: loadedEvents.length,
      ),
    );
  }
}
