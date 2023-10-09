import 'package:flutter/material.dart';
import 'package:two_ears/constants.dart';

import 'package:google_fonts/google_fonts.dart';

class SuccessPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SuccessPagePageState();
  }
}

class _SuccessPagePageState extends State<SuccessPage> {

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
                        "Success!",
                        style: GoogleFonts.roboto(textStyle: scrTitleTextStyle),
                      )
                    ),
                    SizedBox(
                      height: 170,
                    ),
                    Stack(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: 200,
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 0),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: InkWell(
                            onTap: (){
                              Navigator.pushReplacementNamed(context, "/what");
                            },
                            child: Column(
                              children: [
                                Text(
                                  "Click here",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.roboto(textStyle: sGestureTextStyle),
                                ),
                                Text(
                                  "to start using",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.roboto(textStyle: sGestureTextStyle),
                                ),
                                Text(
                                  "2Ears",
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