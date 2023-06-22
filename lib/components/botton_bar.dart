import 'package:flutter/material.dart';
import 'package:oeh/core/assets.dart';
import 'package:oeh/utils/app_routes.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      color: OEHColors.oehPurple,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.HOME);
            },
            icon: const Icon(
              Icons.house_outlined,
              color: Colors.white,
              size: 50,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search_outlined,
              color: Colors.white,
              size: 50,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.SPLASH_SCREEN_LOGIN);
            },
            icon: const Icon(
              Icons.manage_accounts_rounded,
              color: Colors.white,
              size: 50,
            ),
          ),
        ],
      ),
    );
  }
}
