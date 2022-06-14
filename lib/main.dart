import 'package:flutter/material.dart';

import 'views/intro/introduction.dart';
import 'views/widget/class_builder.dart';

void main() {
  ClassBuilder.registerClasses();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RAKITRA',
      theme: ThemeData(fontFamily: "CaviarDreams"),
      debugShowCheckedModeBanner: false,
      home: const IntroScreen(),
    );
  }
}
