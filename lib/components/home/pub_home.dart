import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:oeh/core/assets.dart';
import 'package:oeh/models/pub.dart';
import 'package:oeh/utils/app_routes.dart';
import 'package:provider/provider.dart';

class PubHome extends StatelessWidget {
  const PubHome({super.key});

  @override
  Widget build(BuildContext context) {
    final pub = Provider.of<Pub>(context);
    var myGroup = AutoSizeGroup();
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              bottomLeft: Radius.circular(16),
            ),
            child: Image.network(
              pub.imageUrl.toString(),
              height: double.infinity,
              width: 200,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AutoSizeText(
                  pub.name.toString(),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  minFontSize: 12,
                  group: myGroup,
                ),
                SizedBox(width: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.access_time,
                      color: OEHColors.oehPurple,
                    ),
                    SizedBox(width: 5),
                    AutoSizeText(
                      '${pub.opennigTime} - ${pub.closingTime}',
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                      minFontSize: 12,
                      group: myGroup,
                    ),
                  ],
                ),
                SizedBox(width: 5),
                AutoSizeText(
                  '${pub.city} - ${pub.state}',
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                  minFontSize: 12,
                  group: myGroup,
                ),
                SizedBox(width: 5),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      AppRoutes.DETAIL_PUB_HOME,
                      arguments: pub,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: OEHColors.oehPurple,
                  ),
                  child: const Text('Saiba Mais'),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
