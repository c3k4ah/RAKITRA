// ignore_for_file: prefer_const_constructors, must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';

import 'package:kf_drawer/kf_drawer.dart';
import 'package:wallet/views/page_one.dart';
import 'package:wallet/views/page_two.dart';

import '../../colors.dart';
import 'class_builder.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  late KFDrawerController _drawerController;

  @override
  void initState() {
    super.initState();
    _drawerController = KFDrawerController(
      initialPage: ClassBuilder.fromString('PageOne'),
      items: [
        KFDrawerItem.initWithPage(
          text: Text('MAIN', style: TextStyle(color: Colors.white)),
          icon: Icon(Icons.home, color: Colors.white),
          page: PageOne(),
        ),
        KFDrawerItem.initWithPage(
          text: Text(
            'CALENDAR',
            style: TextStyle(color: Colors.white),
          ),
          icon: Icon(Icons.calendar_today, color: Colors.white),
          page: PageTwo(),
        ),
        KFDrawerItem.initWithPage(
          text: Text(
            'SETTINGS',
            style: TextStyle(color: Colors.white),
          ),
          icon: Icon(Icons.settings, color: Colors.white),
          page: ClassBuilder.fromString('SettingsPage'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: KFDrawer(
//        borderRadius: 0.0,
//        shadowBorderRadius: 0.0,
//        menuPadding: EdgeInsets.all(0.0),
//        scrollable: true,
        controller: _drawerController,
        header: Align(
          alignment: Alignment.centerLeft,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            width: MediaQuery.of(context).size.width * 0.6,
          ),
        ),
        decoration: BoxDecoration(
          color: swatch_2pp,
        ),
      ),
    );
  }
}
