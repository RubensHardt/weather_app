import 'package:hive_flutter/hive_flutter.dart';

import '../../models/weather.dart';
import 'models/weathers_list.dart';

class LocalDataSource {
  final HiveInterface hive;

  LocalDataSource(this.hive);

  Future<List<Weather>?> getCurrentWeathers() async {
    try {
      final box = await hive.openBox<WeathersList>(weathersListBox);
      final weathers = box.get(weathersListBox);
      return weathers?.items;
    } catch (error) {
      return Future.error(error);
    }
  }

  Future<void> saveCurrentWeathers(List<Weather> weathers) async {
    final box = await hive.openBox<WeathersList>(weathersListBox);
    box.put(weathersListBox, WeathersList(weathers));
  }
}
