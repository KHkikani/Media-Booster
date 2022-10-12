import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? username;

  pref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    username = prefs.getString('username');
    setState(() {
    });
  }

  @override
  void initState() {
    super.initState();
    pref();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("HomePage"),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                await prefs.setBool('isRemembered', false);
                Navigator.of(context).pushReplacementNamed('loginPage');
              },
              icon: const Icon(Icons.power_settings_new),
            ),
          ],
        ),
        body: Center(
          child: Text("Welcome $username"),
        ));
  }
}
