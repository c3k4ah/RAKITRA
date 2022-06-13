// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:wallet/colors.dart';

class PageOne extends StatefulWidget {
  const PageOne({Key? key}) : super(key: key);

  @override
  State<PageOne> createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
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
          style: TextStyle(color: swatch_3, fontWeight: FontWeight.w400),
        ),
        centerTitle: true,
      ),
      body: SizedBox(
        width: width,
        height: height,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                color: Colors.transparent,
                height: height * .3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.wallet, color: swatch_3),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "15 000Ar",
                      style: TextStyle(
                          fontSize: 60,
                          color: swatch_3,
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      "votre montant total",
                      style: TextStyle(
                          fontSize: 15,
                          color: swatch_3,
                          fontWeight: FontWeight.normal),
                    )
                  ],
                ),
              ),
              Container(
                color: Colors.transparent,
                height: height * .55,
                width: width,
                child: Stack(
                  alignment: AlignmentDirectional.bottomEnd,
                  children: [
                    Container(
                      height: height * .53,
                      width: width,
                      padding: EdgeInsets.symmetric(horizontal: 25),
                      child: Container(
                        decoration: BoxDecoration(
                            color: swatch_5,
                            boxShadow: [
                              BoxShadow(
                                  color: swatch_1.withOpacity(0.6),
                                  blurRadius: 30,
                                  spreadRadius: 10)
                            ],
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "vos revenus cette semaine",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: swatch_3,
                                  fontWeight: FontWeight.normal),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 350,
                      width: width,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        // padding: EdgeInsets.symmetric(horizontal: 25),
                        decoration: BoxDecoration(
                            color: swatch_3,
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  // ignore: prefer_const_literals_to_create_immutables
                                  children: [
                                    Text(
                                      "10 000Ar",
                                      style: TextStyle(
                                          fontSize: 30,
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal),
                                    ),
                                    Text(
                                      "Total",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Container(
                                  height: 50,
                                  width: 2,
                                  color: Colors.black.withOpacity(0.5),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  // ignore: prefer_const_literals_to_create_immutables
                                  children: [
                                    Text(
                                      "10 000Ar",
                                      style: TextStyle(
                                          fontSize: 30,
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal),
                                    ),
                                    Text(
                                      "Objectif",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            SizedBox(
                              width: width,
                              height: 270,
                              child: ListView.builder(
                                  itemCount: 3,
                                  scrollDirection: Axis.vertical,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      width: width,
                                      height: 80,
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      margin: EdgeInsets.only(
                                          top: 20,
                                          left: 25,
                                          right: 25,
                                          bottom: 5),
                                      decoration: BoxDecoration(
                                          color: swatch_3,
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.black
                                                    .withOpacity(0.15),
                                                blurRadius: 20,
                                                spreadRadius: 6)
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: ListTile(
                                        title: Text(
                                          "7000Ar",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.black,
                                              fontWeight: FontWeight.normal),
                                        ),
                                        subtitle: Text(
                                          "Pour une durée de trois jours",
                                          style: TextStyle(
                                              color: swatch_2,
                                              fontWeight: FontWeight.normal),
                                        ),
                                        trailing: IconButton(
                                            onPressed: () {},
                                            iconSize: 30,
                                            color: swatch_5,
                                            icon: Icon(Icons.add)),
                                      ),
                                    );
                                  }),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
