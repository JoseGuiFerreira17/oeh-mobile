import 'package:flutter/material.dart';
import 'package:oeh/components/botton_bar.dart';
import 'package:oeh/components/home/list_events_item.dart';
import 'package:oeh/components/home/list_pubs_home.dart';
import 'package:oeh/core/assets.dart';
import 'package:oeh/utils/app_routes.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: OEHAssets.getHeader(50),
        toolbarHeight: 80,
        backgroundColor: OEHColors.oehWhite,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).padding.top,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              child: const Text(
                'Eventos em destaque',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListEventsItem(),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              child: const Text(
                'Bares',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListPubsHome(),
          ],
        ),
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}
