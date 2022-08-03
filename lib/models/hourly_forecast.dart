import 'package:hive_flutter/hive_flutter.dart';

part 'hourly_forecast.g.dart';

@HiveType(typeId: 2)
class HourlyForecast {
  @HiveField(0)
  final double temperature;

  @HiveField(1)
  final String state;

  @HiveField(2)
  final String iconCode;

  @HiveField(3)
  final String time;

  HourlyForecast({
    required this.temperature,
    required this.state,
    required this.iconCode,
    required this.time,
  });
}
