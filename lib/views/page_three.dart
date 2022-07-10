// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:wallet/colors.dart';
import 'package:wallet/controller/controller.dart';
import 'package:wallet/model/hive_model.dart';
import 'package:wallet/views/if_no_data.dart';
import 'package:wallet/views/widget/card.dart';

class PageThree extends StatefulWidget {
  const PageThree({Key? key}) : super(key: key);

  @override
  State<PageThree> createState() => _PageThreeState();
}

class _PageThreeState extends State<PageThree> {
  List<bool> values = [false, false, false, false, false];

  final DataController _dataController = DataController();
  List<Ressource> ressources = [];
  @override
  void dispose() {
    Hive.close();
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
                          return Container(
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
                                onChanged: (value) async {
                                  await Boxes.getRessource().putAt(
                                    index,
                                    Ressource()
                                      ..idDispo = value
                                      ..id = ressource.id
                                      ..desc = ressource.desc
                                      ..montant = ressource.montant
                                      ..jourLimite = ressource.jourLimite,
                                  );
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
                  onPressed: (() {
                    //_dataController.addRessource(3, 4500, 3, "NO TEST", false);
                    // print("OKAU");
                    showModalBottomSheet<void>(
                      context: context,
                      backgroundColor: Colors.transparent,
                      builder: (BuildContext context) {
                        return Container(
                          height: width * 6,
                          decoration: BoxDecoration(
                              color: swatch_5,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10))),
                          child: Center(
                            child: NoData(),
                          ),
                        );
                      },
                    );
                  }),
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
