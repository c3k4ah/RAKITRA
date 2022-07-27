import 'package:hive_flutter/hive_flutter.dart';

part 'hive_model.g.dart';

@HiveType(typeId: 0)
class Depense extends HiveObject {
  @HiveField(0)
  late int montant;
  @HiveField(1)
  late int importance;
  @HiveField(2)
  late String desc;
  @HiveField(3)
  late String nature;
  @HiveField(4)
  late bool idDispo;
}

@HiveType(typeId: 1)
class Ressource extends HiveObject {
  @HiveField(0)
  late int montant;
  @HiveField(1)
  late int jourLimite;
  @HiveField(2)
  late String desc;
  @HiveField(3)
  late bool idDispo;
}
//flutter pub run build_runner build --delete-conflicting-outputs