import 'package:hive_flutter/hive_flutter.dart';

part 'weather.g.dart';

const weatherBox = 'weatherBox';

@HiveType(typeId: 0)
class Weather {
  @HiveField(0)
  final int cityCode;

  @HiveField(1)
  final String city;

  @HiveField(2)
  final String countryCode;

  @HiveField(3)
  final double temperature;

  @HiveField(4)
  final String state;

  @HiveField(5)
  final String iconCode;

  @HiveField(6)
  final String description;

  Weather({
    required this.cityCode,
    required this.city,
    required this.countryCode,
    required this.temperature,
    required this.state,
    required this.iconCode,
    required this.description,
  });

  @override
  bool operator ==(Object other) {
    if (other is Weather) {
      return cityCode == other.cityCode &&
          city == other.city &&
          countryCode == other.countryCode &&
          temperature == other.temperature &&
          state == other.state &&
          iconCode == other.iconCode &&
          description == other.description;
    } else {
      return false;
    }
  }
}
