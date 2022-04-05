// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserAdapter extends TypeAdapter<User> {
  @override
  final int typeId = 0;

  @override
  User read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return User(
      fields[0] as String?,
      fields[1] as String?,
      fields[2] as String?,
      fields[3] as String?,
      fields[4] as Balance?,
      fields[5] as Balance?,
      fields[6] as int?,
      fields[7] as int?,
      fields[8] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, User obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.userID)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.phone)
      ..writeByte(4)
      ..write(obj.balance)
      ..writeByte(5)
      ..write(obj.demoBalance)
      ..writeByte(6)
      ..write(obj.activePlans)
      ..writeByte(7)
      ..write(obj.activeDemoPlans)
      ..writeByte(8)
      ..write(obj.devices);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class BalanceAdapter extends TypeAdapter<Balance> {
  @override
  final int typeId = 1;

  @override
  Balance read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Balance(
      fields[0] as dynamic,
      fields[1] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, Balance obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.eth)
      ..writeByte(1)
      ..write(obj.btc);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BalanceAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
