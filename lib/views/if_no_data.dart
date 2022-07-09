// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

import 'package:wallet/colors.dart';

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
  final TextEditingController _nomCtrl = TextEditingController();
  final TextEditingController _motantCtrl = TextEditingController();
  DataController data = DataController();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: swatch_5,
      appBar: AppBar(
        backgroundColor: swatch_5,
        elevation: 0,
        title: Text(
          "RAKITRA",
          style: TextStyle(color: swatch_3, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SizedBox(
        width: width,
        height: height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 15),
                child: Text(
                  "Ajouter vos depenses mensuel",
                  style: TextStyle(
                      fontSize: 20,
                      color: swatch_3,
                      fontWeight: FontWeight.w400),
                ),
              ),
              SizedBox(
                width: width,
                height: height * .7,
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
                            hintText: "Appelation",
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
                      height: 70,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 7),
                            width: 90,
                            height: 30,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  width: 2,
                                  color: swatch_3,
                                ),
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(15)),
                            child: Center(
                              child: Text(
                                "Obligatoire",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: swatch_3,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 7),
                            width: 100,
                            height: 30,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15)),
                            child: Center(
                              child: Text(
                                "Necessaire",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: swatch_5,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 7),
                            width: 100,
                            height: 30,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  width: 2,
                                  color: swatch_3,
                                ),
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(15)),
                            child: Center(
                              child: Text(
                                "Negligeable",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: swatch_3,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),
                          ),
                        ],
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
      ),
    );
  }
}
