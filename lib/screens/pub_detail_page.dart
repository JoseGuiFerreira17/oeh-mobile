import 'package:flutter/material.dart';
import 'package:oeh/core/assets.dart';
import 'package:oeh/models/pub.dart';

class PubDetailPage extends StatelessWidget {
  const PubDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Pub pub = ModalRoute.of(context)!.settings.arguments as Pub;
    return Scaffold(
      appBar: AppBar(
        title: OEHAssets.getHeader(50),
        toolbarHeight: 80,
        backgroundColor: OEHColors.oehWhite,
      ),
      body: Text(pub.name),
    );
  }
}
