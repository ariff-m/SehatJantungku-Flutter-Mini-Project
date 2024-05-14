// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:sehatjantungku/utils/gemini_api_key.dart';
import 'package:sehatjantungku/screens/home/home_page.dart';
import 'package:sehatjantungku/screens/maps/maps_page.dart';
import 'package:sehatjantungku/screens/splash/splash_page.dart';
import 'package:sehatjantungku/screens/maps/maps_view_model.dart';
import 'package:sehatjantungku/screens/suggestions/treatment_page.dart';
import 'package:sehatjantungku/screens/suggestions/prevention_page.dart';
import 'package:sehatjantungku/screens/suggestions/suggestion_view_model.dart';
import 'package:sehatjantungku/screens/identification/identification_page.dart';

void main() async {
  await dotenv.load(fileName: '.env');
  Gemini.init(apiKey: geminiKey);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MapsProvider()),
        ChangeNotifierProvider(create: (context) => PreventionViewModel()),
        ChangeNotifierProvider(create: (context) => TreatmentViewModel()),
      ],
      child: MaterialApp(
        title: 'SehatJantungku',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          //'/': (_) => const SplashPage(),
          '/homePage': (_) => MyHomePage(),
          '/identificatonPage': (_) => const IdentificationPage(),
          '/mapsPage': (_) => const MapsPage(),
          '/preventionPage': (_) => const PreventionPage(),
          '/': (_) => const TreatmentPage(),
        },
      ),
    );
  }
}
