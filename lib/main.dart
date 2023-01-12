import 'package:flutter/material.dart';
import './screens/login.dart';
import './screens/register.dart';
import './screens/home.dart';
import './screens/profile.dart';
import './screens/addClothes.dart';
import './screens/clothes.dart';
import './screens/weather.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (_) => Login(),
        '/register': (_) => Register(),
        '/home': (_) => Home(),
        '/addClothes': (_) => AddClothes(),
        '/profile': (_) => Profile(),
        '/clothes': (_) => Clothes(),
        '/weather': (_) => Weather(),
      },
    );
  }
}
