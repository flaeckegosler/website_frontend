import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
import 'package:website_frontend/api_keys.dart' as api_keys;
import 'package:website_frontend/auth/auth.dart';
import 'package:website_frontend/auth/auth_home_page.dart';
import 'package:website_frontend/auth/login_register_page.dart';
import 'package:website_frontend/auth/pages/music_sheets.dart';
import 'package:website_frontend/auth/pages/premium_features.dart';
import 'package:website_frontend/drive/logosammlung.dart';
import 'package:website_frontend/drive/midisammlung.dart';
import 'package:website_frontend/home_screen.dart';
import 'package:website_frontend/models/news_model.dart';
import 'package:website_frontend/provider/agenda_provider.dart';
import 'package:website_frontend/provider/album_provider.dart';
import 'package:website_frontend/provider/birthday_provider.dart';
import 'package:website_frontend/provider/ehrenmitglieder_provider.dart';
import 'package:website_frontend/provider/goenner_provider.dart';
import 'package:website_frontend/provider/kleiderverkauf_provider.dart';
import 'package:website_frontend/provider/member_provider.dart';
import 'package:website_frontend/provider/news_provider.dart';
import 'package:website_frontend/provider/sound_provider.dart';
import 'package:website_frontend/provider/sujet_provider.dart';
import 'package:website_frontend/provider/vorstand_provider.dart';
import 'package:website_frontend/sections/footer/pages/ehrenmitglieder.dart';
import 'package:website_frontend/sections/footer/pages/goenner_page.dart';
import 'package:website_frontend/sections/footer/pages/kleiderverkauf_page.dart';
import 'package:website_frontend/sections/footer/pages/kontakt_page.dart';
import 'package:website_frontend/sections/footer/pages/sujet.dart';
import 'package:website_frontend/sections/footer/pages/vorstand_page.dart';
import 'package:website_frontend/sections/gallery/galerie_photo_view_page.dart';
import 'package:website_frontend/sections/member/mitglieder_photo_view_page.dart';
import 'package:website_frontend/sections/news/mobile/news_single.dart';
import 'package:website_frontend/themes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: api_keys.FIREBASE_API_KEY,
      appId: "1:382871203406:web:c0593d41ed0a4c08fb5d1f",
      messagingSenderId: "382871203406",
      projectId: 'flaeckegosler',
    ),
  );
  initializeDateFormatting('de_DE').then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  final GoRouter _router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        name: 'home',
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return HomeScreen();
        },
        routes: <GoRoute>[
          GoRoute(
            path: 'news',
            builder: (BuildContext context, GoRouterState state) {
              return SingleNews(state.extra! as News);
            },
          ),
          GoRoute(
            path: 'mitglied/:firstName/:lastName',
            builder: (BuildContext context, GoRouterState state) {
              return MitgliederPhotoViewPage(
                state.pathParameters["firstName"]!,
                state.pathParameters["lastName"]!,
              );
            },
          ),
          GoRoute(
            path: 'ehrenmitglieder',
            builder: (BuildContext context, GoRouterState state) {
              return EhrenMitgliederPage();
            },
          ),
          GoRoute(
            name: 'galerie',
            path: 'galerie/:albumTitleRoute/:pictureIndex',
            builder: (BuildContext context, GoRouterState state) {
              return GaleriePhotoViewPage(
                state.pathParameters["albumTitleRoute"]!,
                state.pathParameters["pictureIndex"]!,
              );
            },
          ),
          GoRoute(
            path: 'auth',
            builder: (BuildContext context, GoRouterState state) {
              if (Auth().user != null) {
                return AuthHomePage();
              } else {
                return LoginPage();
              }
            },
            routes: <GoRoute>[
              GoRoute(
                path: 'home',
                builder: (BuildContext context, GoRouterState state) {
                  return AuthHomePage();
                },
              ),
              GoRoute(
                path: 'noten',
                builder: (BuildContext context, GoRouterState state) {
                  return MusicSheetPage();
                },
              ),
              GoRoute(
                path: 'premium/features',
                builder: (BuildContext context, GoRouterState state) {
                  return PremiumFeaturesPage();
                },
              ),
            ],
          ),
          GoRoute(
            path: 'goenner',
            builder: (BuildContext context, GoRouterState state) {
              return const GoennerPage();
            },
          ),
          GoRoute(
            path: 'sujet',
            builder: (BuildContext context, GoRouterState state) {
              return SujetPage();
            },
          ),
          GoRoute(
            path: 'kleiderverkauf',
            builder: (BuildContext context, GoRouterState state) {
              return const KleiderverkaufPage();
            },
          ),
          GoRoute(
            path: 'kontakt',
            builder: (BuildContext context, GoRouterState state) {
              return KontaktPage();
            },
          ),
          GoRoute(
            path: 'vorstand',
            builder: (BuildContext context, GoRouterState state) {
              return VorstandPage();
            },
          ),
          GoRoute(
            path: 'assets',
            builder: (BuildContext context, GoRouterState state) {
              return const LogoSammlung();
            },
          ),
          GoRoute(
            path: 'midi',
            builder: (BuildContext context, GoRouterState state) {
              return const MidiSammlung();
            },
          ),
        ],
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
        ChangeNotifierProvider.value(
          value: Auth(),
        ),
        ChangeNotifierProvider.value(
          value: AgendaProvider(),
        ),
        ChangeNotifierProvider.value(
          value: KleiderverkaufProvider(),
        ),
        ChangeNotifierProvider.value(
          value: GoennerProvider(),
        ),
        ChangeNotifierProvider.value(
          value: SoundProvider(),
        ),
        ChangeNotifierProvider.value(
          value: BirthdayProvider(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: _router,
        title: 'Fläckegosler Roteborg',
        theme: myTheme,
      ),
    );
  }
}
