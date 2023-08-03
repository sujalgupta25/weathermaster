import 'package:flutter/material.dart';
import 'package:weather/screens/locations.dart';

import './screens/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Weather",
      home: WelcomeScreen(),
      routes: {
        WelcomeScreen.routeName: (ctx) => WelcomeScreen(),
        LoactionScreen.routeName: (ctx) => LoactionScreen(),
      },
    );
  }
}
