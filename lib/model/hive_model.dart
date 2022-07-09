import 'package:hive_flutter/hive_flutter.dart';

part 'hive_model.g.dart';

@HiveType(typeId: 0)
class Depense extends HiveObject {
  @HiveField(0)
  late int id;
  @HiveField(1)
  late int montant;
  @HiveField(2)
  late int importance;
  @HiveField(3)
  late String desc;
  @HiveField(4)
  late String nature;
  @HiveField(5)
  late bool idDispo;
}

@HiveType(typeId: 1)
class Ressource extends HiveObject {
  @HiveField(0)
  late int id;
  @HiveField(1)
  late int montant;
  @HiveField(2)
  late int jourLimite;
  @HiveField(3)
  late String desc;
  @HiveField(4)
  late bool idDispo;
}
