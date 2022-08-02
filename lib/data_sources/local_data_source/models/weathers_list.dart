import 'package:hive_flutter/hive_flutter.dart';

import '../../../models/weather.dart';

part 'weathers_list.g.dart';

const weathersListBox = 'weathersList';

// This model is used because Hive can't handle storing lists directly
@HiveType(typeId: 1)
class WeathersList {
  @HiveField(0)
  final List<Weather> items;

  WeathersList(this.items);
}
