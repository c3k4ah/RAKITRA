import 'package:wallet/model/hive_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class DataController {
  Future addDepense(int id, int montant, int importance, String desc,
      String nature, bool idDispo) async {
    final depense = Depense()
      ..id = id
      ..montant = montant
      ..importance = importance
      ..desc = desc
      ..nature = nature
      ..idDispo = idDispo;
    final box = Boxes.getDepense();
    box.add(depense);
  }

  void editDepense(Depense depense, int id, int montant, int importance,
      String desc, String nature, bool idDispo) {
    depense.montant = montant;
    depense.importance = importance;
    depense.desc = desc;
    depense.nature = nature;
    depense.idDispo = idDispo;

    final box = Boxes.getDepense();
    box.put(depense.key, depense);

    depense.save();
  }

  void deleteDepense(Depense depense) {
    depense.delete();
  }

  Future addRessource(
      int id, int montant, int jourLimite, String desc, bool idDispo) async {
    final ressource = Ressource()
      ..id = id
      ..montant = montant
      ..jourLimite = jourLimite
      ..desc = desc
      ..idDispo = idDispo;
    final box = Boxes.getRessource();
    box.add(ressource);
  }

  void editRessource(Ressource ressource, int id, int montant, int jourLimite,
      String desc, bool idDispo) {
    ressource.montant = montant;
    ressource.jourLimite = jourLimite;
    ressource.desc = desc;
    ressource.idDispo = idDispo;

    final box = Boxes.getRessource();

    box.put(ressource.key, ressource);
    ressource.save();
  }

  void deleteRessource(Depense ressource) {
    ressource.delete();
  }
}

class Boxes {
  static Box<Depense> getDepense() => Hive.box<Depense>('depense');
  static Box<Ressource> getRessource() => Hive.box<Ressource>('ressource');
}

/*class HiveDatabase {
  static Future<void> init() async {
    await Hive.initFlutter();
    await Hive.openBox<Depense>('depense');
    await Hive.openBox<Ressource>('ressource');
  }
}*/
