import 'package:flutter/material.dart';

import 'package:two_ears/screens/home.dart';
import 'package:two_ears/screens/signup.dart';
import 'package:two_ears/screens/success.dart';
import 'package:two_ears/screens/signin.dart';
import 'package:two_ears/screens/what.dart';
import 'package:two_ears/screens/recognise.dart';
import 'package:two_ears/screens/congratulations.dart';
import 'package:two_ears/screens/ready.dart';
import 'package:two_ears/screens/record.dart';
import 'package:two_ears/screens/results.dart';
import 'package:two_ears/screens/loading.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false,home: MyApp(),));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Stack(children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          child: Image.asset(
            "assets/background.jpg",
            fit: BoxFit.fill,
          ),
        ),
        Home()
      ],),
      theme: ThemeData.light(),
      routes: <String, WidgetBuilder>{
        '/home': (BuildContext context) => new Home(),
        '/signup': (BuildContext context) => new SignUp(),
        '/success' :(context) => new SuccessPage(),
        '/signin': (BuildContext context) => new SignIn(),
        '/what' :(context) => new WhatPage(),
        '/recognise' :(context) => new RecognisePage(),
        '/congratulations' :(context) => new CongratulationsPage(),
        '/ready' :(context) => new ReadyPage(),
        '/record' :(context) => new RecordPage(),
        '/results' :(context) => new ResultsPage(),
        '/loading' :(context) => new LoadingPage(),
      },
    );
  }
}


// void main() => runApp(TC());
//
// class TC extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       initialRoute: '/',
//       debugShowCheckedModeBanner: false,
//       routes: {
//         '/': (context) => Home(),
//         '/login': (context) => SignIn(),
//         '/signup' :(context) => SignUp(),
//         '/success' :(context) => SuccessPage(),
//         '/what' :(context) => WhatPage(),
//         '/congratulations' :(context) => CongratulationsPage(),
//         '/recognise' :(context) => RecognisePage(),
//         '/record' :(context) => RecordPage(),
//         // '/loading' :(context) => LoadingPage(),
//         '/results' :(context) => new ResultsPage(),
//       },
//     );
//   }
// }
