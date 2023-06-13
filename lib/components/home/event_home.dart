import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:oeh/core/assets.dart';
import 'package:oeh/models/event.dart';
import 'package:oeh/utils/app_routes.dart';
import 'package:provider/provider.dart';

class EventHome extends StatelessWidget {
  const EventHome({super.key});

  @override
  Widget build(BuildContext context) {
    var myGroup = AutoSizeGroup();
    final event = Provider.of<Event>(context);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.grey,
          width: 1,
        ),
      ),
      width: MediaQuery.of(context).size.width * 0.9,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
            child: Image.network(
              event.imageUrl.toString(),
              height: 250,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(height: 10),
          AutoSizeText(
            event.name.toString(),
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            minFontSize: 16,
            group: myGroup,
          ),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.calendar_today,
                color: OEHColors.oehPurple,
              ),
              SizedBox(width: 5),
              AutoSizeText(
                DateFormat('EEEE, dd/MM/yyyy', 'pt_BR')
                    .format(DateTime.parse(event.date.toString())),
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
                minFontSize: 16,
                group: myGroup,
              ),
            ],
          ),
          SizedBox(height: 5),
          AutoSizeText(
            '${event.city} - ${event.state}',
            style: const TextStyle(
              fontSize: 20,
              color: Colors.black,
            ),
            minFontSize: 16,
            group: myGroup,
          ),
          SizedBox(height: 5),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                AppRoutes.DETAIL_EVENT_HOME,
                arguments: event,
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: OEHColors.oehPurple,
            ),
            child: const Text('Saiba Mais'),
          )
        ],
      ),
    );
  }
}
