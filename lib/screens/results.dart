import 'package:flutter/material.dart';
import 'package:two_ears/constants.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ResultsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ResultsPagePageState();
  }
}

class _ResultsPagePageState extends State<ResultsPage> {

  String _name="";
  int _voice = 0;
  int _audience = 0;

  void initState() {
    super.initState();
    _loadResults();
  }

  _loadResults() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _name = (prefs.getString('name')??'');
      _voice = (prefs.getInt('voice')??0);
      _audience = (prefs.getInt('audience')??0);
    });
  }

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
                        "Results",
                        style: GoogleFonts.roboto(textStyle: scrTitleTextStyle),
                      )
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Stack(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: 299,
                          padding: EdgeInsets.symmetric(
                              vertical: 20, horizontal: 10),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: [
                              Text(
                                "$_name = you spoke $_voice% of the conversation",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.roboto(textStyle: sGestureTextStyle),
                              ),
                              Text(
                                "",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.roboto(textStyle: sGestureTextStyle),
                              ),
                              Text(
                                "Audience = $_audience% of the conversation",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.roboto(textStyle: sGestureTextStyle),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Center(
                      child: Image.asset(
                        "assets/face.png",
                        height: 150,
                        alignment: Alignment.center,
                      )
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Column(
                      children: [
                        Text(
                          "C'mon $_name",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.roboto(textStyle: sGestureTextStyle),
                        ),
                        Text(
                          "... you can do better!",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.roboto(textStyle: sGestureTextStyle),
                        ),
                      ],
                    ),
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