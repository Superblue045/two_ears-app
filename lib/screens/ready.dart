import 'package:flutter/material.dart';
import 'package:two_ears/constants.dart';

import 'package:google_fonts/google_fonts.dart';

class ReadyPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ReadyPagePageState();
  }
}

class _ReadyPagePageState extends State<ReadyPage> {

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
                        "Ready to LISTEN?",
                        style: GoogleFonts.roboto(textStyle: rTitleTextStyle),
                      )
                    ),
                    SizedBox(
                      height: 70,
                    ),
                    Stack(
                      children: [
                        Container(
                          child: InkWell(
                            onTap: () {
                              Navigator.pushReplacementNamed(context, "/record");
                            },
                            child: Container(
                              width: 80,
                              height: 160,
                              child: Image.asset(
                                "assets/record-play.png",
                                // fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text(
                        'Hit RECORD to begin',
                        textDirection: TextDirection.ltr,
                        style: rDescriptionTextStyle
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
