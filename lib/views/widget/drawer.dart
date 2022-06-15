// ignore_for_file: prefer_const_constructors

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

import 'package:wallet/colors.dart';
import 'package:wallet/views/page_one.dart';
import 'package:wallet/views/page_two.dart';

class DrawerAnimated extends StatefulWidget {
  const DrawerAnimated({Key? key}) : super(key: key);

  @override
  State<DrawerAnimated> createState() => _DrawerAnimatedState();
}

class _DrawerAnimatedState extends State<DrawerAnimated> {
  double value = 0;
  int _selectedIndex = 0;
  final _selectedPage = [PageOne(), PageTwo()];

  @override
  void initState() {
    _selectedIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // ! Here Color Of Page Drawer !
          Container(
            decoration: BoxDecoration(color: swatch_2pp),
          ),

          // ! simple navigation menu !
          SafeArea(
              child: Container(
            width: 250,
            //color: Colors.amberAccent,
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                DrawerHeader(
                  child: Container(
                    width: 200,
                    height: 200,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(.5),
                        image: DecorationImage(
                            image: ExactAssetImage(
                                "assets/img/boite_rakitra_with_bg.png"))),
                  ),
                ),
                _createDrawerItem(
                    icon: UniconsLine.home_alt,
                    text: "Home",
                    onTap: () {
                      setState(() {
                        _selectedIndex = 0;
                        value == 0 ? value = 1 : value = 0;
                      });
                    },
                    isSelected: _selectedIndex == 0),
                _createDrawerItem(
                    icon: UniconsLine.graph_bar,
                    text: "Anlayse",
                    onTap: () {
                      setState(() {
                        _selectedIndex = 1;
                        value == 0 ? value = 1 : value = 0;
                      });
                    },
                    isSelected: _selectedIndex == 1),
                Flex(
                  direction: Axis.vertical,
                  children: [
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Container(
                        color: Colors.white,
                        child: Text("TEXT"),
                      ),
                    )
                  ],
                )
              ],
            ),
          )),

          // ! : MainScreen
          TweenAnimationBuilder(
              // ? Here Change Animation
              curve: Curves.easeInOut,
              tween: Tween<double>(begin: 0, end: value),
              // ? and here change
              duration: const Duration(milliseconds: 500),
              builder: (_, double val, __) {
                return (Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..setEntry(0, 3, 200 * val)
                    ..rotateY((pi / 6) * val),
                  child:
                      // !Scafold For MainScreen Here
                      Scaffold(
                    appBar: AppBar(
                      backgroundColor: swatch_5,
                      elevation: 0,
                      leading: IconButton(
                          color: Colors.white,
                          onPressed: () {
                            setState(() {
                              value == 0 ? value = 1 : value = 0;
                            });
                          },
                          icon: Icon(UniconsLine.draggabledots)),
                      title: Text(
                        "RAKITRA",
                        style: TextStyle(
                            color: swatch_3, fontWeight: FontWeight.bold),
                      ),
                      centerTitle: true,
                    ),
                    body: _selectedPage[_selectedIndex],
                  ),
                ));
              }),

          //! Gesture For Slide
          /*GestureDetector(
            onHorizontalDragUpdate: (e) {
              if (e.delta.dx > 0) {
                setState(() {
                  value = 1;
                });
              } else {
                setState(() {
                  value = 0;
                });
              }
            },
          )*/
        ],
      ),
    );
  }

  Widget _createDrawerItem(
      {required IconData icon,
      required String text,
      required GestureTapCallback onTap,
      required bool isSelected}) {
    return Container(
      height: 60,
      margin: EdgeInsets.only(top: 5, bottom: 5),
      decoration: isSelected
          ? BoxDecoration(
              color: swatch_5,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  bottomLeft: Radius.circular(30)))
          : BoxDecoration(color: swatch_2pp),
      child: ListTile(
        selected: true,
        hoverColor: Colors.white,
        leading: Icon(
          icon,
          color: Colors.white,
        ),
        title: Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Text(
                text,
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
        onTap: onTap,
      ),
    );
  }
}
