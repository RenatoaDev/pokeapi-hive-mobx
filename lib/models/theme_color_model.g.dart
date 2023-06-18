// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_color_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ThemeColorModelAdapter extends TypeAdapter<ThemeColorModel> {
  @override
  final int typeId = 0;

  @override
  ThemeColorModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ThemeColorModel(
      primaryColor: fields[0] as Color,
    );
  }

  @override
  void write(BinaryWriter writer, ThemeColorModel obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.primaryColor);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ThemeColorModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
