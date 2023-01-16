import 'package:flutter/material.dart';
import 'package:weather_app/widgets/dailyWeather/dailyWeatherStatusBar.dart';
import '../../globals/colors.dart';

class DailyWeather extends StatelessWidget {
  final Map<String, dynamic> map;
  final int date;
  const DailyWeather(this.map, this.date);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 30),
      alignment: Alignment.center,
      child: Stack(alignment: Alignment.topCenter, children: [
        Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 35),
              width: MediaQuery.of(context).size.width * 8 / 10,
              height: 125,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [blueColorDark, Colors.transparent]),
                  borderRadius: BorderRadius.all(Radius.circular(18))),
            ),
            Container(
              alignment: Alignment.centerRight,
              height: 85,
              width: double.infinity,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [blueColorDark, Colors.transparent]),
                  borderRadius: BorderRadius.all(Radius.circular(20))),
            )
          ],
        ),
        Container(
          alignment: Alignment.centerRight,
          margin: EdgeInsets.only(top: 45),
          width: MediaQuery.of(context).size.width * 7 / 10,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  date == 0
                      ? 'Today'
                      : date > 1
                          ? date.toString() + " days ago"
                          : date.toString() + " day ago",
                  style: TextStyle(
                      color: blackColor,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
                Text(
                  map['condition'],
                  style: TextStyle(
                      color: blackColor,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w200),
                )
              ]),
        ),
        Container(
            width: MediaQuery.of(context).size.width * 7 / 10,
            alignment: Alignment.centerLeft,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Image.asset(
                map['condition'].toString() == "Partly cloudy"
                    ? 'assets/images/weatherGeneralStatus/partlyCloudy.png'
                    : 'assets/images/weatherGeneralStatus/' +
                        map['condition'].toString().toLowerCase() +
                        '.png',
                width: 100,
              ),
            ])),
        Container(
          margin: EdgeInsets.only(top: 125),
          child: DailyWeatherStatusBar(map['temperature'], map['wind'],
              map['pressure'], map['humidity']),
        )
      ]),
    );
  }
}
