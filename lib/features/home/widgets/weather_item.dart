import 'package:flutter/material.dart';

import '../../../models/weather.dart';
import '../../../utils/constants.dart';
import '../../../widgets/temperature.dart';
import '../../../widgets/weather_icon.dart';

const whiteText = TextStyle(color: Colors.white);

class WeatherListItem extends StatelessWidget {
  final Weather weather;
  final VoidCallback onTap;

  const WeatherListItem({
    required this.weather,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(defaultPadding),
        decoration: BoxDecoration(
            color: Colors.blue.withOpacity(0.7),
            borderRadius:
                const BorderRadius.all(Radius.circular(defaultRadius))),
        height: 150,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${weather.city} ${weather.countryCode}',
                  style: whiteText,
                ),
                Text(weather.state, style: whiteText)
              ],
            ),
            Column(
              children: [
                WeatherIcon(iconCode: weather.iconCode),
                Temperature(
                  weather.temperature,
                  style: whiteText,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
