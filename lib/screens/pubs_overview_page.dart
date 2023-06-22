// ignore_for_file: prefer_const_constructors, use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:oeh/components/event/event_grid.dart';
import 'package:oeh/components/pub/pub_grid.dart';
import 'package:oeh/utils/app_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/assets.dart';

class PubsOverviewPage extends StatelessWidget {
  const PubsOverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: OEHAssets.getHeader(50),
        toolbarHeight: 80,
        backgroundColor: OEHColors.oehWhite,
        actions: [
          IconButton(
            onPressed: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.remove("access");
              Navigator.of(context).pushReplacementNamed(AppRoutes.HOME);
            },
            icon: Icon(
              Icons.logout,
              color: OEHColors.oehPurple,
              size: 35,
            ),
          )
        ],
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Seja bem vindo, Guilherme!',
              style: TextStyle(
                fontSize: 20,
                color: OEHColors.oehPurple,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Seus bares',
                  style: TextStyle(
                    fontSize: 16,
                    color: OEHColors.oehPurple,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(AppRoutes.PUB_CREATE);
                    },
                    icon: Icon(Icons.add))
              ],
            ),
            SizedBox(
              height: 10,
            ),
            PubGrid(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Seus eventos',
                  style: TextStyle(
                    fontSize: 16,
                    color: OEHColors.oehPurple,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(AppRoutes.EVENT_CREATE);
                    },
                    icon: Icon(Icons.add))
              ],
            ),
            EventGrid(),
          ],
        ),
      ),
    );
  }
}
