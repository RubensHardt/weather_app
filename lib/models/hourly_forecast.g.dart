// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hourly_forecast.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HourlyForecastAdapter extends TypeAdapter<HourlyForecast> {
  @override
  final int typeId = 2;

  @override
  HourlyForecast read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HourlyForecast(
      temperature: fields[0] as double,
      state: fields[1] as String,
      iconCode: fields[2] as String,
      time: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, HourlyForecast obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.temperature)
      ..writeByte(1)
      ..write(obj.state)
      ..writeByte(2)
      ..write(obj.iconCode)
      ..writeByte(3)
      ..write(obj.time);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HourlyForecastAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
