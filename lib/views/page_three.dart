// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:kf_drawer/kf_drawer.dart';

import '../colors.dart';

class PageThree extends KFDrawerContent {
  PageThree({Key? key});

  @override
  State<PageThree> createState() => _PageThreeState();
}

class _PageThreeState extends State<PageThree> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: swatch_5,
      appBar: AppBar(
        backgroundColor: swatch_5,
        elevation: 0,
        title: Text(
          "RAKITRA",
          style: TextStyle(color: swatch_3, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
    );
  }
}
