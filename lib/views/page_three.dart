// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:unicons/unicons.dart';
import 'package:wallet/colors.dart';
import 'package:wallet/controller/controller.dart';
import 'package:wallet/model/hive_model.dart';

import 'ajout_ressource.dart';

class PageThree extends StatefulWidget {
  const PageThree({Key? key}) : super(key: key);

  @override
  State<PageThree> createState() => _PageThreeState();
}

class _PageThreeState extends State<PageThree> {
  List<bool> values = [false, false, false, false, false];

  final DataController _dataController = DataController();
  List<Ressource> ressources = [];
  bool keyboard(value) {
    bool isActive = false;
    if (value == true) {
      setState(() {
        isActive = true;
      });
    } else {
      setState(() {
        isActive = false;
      });
    }
    return isActive;
  }

  @override
  void dispose() {
    // Hive.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: swatch_5,
      body: SizedBox(
        width: width,
        height: height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "Vos resources sont les revenus durant la semaine (ponctuel ou non ponctuel)",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 15, color: swatch_3, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              SizedBox(
                height: height * .7,
                child: ValueListenableBuilder<Box<Ressource>>(
                  valueListenable: Boxes.getRessource().listenable(),
                  builder: (context, box, _) {
                    final ressources = box.values.toList().cast<Ressource>();
                    return ListView.builder(
                        itemCount: ressources.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: ((context, index) {
                          final ressource = ressources[index];
                          return GestureDetector(
                            onLongPress: () async {
                              // await Boxes.getRessource().deleteAt(index);
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return SimpleDialog(
                                      backgroundColor: Colors.transparent,
                                      children: [
                                        Stack(
                                          alignment:
                                              AlignmentDirectional.topCenter,
                                          children: [
                                            Container(
                                              height: 400,
                                              margin: EdgeInsets.symmetric(
                                                  vertical: 10),
                                              decoration: BoxDecoration(
                                                  color: swatch_3,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          25)),
                                              child: Column(
                                                children: [
                                                  Container(
                                                    height: 250,
                                                    decoration: BoxDecoration(
                                                        color: swatch_5,
                                                        image: DecorationImage(
                                                          image: ExactAssetImage(
                                                              "assets/img/choix.png"),
                                                          fit: BoxFit.cover,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15)),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Text(
                                                      "Faire des modificaions",
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 8.0,
                                                        vertical: 5),
                                                    child: Text(
                                                      "Vous pouvez supprimer ou modifier cette article",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          color: Colors.black),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            5.0),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        MaterialButton(
                                                            color: swatch_4,
                                                            shape: RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12)),
                                                            child: Text(
                                                              "modifier",
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Colors
                                                                      .black),
                                                            ),
                                                            onPressed: () {}),
                                                        MaterialButton(
                                                            color: swatch_6,
                                                            shape: RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12)),
                                                            child: Text(
                                                              "supprimer",
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color:
                                                                      swatch_3),
                                                            ),
                                                            onPressed: () {
                                                              _dataController
                                                                  .deleteThisResource(
                                                                      index);
                                                              Navigator.pop(
                                                                  context);
                                                            }),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Align(
                                                alignment: Alignment.topLeft,
                                                child: GestureDetector(
                                                  onTap: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Container(
                                                    margin: EdgeInsets.zero,
                                                    width: 30,
                                                    height: 30,
                                                    decoration: BoxDecoration(
                                                        boxShadow: [
                                                          BoxShadow(
                                                              color: Colors
                                                                  .black
                                                                  .withOpacity(
                                                                      .2),
                                                              blurRadius: 15,
                                                              spreadRadius: 2)
                                                        ],
                                                        color: swatch_3,
                                                        shape: BoxShape.circle),
                                                    child: Center(
                                                        child: Icon(
                                                      UniconsLine.times,
                                                      size: 20,
                                                      color: swatch_6,
                                                    )),
                                                  ),
                                                )),
                                          ],
                                        )
                                      ],
                                    );
                                  });
                            },
                            child: Container(
                              margin: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: swatch_5,
                                  borderRadius: BorderRadius.circular(17),
                                  boxShadow: [
                                    BoxShadow(
                                        color: swatch_2pp,
                                        blurRadius: 20,
                                        spreadRadius: 2)
                                  ]),
                              child: ListTile(
                                leading: Switch(
                                  activeColor: swatch_3,
                                  inactiveTrackColor: swatch_6,
                                  inactiveThumbColor: swatch_6,
                                  value: ressource.idDispo,
                                  onChanged: (value) {
                                    _dataController.editRessource(
                                        ressource,
                                        index,
                                        ressource.montant,
                                        ressource.jourLimite,
                                        ressource.desc,
                                        value);
                                  },
                                ),
                                title: Text(
                                  ressource.desc,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: swatch_3,
                                      fontWeight: FontWeight.bold),
                                ),
                                trailing: Text(
                                  "${ressource.montant} Ar",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: swatch_3,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          );
                        }));
                  },
                ),
              ),
              Container(
                height: 65,
                width: 200,
                decoration: BoxDecoration(
                    color: swatch_2pp, borderRadius: BorderRadius.circular(50)),
                padding: EdgeInsets.all(8),
                child: MaterialButton(
                  color: swatch_3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  onPressed: () {
                    _dataController.addRessource(2000, 5, "haja", true);
                  },
                  child: Text(
                    "Ajouter une resource",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
