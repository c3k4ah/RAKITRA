import 'package:flutter/material.dart';
import 'package:wallet/views/page_one.dart';
import 'package:wallet/views/page_two.dart';

void main() {
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
      home: PageTwo(),
    );
  }
}
