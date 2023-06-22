import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:oeh/components/home/detail_event_home.dart';
import 'package:oeh/components/home/detail_pub_home.dart';
import 'package:oeh/models/events_list.dart';
import 'package:oeh/models/pubs_list.dart';
import 'package:oeh/models/users_list.dart';
import 'package:oeh/screens/create_event.dart';
import 'package:oeh/screens/create_user.dart';
import 'package:oeh/screens/home.dart';
import 'package:oeh/screens/login_page.dart';
import 'package:oeh/screens/pub/create_pub.dart';
import 'package:oeh/screens/pub_detail_page.dart';
import 'package:oeh/screens/pubs_overview_page.dart';
import 'package:oeh/screens/splash_screen_login.dart';
import 'package:oeh/utils/app_routes.dart';
import 'package:provider/provider.dart';

class OehApp extends StatelessWidget {
  const OehApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => PubsList(),
        ),
        ChangeNotifierProvider(
          create: (_) => EventsList(),
        ),
        ChangeNotifierProvider(
          create: (_) => UsersList(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('pt', 'BR'),
        ],
        home: const Home(),
        routes: {
          AppRoutes.PUB_DETAIL: (context) => const PubDetailPage(),
          AppRoutes.PUB_OVERVIEW: (context) => const PubsOverviewPage(),
          AppRoutes.PUB_CREATE: (context) => const CreatePub(),
          AppRoutes.EVENT_CREATE: (context) => const CreateEvent(),
          AppRoutes.USER_CREATE: (context) => const CreateUser(),
          AppRoutes.LOGIN: (context) => const LoginPage(),
          AppRoutes.HOME: (context) => const Home(),
          AppRoutes.DETAIL_EVENT_HOME: (context) => const DetailEventHome(),
          AppRoutes.DETAIL_PUB_HOME: (context) => const DetailPubHome(),
          AppRoutes.SPLASH_SCREEN_LOGIN: (context) => const SplashScreenLogin(),
        },
      ),
    );
  }
}
