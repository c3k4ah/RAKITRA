// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:wallet/colors.dart';

import 'package:wallet/views/widget/drawer.dart';
//import on board me dependency

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _IntroScreen();
  }
}

class _IntroScreen extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    //this is a page decoration for intro screen
    PageDecoration pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(
          fontSize: 28.0,
          fontWeight: FontWeight.w700,
          color: swatch_1), //tile font size, weight and color
      bodyTextStyle: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 19.0, color: Colors.black),
      //body text size and color

      //decription padding
      imagePadding: EdgeInsets.all(20), //image padding
      boxDecoration: BoxDecoration(
          color: Colors.white), //show linear gradient background of page
    );

    return IntroductionScreen(
      globalBackgroundColor: Colors.white,
      controlsPadding: EdgeInsets.all(0),
      //main background of screen
      pages: [
        //set your page view here
        PageViewModel(
          title: "Categorisation",
          body: "Voous pouvez enregistrer et filter vos depenses du quotidien.",
          image: introImage('assets/animation/premier.json'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Suivie",
          body:
              "Suivre l'evolution de votre porfeuille et l'historique de vos depenses.",
          image: introImage('assets/animation/second.json'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Strategie et analyse",
          body: "Analyse vos transaction et anticipez les graçe aux graphes.",
          image: introImage('assets/animation/troisieme.json'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "C'est parti !",
          body: "Commencer à profiter de notre applicayion",
          image: introImage('assets/animation/wallet.json'),
          decoration: pageDecoration,
        ),

        //add more screen here
      ],

      onDone: () => goHomepage(context), //go to home page on done
      onSkip: () => goHomepage(context), // You can override on skip
      showSkipButton: true,

      nextFlex: 0,
      skip: Text(
        'Passer',
        style: TextStyle(
            fontSize: 15, color: swatch_1, fontWeight: FontWeight.bold),
      ),
      next: Icon(
        Icons.arrow_forward,
        color: swatch_1,
      ),
      done: Text(
        'Commencer',
        style: TextStyle(
            fontSize: 15, fontWeight: FontWeight.w600, color: swatch_1),
      ),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0), //size of dots
        color: Color(0xff5d010f), //color of dots
        activeSize: Size(22.0, 10.0),

        //activeColor: Colors.white, //color of active dot
        activeShape: RoundedRectangleBorder(
          //shave of active dot
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }

  void goHomepage(context) {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) {
      return MainPage();
    }), (Route<dynamic> route) => false);
    //Navigate to home page and remove the intro screen history
    //so that "Back" button wont work.
  }

  Widget introImage(String assetName) {
    //widget to show intro image
    return Align(
      alignment: Alignment.center,
      child: Lottie.asset(assetName,
          width: 400.0, height: 500, repeat: true, fit: BoxFit.cover),
    );
  }
}
