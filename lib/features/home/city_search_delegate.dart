import 'package:flutter/material.dart';

import '../../models/weather.dart';
import 'widgets/cities_weather_list.dart';

class CitySearchDelegate extends SearchDelegate {
  final List<Weather> weathers;

  CitySearchDelegate(this.weathers);

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(
      textTheme: const TextTheme(subtitle1: TextStyle(color: Colors.white)),
      inputDecorationTheme: const InputDecorationTheme(
        hintStyle: TextStyle(color: Colors.white),
      ),
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () => query = '',
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return CitiesWeatherList(filteredWeathers(query));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return CitiesWeatherList(filteredWeathers(query));
  }

  List<Weather> filteredWeathers(String query) {
    return weathers.where((element) {
      return element.city.toLowerCase().startsWith(query.toLowerCase());
    }).toList();
  }
}
