import 'package:flutter/material.dart';
import 'package:oeh/components/pub_item.dart';
import 'package:oeh/models/pub.dart';
import 'package:oeh/models/pubs_list.dart';
import 'package:provider/provider.dart';

class PubGrid extends StatelessWidget {
  const PubGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PubsList>(context).items;
    final List<Pub> loadedPubs = provider;
    return Container(
      height: 200,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
          value: loadedPubs[index],
          child: PubItem(),
        ),
        itemCount: loadedPubs.length,
      ),
    );
  }
}
