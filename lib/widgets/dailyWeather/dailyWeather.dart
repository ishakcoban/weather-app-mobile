import 'package:flutter/material.dart';
import 'package:weather_app/widgets/dailyWeather/dailyWeatherStatusBar.dart';
import '../../globals/colors.dart';
import '../../services/http.dart';
import 'dart:convert' as convert;

class DailyWeather extends StatelessWidget {
  final Map<String, dynamic> map;
  final int date;
  final dynamic map2;
  const DailyWeather(this.map, this.date, this.map2);

  @override
  Widget build(BuildContext context) {
    Future<List<dynamic>> fetchClothes() async {
      var resp;
      try {
        print("asdsasdssadsadsad");
        var response = await createHttpRequest(
            '/clothesStatus/' + date.toString(), 'GET', {}, context);
        var result = convert.jsonDecode(response.body);
        return convert.jsonDecode(result['clothesStatus']);
      } catch (err) {
        print("Uncaught error: $err");
      }

      return resp;
    }

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
              height: ModalRoute.of(context)?.settings.name == '/clothes'
                  ? 160
                  : 125,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [blueColorLight, Colors.transparent]),
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
                      colors: [blueColorLight, Colors.transparent]),
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
          margin: EdgeInsets.only(
              top: ModalRoute.of(context)?.settings.name == '/clothes'
                  ? 150
                  : 125),
          child: map2 == 'clothes'
              ? FutureBuilder<List<dynamic>>(
                  future: fetchClothes(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return DailyWeatherStatusBar(
                          snapshot.data![0],
                          snapshot.data![1],
                          snapshot.data![2],
                          snapshot.data![3]);
                    } else {
                      return Container();
                    }
                  })
              : DailyWeatherStatusBar(map['temperature'], map['wind'],
                  map['pressure'], map['humidity']),
        ),
        ModalRoute.of(context)?.settings.name == '/clothes'
            ? Container(
                margin: EdgeInsets.only(top: 120),
                child: Text(
                  date == 0
                      ? 'recommended clothes for today'
                      : 'clothes which are the most preferred',
                  style: TextStyle(
                      color: whiteColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              )
            : Container()
      ]),
    );
  }
}
