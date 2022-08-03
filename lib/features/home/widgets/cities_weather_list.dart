import 'package:flutter/material.dart';

import '../../../models/weather.dart';
import '../../../utils/constants.dart';
import '../../details/details_page.dart';
import 'weather_item.dart';

class CitiesWeatherList extends StatelessWidget {
  final List<Weather> weathers;

  const CitiesWeatherList(this.weathers, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(defaultPadding),
      child: ListView.separated(
        itemCount: weathers.length,
        itemBuilder: (context, index) {
          final weather = weathers[index];
          return WeatherListItem(
            weather: weather,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => DetailsPage(weather.cityCode, weather.city),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: defaultPadding,
          );
        },
      ),
    );
  }
}
