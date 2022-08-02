// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weathers_list.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WeathersListAdapter extends TypeAdapter<WeathersList> {
  @override
  final int typeId = 1;

  @override
  WeathersList read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WeathersList(
      (fields[0] as List).cast<Weather>(),
    );
  }

  @override
  void write(BinaryWriter writer, WeathersList obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.items);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WeathersListAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
