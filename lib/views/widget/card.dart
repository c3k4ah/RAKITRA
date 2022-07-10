import 'package:flutter/material.dart';

import '../../colors.dart';

Widget cardRessource(
    {required BuildContext context,
    required GestureTapCallback onTap,
    required int montant,
    required String desc,
    required bool idDispo}) {
  /*final montant = ressource.montant.toString();
  final desc = ressource.desc;
  final idDispo = ressource.idDispo;*/
  return InkWell(
    onTap: onTap,
    child: Container(
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: swatch_5,
          borderRadius: BorderRadius.circular(17),
          boxShadow: [
            BoxShadow(color: swatch_2pp, blurRadius: 20, spreadRadius: 2)
          ]),
      child: ListTile(
        leading: Switch(
          activeColor: swatch_3,
          inactiveTrackColor: swatch_6,
          inactiveThumbColor: swatch_6,
          value: idDispo,
          onChanged: (value) {},
        ),
        title: Text(
          desc,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 15, color: swatch_3, fontWeight: FontWeight.bold),
        ),
        trailing: Text(
          "$montant Ar",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: swatch_3, fontSize: 15, fontWeight: FontWeight.bold),
        ),
      ),
    ),
  );
}
