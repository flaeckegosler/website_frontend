import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:website_frontend/constants.dart';
import 'package:website_frontend/home_screen.dart';
import 'package:website_frontend/models/news_model.dart';
import 'package:website_frontend/provider/member_provider.dart';
import 'package:website_frontend/provider/news_provider.dart';
import 'package:website_frontend/provider/pictures_provider.dart';
import 'package:website_frontend/sections/footer/pages/history.dart';
import 'package:website_frontend/sections/footer/pages/honorary_members.dart';
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
        path: '/image',
        builder: (BuildContext context, GoRouterState state) {
          return SimplePhotoViewPage(state.extra! as String);
        },
      ),
      GoRoute(
        path: '/history',
        builder: (BuildContext context, GoRouterState state) {
          return HistoryPage();
        },
      ),
      GoRoute(
        path: '/honorary_members',
        builder: (BuildContext context, GoRouterState state) {
          return HonoraryMembersPage();
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
