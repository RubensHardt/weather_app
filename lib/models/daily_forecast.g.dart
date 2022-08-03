// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_forecast.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DailyForecastAdapter extends TypeAdapter<DailyForecast> {
  @override
  final int typeId = 3;

  @override
  DailyForecast read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DailyForecast(
      date: fields[0] as String,
      forecasts: (fields[1] as List).cast<HourlyForecast>(),
    );
  }

  @override
  void write(BinaryWriter writer, DailyForecast obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj.forecasts);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DailyForecastAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
