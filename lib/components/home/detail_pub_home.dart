// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:oeh/core/assets.dart';
import 'package:oeh/models/pub.dart';

class DetailPubHome extends StatelessWidget {
  const DetailPubHome({super.key});

  @override
  Widget build(BuildContext context) {
    final Pub? pub = ModalRoute.of(context)?.settings.arguments as Pub?;
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
              pub!.imageUrl!,
              height: 250,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
            SizedBox(height: 15),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                pub.name.toString(),
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
                pub.description.toString(),
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
                '${pub.street}, ${pub.number}, ${pub.district},',
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                '${pub.city}-${pub.state}, ${pub.cep}',
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
                    Icons.access_time,
                    color: OEHColors.oehPurple,
                  ),
                  Text(
                    '${pub.opennigTime} - ${pub.closingTime}',
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
                  double.parse(pub.latitude.toString()),
                  double.parse(pub.longitude.toString()),
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
      bottomNavigationBar: BottomAppBar(),
    );
  }
}
