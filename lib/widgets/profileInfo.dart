import 'package:flutter/material.dart';
import 'package:weather_app/globals/colors.dart';

class ProfileInfo extends StatelessWidget {
  ProfileInfo(this.title, this.value);

  final String title;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      children: [
        Container(
          margin: EdgeInsets.only(left: 20),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(color: blackColor, width: 3 / 2)),
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 55),
              ),
              Positioned.fill(
                  child: Container(
                alignment: Alignment.center,
                child: Text(title),
              ))
            ],
          ),
        ),
        Container(
          width: 65,
          height: 1,
          color: blackColor,
        ),
        Container(
          width: 15,
          height: 15,
          decoration: BoxDecoration(
            color: blackColor,
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 20),
          child: Text(
            value,
            style: TextStyle(
                color: whiteColor,
                fontFamily: 'Inter',
                fontWeight: FontWeight.bold,
                fontSize: 15),
          ),
        )
      ],
    ));
  }
}
