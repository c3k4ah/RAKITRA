// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:wallet/colors.dart';

class PageFour extends StatefulWidget {
  const PageFour({Key? key}) : super(key: key);

  @override
  State<PageFour> createState() => _PageFourState();
}

class _PageFourState extends State<PageFour> {
  List<bool> values = [
    false,
    false,
    false,
    false,
    false,
  ];

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
                child: ListView.builder(
                    itemCount: 5,
                    scrollDirection: Axis.vertical,
                    itemBuilder: ((context, index) {
                      return Container(
                        margin: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: swatch_2pp,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: ListTile(
                          leading: Switch(
                            activeColor: swatch_3,
                            inactiveTrackColor: swatch_6,
                            inactiveThumbColor: swatch_6,
                            value: values[0],
                            onChanged: (value) {
                              setState(() {
                                values[0] = !values[0];
                              });
                            },
                          ),
                          title: Text(
                            "Argent de poche venant de votre famille",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 15,
                                color: swatch_3,
                                fontWeight: FontWeight.bold),
                          ),
                          trailing: Text(
                            "15000 Ar",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: swatch_3,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      );
                    })),
              ),
              Container(
                height: 65,
                width: 200,
                decoration: BoxDecoration(
                    color: swatch_2p.withOpacity(.8),
                    borderRadius: BorderRadius.circular(50)),
                padding: EdgeInsets.all(8),
                child: MaterialButton(
                  color: swatch_3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  onPressed: (() {}),
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
