// ignore_for_file: prefer_const_constructors

import 'dart:math';
import 'package:flutter/material.dart';
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
            width: 200,
            // color: Colors.amberAccent,
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                DrawerHeader(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      CircleAvatar(
                        radius: 45,
                      ),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text("Hmida Dev's"),
                      ),
                    ],
                  ),
                ),
                _createDrawerItem(
                    icon: Icons.home,
                    text: "Home",
                    onTap: () {
                      setState(() {
                        _selectedIndex = 0;
                        value == 0 ? value = 1 : value = 0;
                      });
                    },
                    isSelected: _selectedIndex == 0),
                _createDrawerItem(
                    icon: Icons.graphic_eq,
                    text: "Anlayse",
                    onTap: () {
                      setState(() {
                        _selectedIndex = 1;
                        value == 0 ? value = 1 : value = 0;
                      });
                    },
                    isSelected: _selectedIndex == 2),
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
                          icon: Icon(Icons.menu)),
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
          GestureDetector(
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
          )
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
      margin: EdgeInsets.only(right: 15),
      decoration: isSelected
          ? BoxDecoration(
              color: swatch_5,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  bottomRight: Radius.circular(30)))
          : BoxDecoration(color: swatch_2p),
      child: ListTile(
        selected: true,
        hoverColor: Colors.white,
        title: Row(
          children: <Widget>[
            Icon(
              icon,
              color: !isSelected ? Colors.black : Colors.white,
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 20,
                  color: !isSelected ? Colors.black : Colors.white,
                ),
              ),
            )
          ],
        ),
        onTap: onTap,
      ),
    );
  }
}
