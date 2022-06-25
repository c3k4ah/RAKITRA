// ignore_for_file: prefer_const_constructors, must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';

import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:calendar_timeline/calendar_timeline.dart';

import 'package:wallet/colors.dart';

import '../service/services.dart';

class PageTwo extends StatefulWidget {
  @override
  State<PageTwo> createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
  DateTime initDate = DateTime.now();
  bool isObj = true;
  int objectif = 20000;
  int total = 13000;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: swatch_5,
      body: SizedBox(
        height: height,
        width: width,
        child: SingleChildScrollView(
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
                      color: swatch_2pp,
                      borderRadius: BorderRadius.circular(20)),
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
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            "$objectif",
                                            style: TextStyle(
                                              fontSize: 35,
                                              color: swatch_1,
                                            ),
                                          ),
                                          Text(
                                            "Ariary",
                                            style: TextStyle(
                                              fontSize: 20,
                                              color: swatch_1,
                                            ),
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
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            "$total",
                                            style: TextStyle(
                                              fontSize: 35,
                                              color: swatch_1,
                                            ),
                                          ),
                                          Text(
                                            "Ariary",
                                            style: TextStyle(
                                              fontSize: 20,
                                              color: swatch_1,
                                            ),
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
                              fontSize: 18,
                              color: swatch_3,
                              fontWeight: FontWeight.bold),
                        )),
                      ),
                      SizedBox(
                        width: width,
                        height: 165,
                        child: ListView.builder(
                            itemCount: 3,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) {
                              return Container(
                                width: width,
                                height: 70,
                                padding: EdgeInsets.only(
                                    top: 3, left: 10, right: 0, bottom: 5),
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
                                        fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: Text(
                                    "700 Ariary",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600),
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
              Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Container(
                    height: 130,
                    width: width,
                    margin: EdgeInsets.all(15),
                    //padding: EdgeInsets.only(bottom: 20, right: 5, left: 5),
                    decoration: BoxDecoration(
                        color: swatch_2p,
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  Container(
                    margin: EdgeInsets.all(17),
                    child: CalendarTimeline(
                      initialDate: initDate,
                      firstDate: DateTime(2000, 01, 01),
                      lastDate: DateTime(2030, 01, 01),
                      onDateSelected: (date) {},
                      leftMargin: 10,
                      monthColor: swatch_3,
                      dayColor: Colors.white,
                      activeDayColor: Colors.white,
                      activeBackgroundDayColor: swatch_5,
                      dotsColor: Color.fromARGB(255, 255, 255, 255),
                      showYears: false,
                      selectableDayPredicate: (date) => date.day != 23,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
