import 'package:flutter/material.dart';
import 'package:two_ears/constants.dart';

import 'package:google_fonts/google_fonts.dart';

class WhatPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _WhatPagePageState();
  }
}

class _WhatPagePageState extends State<WhatPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: double.infinity,
                child: Image.asset(
                  "assets/background.jpg",
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Center(
                      child: Text(
                        "What does 2Ears do?",
                        style: GoogleFonts.roboto(textStyle: wTitleTextStyle),
                      )
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Container(
                      margin: const EdgeInsets.all(30.0),
                      padding: const EdgeInsets.all(25.0),
                      // decoration: BoxDecoration(
                      //   color: Colors.white,
                      // ),
                      child: Column(
                          children: [
                            Text(
                                'The goal of the 2Ears app is to help you listen more and speak less. 2Ears does this by working out the percentage of how much you speak in a conversation. You can’t listen when you speak. Simple.',
                                textDirection: TextDirection.ltr,
                                style: rDescriptionTextStyle
                            ),
                          ]
                      ),
                    ),
                    Stack(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: 250,
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 0),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: InkWell(
                            onTap: (){
                              Navigator.pushReplacementNamed(context, "/recognise");
                            },
                            child: Column(
                              children: [
                                Text(
                                  "Click here to continue",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.roboto(textStyle: sGestureTextStyle),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}