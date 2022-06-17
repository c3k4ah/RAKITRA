// ignore_for_file: depend_on_referenced_packages, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'views/if_no_data.dart';
import 'views/widget/drawer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.removeAfter((initialisation));
  runApp(const MyApp());
}

Future initialisation(BuildContext? context) async {
  await Future.delayed(const Duration(seconds: 3));
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
      home: const NoData(),
    );
  }
}
