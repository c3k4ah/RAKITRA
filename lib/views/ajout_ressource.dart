// ignore_for_file: prefer_const_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

import 'package:wallet/colors.dart';
import 'package:wallet/model/static_model.dart';

import '../controller/controller.dart';

class AjoutRessource extends StatefulWidget {
  const AjoutRessource({Key? key}) : super(key: key);

  @override
  State<AjoutRessource> createState() => _AjoutRessourceState();
}

class _AjoutRessourceState extends State<AjoutRessource> {
  int montant = 0;
  int jourLimite = 0;
  String desc = "";
  bool idDispo = true;
  final TextEditingController _descCtrl = TextEditingController();
  final TextEditingController _jourLimiteCtrl = TextEditingController();
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
                      controller: _descCtrl,
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
                    margin: EdgeInsets.all(15),
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    height: 50,
                    decoration: BoxDecoration(
                      color: swatch_2p,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: TextField(
                      keyboardType: TextInputType.number,
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
                          suffixText: "Jour",
                          suffixStyle: TextStyle(
                              fontSize: 15,
                              color: swatch_3,
                              fontWeight: FontWeight.normal),
                          hintText: "jour limite",
                          border: InputBorder.none),
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
                      keyboardType: TextInputType.number,
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
