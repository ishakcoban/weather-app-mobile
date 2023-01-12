import "package:flutter/material.dart";
import 'package:weather_app/globals/colors.dart';

class CustomAppbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      alignment: Alignment.bottomLeft,
      width: double.infinity,
      height: 80,
      child: Container(
        margin: EdgeInsets.only(left: 25, bottom: 13),
        child: Text(
          'Weathy',
          style: TextStyle(
              fontSize: 24,
              color: whiteColor,
              fontWeight: FontWeight.bold,
              fontFamily: 'Courgette'),
        ),
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [blueColorLight, blueColorDark],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
    );
  }
}
