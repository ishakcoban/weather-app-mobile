import "package:flutter/material.dart";
import 'package:weather_app/globals/colors.dart';

class CustomAppbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      alignment: Alignment.centerLeft,
      width: double.infinity,
      height: 80,
      child: Container(
        margin: EdgeInsets.only(left: 25),
        child: Text(
          'Weathy',
          style: TextStyle(
              fontSize: 30,
              color: whiteColor,
              fontWeight: FontWeight.bold,
              fontFamily: 'Courgette'),
        ),
      ),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.8),
            spreadRadius: 4,
            blurRadius: 6,
            offset: Offset(0, 2), // changes position of shadow
          ),
        ],
        gradient: LinearGradient(
          colors: [blueColorLight, blueColorLight],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
    );
  }
}
