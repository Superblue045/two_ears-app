import 'package:flutter/material.dart';
import 'package:two_ears/constants.dart';

import 'package:google_fonts/google_fonts.dart';

class CongratulationsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CongratulationsPagePageState();
  }
}

class _CongratulationsPagePageState extends State<CongratulationsPage> {

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
                        "Congratulations!",
                        style: GoogleFonts.roboto(textStyle: scrTitleTextStyle),
                      )
                    ),
                    SizedBox(
                      height: 70,
                    ),
                    Stack(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: 200,
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 0),
                          // height: 80,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: InkWell(
                            onTap: (){
                              Navigator.pushReplacementNamed(context, "/ready");
                            },
                            child: Column(
                              children: [
                                Text(
                                  "2Ears now has ",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.roboto(textStyle: sGestureTextStyle),
                                ),
                                Text(
                                  "a permanent print ",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.roboto(textStyle: sGestureTextStyle),
                                ),
                                Text(
                                  "of your voice",
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