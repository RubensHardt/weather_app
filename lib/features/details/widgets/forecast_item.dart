import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../models/hourly_forecast.dart';
import '../../../utils/constants.dart';
import '../../../widgets/temperature.dart';
import '../../../widgets/weather_icon.dart';

class ForecastItem extends StatelessWidget {
  final HourlyForecast forecast;

  const ForecastItem(this.forecast, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //The random date is only used to parse the DateTime
    const randomDate = '2012-02-27';
    final time =
        DateFormat.j().format(DateTime.parse('$randomDate ${forecast.time}'));
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(time),
          Temperature(forecast.temperature),
          Text(forecast.state),
          WeatherIcon(
            iconCode: forecast.iconCode,
            width: 50,
          ),
        ],
      ),
    );
  }
}
