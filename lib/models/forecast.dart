import 'package:hive_flutter/hive_flutter.dart';

import 'daily_forecast.dart';

part 'forecast.g.dart';

const forecastBox = 'forecastBox';

@HiveType(typeId: 4)
class Forecast {
  @HiveField(0)
  final int cityCode;

  @HiveField(1)
  final String city;

  @HiveField(2)
  final String country;

  @HiveField(3)
  final List<DailyForecast> dailyForecasts;

  Forecast({
    required this.cityCode,
    required this.city,
    required this.country,
    required this.dailyForecasts,
  });
}
