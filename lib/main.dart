// ignore_for_file: depend_on_referenced_packages, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:wallet/model/hive_model.dart';

import 'package:wallet/views/widget/drawer.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.removeAfter((initialisation));

  await Hive.initFlutter();
  Hive.registerAdapter(DepenseAdapter());
  Hive.registerAdapter(RessourceAdapter());

  await Hive.openBox<Depense>('depense');
  await Hive.openBox<Ressource>('ressource');
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
      home: const DrawerAnimated(),
    );
  }
}
