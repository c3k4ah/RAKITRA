import 'package:wallet/model/hive_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class DataController {
  Future addDepense(int montant, int importance, String desc, String nature,
      bool idDispo) async {
    final depense = Depense()
      ..montant = montant
      ..importance = importance
      ..desc = desc
      ..nature = nature
      ..idDispo = idDispo;
    final box = Boxes.getDepense();
    box.add(depense);
  }

  Future<void> editDepense(Depense depense, int montant, int importance,
      String desc, String nature, bool idDispo) async {
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
      int montant, int jourLimite, String desc, bool idDispo) async {
    final ressource = Ressource()
      ..montant = montant
      ..jourLimite = jourLimite
      ..desc = desc
      ..idDispo = idDispo;
    final box = Boxes.getRessource();
    box.add(ressource);
  }

  Future<void> editRessource(Ressource ressource, int index, int montant,
      int jourLimite, String desc, bool idDispo) async {
    ressource.montant = montant;
    ressource.jourLimite = jourLimite;
    ressource.desc = desc;
    ressource.idDispo = idDispo;

    final box = Boxes.getRessource();

    box.putAt(
      index,
      Ressource()
        ..idDispo = ressource.idDispo
        ..desc = ressource.desc
        ..montant = ressource.montant
        ..jourLimite = ressource.jourLimite,
    );
    // ressource.save();
  }

  Future<void> deleteThisResource(int id) async {
    await Boxes.getRessource().deleteAt(id);
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
