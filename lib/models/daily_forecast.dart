import 'package:hive_flutter/hive_flutter.dart';

import 'hourly_forecast.dart';

part 'daily_forecast.g.dart';

@HiveType(typeId: 3)
class DailyForecast {
  @HiveField(0)
  final String date;

  @HiveField(1)
  final List<HourlyForecast> forecasts;

  DailyForecast({required this.date, required this.forecasts});
}
