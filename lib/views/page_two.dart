// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:calendar_timeline/calendar_timeline.dart';

import 'package:wallet/colors.dart';

class PageTwo extends StatefulWidget {
  const PageTwo({Key? key}) : super(key: key);

  @override
  State<PageTwo> createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
  DateTime initDate = DateTime.now();
  bool isObj = true;
  int objectif = 20000;
  int total = 13000;
  int pourcentage(int objectif, int total) {
    int step = 0;
    step = (((total * 100) / objectif) * 0.1).round();

    return step;
  }

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
        height: height,
        width: width,
        child: Column(
          children: [
            Container(
              height: height * .65,
              width: width,
              margin: EdgeInsets.all(15),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: swatch_2p, borderRadius: BorderRadius.circular(20)),
              child: Container(
                decoration: BoxDecoration(
                    color: swatch_2pp, borderRadius: BorderRadius.circular(20)),
                child: Column(
                  children: [
                    Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              isObj = !isObj;
                            });
                            print(pourcentage(objectif, total));
                          },
                          child: Container(
                            width: 200,
                            height: 200,
                            decoration: BoxDecoration(
                                color: swatch_3, shape: BoxShape.circle),
                            child: Center(
                              child: !isObj
                                  ? Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Objectif :",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: swatch_1,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        Text(
                                          "$objectif",
                                          style: TextStyle(
                                              fontSize: 35,
                                              color: swatch_1,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        Text(
                                          "Ariary",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: swatch_1,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    )
                                  : Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Total :",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: swatch_1,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        Text(
                                          "$total",
                                          style: TextStyle(
                                              fontSize: 35,
                                              color: swatch_1,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        Text(
                                          "Ariary",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: swatch_1,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                            ),
                          ),
                        ),
                        CircularStepProgressIndicator(
                          selectedColor: swatch_5,
                          totalSteps: 10,
                          currentStep: pourcentage(objectif, total),
                          width: 187,
                          height: 187,
                          roundedCap: (_, isSelected) => isSelected,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 50,
                      child: Center(
                          child: Text(
                        "Tes depenses durant cette journée",
                        style: TextStyle(
                            fontSize: 20,
                            color: swatch_3,
                            fontWeight: FontWeight.normal),
                      )),
                    ),
                    SizedBox(
                      width: width,
                      height: 200,
                      child: ListView.builder(
                          itemCount: 3,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            return Container(
                              width: width,
                              height: 80,
                              padding: EdgeInsets.only(
                                  top: 5, left: 10, right: 0, bottom: 5),
                              margin: EdgeInsets.only(
                                  top: 10, left: 25, right: 25, bottom: 5),
                              decoration: BoxDecoration(
                                  color: swatch_3,
                                  borderRadius: BorderRadius.circular(20)),
                              child: ListTile(
                                title: Text(
                                  "Repas",
                                  style: TextStyle(
                                      fontSize: 25,
                                      color: swatch_2,
                                      fontWeight: FontWeight.normal),
                                ),
                                subtitle: Text(
                                  "700 Ariary",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal),
                                ),
                                trailing: Container(
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      // ignore: prefer_const_literals_to_create_immutables
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.black38,
                                            blurRadius: 15,
                                            spreadRadius: 7)
                                      ]),
                                  child: CircleAvatar(
                                    backgroundColor: swatch_3,
                                    child: IconButton(
                                        onPressed: () {},
                                        iconSize: 25,
                                        color: swatch_5,
                                        icon: Icon(Icons.arrow_forward)),
                                  ),
                                ),
                              ),
                            );
                          }),
                    )
                  ],
                ),
              ),
            ),
            Container(
              height: height * .15,
              width: width,
              margin: EdgeInsets.all(15),
              padding: EdgeInsets.only(bottom: 10, right: 5, left: 5),
              decoration: BoxDecoration(
                  color: swatch_2p, borderRadius: BorderRadius.circular(20)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CalendarTimeline(
                    initialDate: initDate,
                    firstDate: DateTime(2000, 01, 01),
                    lastDate: DateTime(2030, 01, 01),
                    onDateSelected: (date) {
                      print(date);
                    },
                    leftMargin: 10,
                    monthColor: swatch_2p,
                    dayColor: Colors.white,
                    activeDayColor: Colors.white,
                    activeBackgroundDayColor: swatch_5,
                    dotsColor: Color.fromARGB(255, 255, 255, 255),
                    showYears: false,
                    selectableDayPredicate: (date) => date.day != 23,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
