// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:hive_flutter/hive_flutter.dart';

import 'package:unicons/unicons.dart';
import 'package:wallet/colors.dart';
import 'package:wallet/controller/controller.dart';
import 'package:wallet/model/hive_model.dart';

class PageThree extends StatefulWidget {
  const PageThree({Key? key}) : super(key: key);

  @override
  State<PageThree> createState() => _PageThreeState();
}

class _PageThreeState extends State<PageThree> {
  List<bool> values = [false, false, false, false, false];

  final DataController _dataController = DataController();
  final TextEditingController _descriController = TextEditingController();
  final TextEditingController _montantController = TextEditingController();
  final TextEditingController _jController = TextEditingController();
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
  void initState() {
    _descriController.text = "";
    _montantController.text = "";
    super.initState();
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
                              await popChoice(
                                  index,
                                  ressource.montant,
                                  ressource.jourLimite,
                                  ressource.desc,
                                  ressource.idDispo);
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

  Future popChoice(
      int index, int montant, int jourLimite, String desc, bool idDispo) {
    return showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            backgroundColor: Colors.transparent,
            children: [
              Stack(
                alignment: AlignmentDirectional.topCenter,
                children: [
                  Container(
                    height: 400,
                    margin: EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                        color: swatch_3,
                        borderRadius: BorderRadius.circular(25)),
                    child: Column(
                      children: [
                        Container(
                          height: 250,
                          decoration: BoxDecoration(
                              color: swatch_5,
                              image: DecorationImage(
                                image: ExactAssetImage("assets/img/choix.png"),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(15)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Faire des modificaions",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 5),
                          child: Text(
                            "Vous pouvez supprimer ou modifier cette article",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 15, color: Colors.black),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                width: 100,
                                height: 40,
                                child: MaterialButton(
                                    color: swatch_4,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: Text(
                                      "modifier",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context);
                                      Future.delayed(Duration(seconds: 1),
                                          () async {
                                        return popEdit(index, montant,
                                            jourLimite, desc, idDispo);
                                      });
                                    }),
                              ),
                              SizedBox(
                                width: 100,
                                height: 40,
                                child: MaterialButton(
                                    color: swatch_6,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: Text(
                                      "supprimer",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: swatch_3),
                                    ),
                                    onPressed: () {
                                      _dataController.deleteThisResource(index);
                                      Navigator.pop(context);
                                    }),
                              ),
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
                          decoration: BoxDecoration(boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(.2),
                                blurRadius: 15,
                                spreadRadius: 2)
                          ], color: swatch_3, shape: BoxShape.circle),
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
  }

  Future popEdit(
      int index, int montant, int jourLimite, String desc, bool idDispo) {
    setState(() {
      _descriController.text = desc;
      _montantController.text = montant.toString();
      _jController.text = jourLimite.toString();
    });
    return showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            backgroundColor: Colors.transparent,
            children: [
              Container(
                height: 320,
                margin: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                    color: swatch_5, borderRadius: BorderRadius.circular(25)),
                child: Column(
                  children: [
                    SingleChildScrollView(
                      child: Container(
                        height: 250,
                        decoration: BoxDecoration(
                            color: swatch_3,
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 5),
                              padding: EdgeInsets.symmetric(horizontal: 25),
                              height: 110,
                              decoration: BoxDecoration(
                                color: swatch_6,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: TextField(
                                controller: _descriController,
                                maxLines: 4,
                                style: TextStyle(
                                    fontSize: 17,
                                    color: swatch_3,
                                    fontWeight: FontWeight.normal),
                                decoration: InputDecoration(
                                    hintStyle: TextStyle(
                                        fontSize: 17,
                                        color: swatch_3,
                                        fontWeight: FontWeight.normal),
                                    hintText: "Description",
                                    border: InputBorder.none),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 5),
                              padding: EdgeInsets.symmetric(horizontal: 25),
                              height: 50,
                              decoration: BoxDecoration(
                                color: swatch_6,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: TextField(
                                controller: _jController,
                                style: TextStyle(
                                    fontSize: 17,
                                    color: swatch_3,
                                    fontWeight: FontWeight.normal),
                                keyboardType: TextInputType.number,
                                maxLines: 1,
                                decoration: InputDecoration(
                                    hintStyle: TextStyle(
                                        fontSize: 17,
                                        color: swatch_3,
                                        fontWeight: FontWeight.normal),
                                    suffixText: 'Jours',
                                    suffixStyle: TextStyle(
                                        fontSize: 17,
                                        color: swatch_3,
                                        fontWeight: FontWeight.normal),
                                    hintText: "jours limite du ressource",
                                    border: InputBorder.none),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 5),
                              padding: EdgeInsets.symmetric(horizontal: 25),
                              height: 50,
                              decoration: BoxDecoration(
                                color: swatch_6,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: TextField(
                                controller: _montantController,
                                style: TextStyle(
                                    fontSize: 17,
                                    color: swatch_3,
                                    fontWeight: FontWeight.normal),
                                keyboardType: TextInputType.number,
                                maxLines: 1,
                                decoration: InputDecoration(
                                    hintStyle: TextStyle(
                                        fontSize: 17,
                                        color: swatch_3,
                                        fontWeight: FontWeight.normal),
                                    suffixText: 'Ariary',
                                    suffixStyle: TextStyle(
                                        fontSize: 17,
                                        color: swatch_3,
                                        fontWeight: FontWeight.normal),
                                    hintText: "montant",
                                    border: InputBorder.none),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: 100,
                            height: 40,
                            child: MaterialButton(
                                color: swatch_4,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)),
                                child: Text(
                                  "enregister",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                                onPressed: () async {
                                  /* _dataController.editRessource(index, montant,
                                      jourLimite, desc, idDispo);*/
                                  await Boxes.getRessource().putAt(
                                    index,
                                    Ressource()
                                      ..idDispo = idDispo
                                      ..desc = _descriController.text
                                      ..montant =
                                          int.parse(_montantController.text)
                                      ..jourLimite =
                                          int.parse(_jController.text),
                                  );
                                  Navigator.pop(context);
                                  print([
                                    index,
                                    montant,
                                    jourLimite,
                                    desc,
                                    idDispo
                                  ]);
                                }),
                          ),
                          SizedBox(
                            width: 100,
                            height: 40,
                            child: MaterialButton(
                                color: swatch_6,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)),
                                child: Text(
                                  "annuler",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: swatch_3),
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                }),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          );
        });
  }
}
