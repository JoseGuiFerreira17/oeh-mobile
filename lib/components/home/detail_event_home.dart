import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:oeh/components/botton_bar.dart';
import 'package:oeh/core/assets.dart';
import 'package:oeh/models/event.dart';

class DetailEventHome extends StatelessWidget {
  const DetailEventHome({super.key});

  @override
  Widget build(BuildContext context) {
    final Event? event = ModalRoute.of(context)?.settings.arguments as Event?;
    return Scaffold(
      appBar: AppBar(
        title: OEHAssets.getHeader(50),
        toolbarHeight: 80,
        backgroundColor: OEHColors.oehWhite,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.network(
              event!.imageUrl!,
              height: 250,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
            SizedBox(height: 15),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                event.name.toString(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                event.description.toString(),
                style: const TextStyle(
                  fontSize: 20,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                '${event.street}, ${event.number}, ${event.district},',
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                '${event.city}-${event.state}, ${event.cep}',
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                children: [
                  Icon(
                    Icons.calendar_today_outlined,
                    color: OEHColors.oehPurple,
                  ),
                  Text(
                    DateFormat('EEEE, dd/MM/yyyy', 'pt_BR')
                        .format(DateTime.parse(event.date.toString())),
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 15),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              width: MediaQuery.of(context).size.width * 0.99,
              child: ElevatedButton(
                onPressed: () => MapsLauncher.launchCoordinates(
                  double.parse(event.latitude.toString()),
                  double.parse(event.longitude.toString()),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: OEHColors.oehPurple,
                ),
                child: const Text('Ver localização no mapa'),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}
