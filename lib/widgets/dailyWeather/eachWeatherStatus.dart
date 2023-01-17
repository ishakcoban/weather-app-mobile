import 'package:flutter/material.dart';
import 'package:dashed_circle/dashed_circle.dart';
import '../../globals/colors.dart';

class EachWeatherStatus extends StatelessWidget {
  final String imagePath;
  final dynamic value;
  const EachWeatherStatus(this.imagePath, this.value);
  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      DashedCircle(
        dashes: 8,
        gapSize: 8,
        child: Container(
            margin: EdgeInsets.all(2),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.all(Radius.circular(
                    ModalRoute.of(context)?.settings.name == '/clothes'
                        ? 45
                        : 35))),
            child: ModalRoute.of(context)?.settings.name == '/clothes'
                ? Image.asset(
                    'assets/images/clothImages/' + imagePath + '.jpg',
                    width: 50,
                  )
                : Image.asset(
                    'assets/images/weatherStatus/' + imagePath + '.png',
                    width: 35,
                  )),
        color: Colors.black,
      ),
      Container(
        alignment: Alignment.center,
        child: Text(ModalRoute.of(context)?.settings.name == '/clothes'
            ? ''
            : value.toInt().toString()),
        decoration: BoxDecoration(
            border: Border.all(color: blackColor),
            color: whiteColor,
            borderRadius: BorderRadius.all(Radius.circular(35))),
        width: MediaQuery.of(context).size.width * 3 / 20,
        height: 25,
      )
    ]);
  }
}
