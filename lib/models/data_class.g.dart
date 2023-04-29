// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_class.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DataClassAdapter extends TypeAdapter<DataClass> {
  @override
  final int typeId = 0;

  @override
  DataClass read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DataClass(
      id: fields[0] as int,
      name: fields[1] as String,
      description: fields[2] as String,
      date: fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, DataClass obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DataClassAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
