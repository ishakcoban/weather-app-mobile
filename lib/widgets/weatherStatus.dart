import 'package:flutter/material.dart';
import '../globals/colors.dart';

class WeatherStatus extends StatelessWidget {
  WeatherStatus(this.path, this.status, this.value, this.width);

  final String path;
  final String status;
  final double value;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.end, children: [
      Container(
        margin: EdgeInsets.symmetric(vertical: 15),
        width: MediaQuery.of(context).size.width * width,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(1 / 4),
              spreadRadius: 0,
              blurRadius: 4,
              offset: Offset(0, 7), // changes position of shadow
            ),
          ],
          color: whiteColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25), bottomLeft: Radius.circular(25)),
        ),
        padding: EdgeInsets.only(top: 15, bottom: 15, left: 10),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.only(left: status == 'Temperature' ? 0 : 8),
              child: Image.asset(
                'assets/images/weatherStatus/$path',
                width: 50,
              ),
            ),
            SizedBox(
              width: status == 'Temperature' ? 0 : 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Text(
                    status,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Text(
                    '${value}',
                    style: TextStyle(fontWeight: FontWeight.w900, fontSize: 25),
                  ),
                )
              ],
            )
          ],
        ),
      )
    ]);
  }
}
