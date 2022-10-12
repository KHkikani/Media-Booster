import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Screen/HomePage.dart';
import 'Screen/Login.dart';
import 'Screen/RegistationPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences prefs = await SharedPreferences.getInstance();

  bool isRemembered = prefs.getBool('isRemembered') ?? false;

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: (isRemembered == false) ? 'registrationPage' : 'homePage',
      routes: {
        // 'homepage': (context) => const HomePage(),
        'loginPage': (context) => const LoginPage(),
        'homePage': (context) => const HomePage(),
        'registrationPage': (context) => const RegistrationPage(),
      },
    ),
  );
}
