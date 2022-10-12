import 'package:flutter/material.dart';
import 'package:splash_screen/Screens/HomePage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Screens/SplashScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isIntroPlayed = prefs.getBool('isIntroPlayed') ?? false;

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: (isIntroPlayed) ? 'homePage' : 'splashScreen',
      routes: {
        'splashScreen': (context) => const SplashScreen(),
        'homePage': (context) => const HomePage(),
      },
    ),
  );
}
