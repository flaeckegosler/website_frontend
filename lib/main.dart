import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:website_frontend/constants.dart';
import 'package:website_frontend/home_screen.dart';
import 'package:website_frontend/models/news_model.dart';
import 'package:website_frontend/provider/ehrenmitglieder_provider.dart';
import 'package:website_frontend/provider/member_provider.dart';
import 'package:website_frontend/provider/news_provider.dart';
import 'package:website_frontend/provider/pictures_provider.dart';
import 'package:website_frontend/provider/sujet_provider.dart';
import 'package:website_frontend/provider/vorstand_provider.dart';
import 'package:website_frontend/sections/footer/pages/ehrenmitglieder.dart';
import 'package:website_frontend/sections/footer/pages/goenner.dart';
import 'package:website_frontend/sections/footer/pages/kleiderverkauf.dart';
import 'package:website_frontend/sections/footer/pages/sujet.dart';
import 'package:website_frontend/sections/footer/pages/vorstand_page.dart';
import 'package:website_frontend/sections/member/simple_photo_view_page.dart';
import 'package:website_frontend/sections/news/mobile/news_single.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final GoRouter _router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return HomeScreen();
        },
      ),
      GoRoute(
        path: '/news',
        builder: (BuildContext context, GoRouterState state) {
          return SingleNews(state.extra! as News);
        },
      ),
      GoRoute(
        path: '/mitglied/:firstName/:lastName',
        builder: (BuildContext context, GoRouterState state) {
          return SimplePhotoViewPage(state.extra! as String);
        },
      ),
      GoRoute(
        path: '/ehrenmitglieder',
        builder: (BuildContext context, GoRouterState state) {
          return EhrenMitgliederPage();
        },
      ),
      GoRoute(
        path: '/sujet',
        builder: (BuildContext context, GoRouterState state) {
          return SujetPage();
        },
      ),
      GoRoute(
        path: '/kleiderverkauf',
        builder: (BuildContext context, GoRouterState state) {
          return const Kleiderverkauf();
        },
      ),
      GoRoute(
        path: '/goenner',
        builder: (BuildContext context, GoRouterState state) {
          return const Goenner();
        },
      ),
      GoRoute(
        path: '/vorstand',
        builder: (BuildContext context, GoRouterState state) {
          return VorstandPage();
        },
      ),
    ],
  );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: NewsProvider(),
        ),
        ChangeNotifierProvider.value(
          value: MemberProvider(),
        ),
        ChangeNotifierProvider.value(
          value: PicturesProvider(),
        ),
        ChangeNotifierProvider.value(
          value: EhrenMitgliederProvider(),
        ),
        ChangeNotifierProvider.value(
          value: SujetProvider(),
        ),
        ChangeNotifierProvider.value(
          value: VorstandProvider(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: _router,
        debugShowCheckedModeBanner: true,
        title: 'Fläckegosler Roteborg',
        theme: ThemeData(
          inputDecorationTheme: kDefaultInputDecorationTheme,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
      ),
    );
  }
}
