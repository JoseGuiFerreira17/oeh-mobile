import 'package:flutter/material.dart';
import 'package:oeh/components/home/pub_home.dart';
import 'package:oeh/models/pub.dart';
import 'package:oeh/models/pubs_list.dart';
import 'package:provider/provider.dart';

class ListPubsHome extends StatefulWidget {
  const ListPubsHome({super.key});

  @override
  State<ListPubsHome> createState() => _ListPubsHomeState();
}

class _ListPubsHomeState extends State<ListPubsHome> {
  @override
  Widget build(BuildContext context) {
    final providerPub = Provider.of<PubsList>(context).items;
    final List<Pub> loadedPubs = providerPub;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      height: 200,
      child: ListView.builder(
        shrinkWrap: true,
        itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
          value: loadedPubs[index],
          child: const PubHome(),
        ),
        itemCount: loadedPubs.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
