// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DepenseAdapter extends TypeAdapter<Depense> {
  @override
  final int typeId = 0;

  @override
  Depense read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Depense()
      ..montant = fields[0] as int
      ..importance = fields[1] as int
      ..desc = fields[2] as String
      ..nature = fields[3] as String
      ..idDispo = fields[4] as bool;
  }

  @override
  void write(BinaryWriter writer, Depense obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.montant)
      ..writeByte(1)
      ..write(obj.importance)
      ..writeByte(2)
      ..write(obj.desc)
      ..writeByte(3)
      ..write(obj.nature)
      ..writeByte(4)
      ..write(obj.idDispo);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DepenseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class RessourceAdapter extends TypeAdapter<Ressource> {
  @override
  final int typeId = 1;

  @override
  Ressource read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Ressource()
      ..montant = fields[0] as int
      ..jourLimite = fields[1] as int
      ..desc = fields[2] as String
      ..idDispo = fields[3] as bool;
  }

  @override
  void write(BinaryWriter writer, Ressource obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.montant)
      ..writeByte(1)
      ..write(obj.jourLimite)
      ..writeByte(2)
      ..write(obj.desc)
      ..writeByte(3)
      ..write(obj.idDispo);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RessourceAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
