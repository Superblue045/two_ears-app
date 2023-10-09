import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:two_ears/constants.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

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
                    Text(
                      "Welcome",
                      style: GoogleFonts.roboto(textStyle: hTitleTextStyle),
                    ),
                    Text(
                      "to",
                      style: GoogleFonts.roboto(textStyle: hTitleTextStyle),
                    ),
                    Text(
                      "2Ears",
                      style: GoogleFonts.roboto(textStyle: hTitleTextStyle),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Center(
                        child: Image.asset(
                          "assets/logo.png",
                          height: 30,
                          width: 30,
                          alignment: Alignment.center,
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 180,
                      child: Text(
                        "TWebile",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.roboto(textStyle: hCompanyTextStyle),
                      ),
                    ),
                    SizedBox(
                      height: 100,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, "/signup");
                      },
                      child: Text(
                        "New User?",
                        style: GoogleFonts.roboto(textStyle: hGestureTextStyle),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, "/signin");
                      },
                      child: Text(
                        "Already have an account?",
                        style: GoogleFonts.roboto(textStyle: hGestureTextStyle),
                      ),
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
