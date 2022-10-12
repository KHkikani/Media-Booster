import 'package:flutter/material.dart';

import 'Screens/HomePage.dart';
import 'Screens/PhotosPage.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'homepage',
      routes: {
        'homepage': (context) => const HomePage(),
        'photos_page': (context) => const PhotosPage(),
      },
    ),
  );
}