import 'package:flutter/material.dart';
import './eachWeatherStatus.dart';
import '../../globals/colors.dart';

class DailyWeatherStatusBar extends StatelessWidget {
  final dynamic temperature;
  final dynamic wind;
  final dynamic pressure;
  final dynamic humidity;

  const DailyWeatherStatusBar(
      this.temperature, this.wind, this.pressure, this.humidity);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          EachWeatherStatus('temperature', temperature),
          EachWeatherStatus('wind', wind),
          EachWeatherStatus('pressure', pressure),
          EachWeatherStatus('humidity', humidity)
        ],
      ),
    );
  }
}
