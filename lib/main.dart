import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';
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
        debugShowCheckedModeBanner: true,
        title: 'Fläckegosler Roteborg',
        theme: ThemeData(
          inputDecorationTheme: kDefaultInputDecorationTheme,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routeInformationParser: VxInformationParser(),
        routerDelegate: VxNavigator(
          routes: {
            "/": (_, __) => MaterialPage(
                  child: HomeScreen(),
                ),
            "/news": (_, news) => MaterialPage(
                  child: SingleNews(news as News),
                ),
            "/image": (_, pictureUrl) => MaterialPage(
                  child: SimplePhotoViewPage(pictureUrl as String),
                ),
            "/history": (_, __) => MaterialPage(
                  child: HistoryPage(),
                ),
            "/honorary_members": (_, __) => MaterialPage(
                  child: HonoraryMembersPage(),
                ),
          },
        ),
      ),
    );
  }
}
