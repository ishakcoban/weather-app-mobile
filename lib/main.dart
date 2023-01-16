import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import './screens/login.dart';
import './screens/register.dart';
import './screens/home.dart';
import './screens/profile.dart';
import './screens/addClothes.dart';
import './screens/clothes.dart';
import './screens/weather.dart';
import 'package:provider/provider.dart';
import './providers/auth.dart';
import './providers/dropdownValues.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<Auth>(create: (_) => Auth()),
          ChangeNotifierProvider<DropdownValues>(
              create: (_) => DropdownValues()),
        ],
        child: MaterialApp(
          initialRoute: '/weather',
          routes: {
            '/login': (_) => Login(),
            '/register': (_) => Register(),
            '/home': (_) => Home(),
            '/addClothes': (_) => AddClothes(),
            '/profile': (_) => Profile(),
            '/clothes': (_) => Clothes(),
            '/weather': (_) => Weather(),
          },
        ));
  }
}
