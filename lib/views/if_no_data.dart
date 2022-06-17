import 'package:flutter/material.dart';

import 'package:wallet/colors.dart';

class NoData extends StatelessWidget {
  const NoData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: swatch_5,
      appBar: AppBar(),
      body: SizedBox(
        width: width,
        height: height,
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
