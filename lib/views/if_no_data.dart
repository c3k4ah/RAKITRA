// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

import 'package:wallet/colors.dart';
import 'package:wallet/model/static_model.dart';

import '../controller/controller.dart';

class NoData extends StatefulWidget {
  const NoData({Key? key}) : super(key: key);

  @override
  State<NoData> createState() => _NoDataState();
}

class _NoDataState extends State<NoData> {
  String dropdownValue = 'Dépenses fixes';
  String periode = "";
  int montant = 0;
  String nom = "";
  int isActive = 0;
  String activeImportance = "";
  final TextEditingController _nomCtrl = TextEditingController();
  final TextEditingController _motantCtrl = TextEditingController();
  late final Importance importance;
  DataController data = DataController();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SizedBox(
      width: width,
      height: height,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: width,
              height: 300,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(15),
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    height: 50,
                    decoration: BoxDecoration(
                      color: swatch_2p,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: TextField(
                      controller: _nomCtrl,
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
                    margin: EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    height: 50,
                    width: width,
                    decoration: BoxDecoration(
                      color: swatch_2p,
                      borderRadius: BorderRadius.circular(15),
                      /* border: Border.all(
                          width: 5,
                          color: swatch_2pp,
                        ),*/
                    ),
                    child: DropdownButton<String>(
                      value: dropdownValue,
                      icon: Icon(
                        UniconsLine.arrow_down,
                        color: swatch_3,
                      ),
                      elevation: 16,
                      style: const TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 17,
                          color: Colors.white),
                      dropdownColor: swatch_2pp,
                      borderRadius: BorderRadius.circular(10),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValue = newValue!;
                        });
                      },
                      items: <String>[
                        'Dépenses fixes',
                        'Dépenses variables',
                        'Dépenses impulsives'
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Container(
                            width: width * .7,
                            padding: EdgeInsets.only(left: 0),
                            child: Text(value),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(15),
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    height: 50,
                    decoration: BoxDecoration(
                      color: swatch_2p,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: TextField(
                      controller: _motantCtrl,
                      style: TextStyle(
                          fontSize: 17,
                          color: swatch_3,
                          fontWeight: FontWeight.normal),
                      decoration: InputDecoration(
                          hintStyle: TextStyle(
                              fontSize: 17,
                              color: swatch_3,
                              fontWeight: FontWeight.normal),
                          suffixText: "Ariary",
                          suffixStyle: TextStyle(
                              fontSize: 15,
                              color: swatch_3,
                              fontWeight: FontWeight.normal),
                          hintText: "Montant",
                          border: InputBorder.none),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    width: width,
                    height: 30,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              activeImportance = importanceList[index].nom;
                              isActive = importanceList[index].id;
                            });
                            print("io eh: $activeImportance");
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 7),
                            width: 100,
                            height: 30,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  width: 2,
                                  color: swatch_3,
                                ),
                                color: (isActive == importanceList[index].id)
                                    ? swatch_3
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(15)),
                            child: Center(
                              child: Text(
                                importanceList[index].nom,
                                style: TextStyle(
                                    fontSize: 15,
                                    color:
                                        (isActive == importanceList[index].id)
                                            ? swatch_2
                                            : swatch_3,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),
                          ),
                        );
                      },
                      itemCount: importanceList.length,
                    ),
                  )
                ],
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
                onPressed: (() {}),
                child: Text(
                  "Enregitrer",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
