import 'package:flutter/material.dart';
import 'package:two_ears/constants.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:record/record.dart';

class RecordPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RecordPagePageState();
  }
}

class _RecordPagePageState extends State<RecordPage> {

  bool _recording=true;
  Record _audioRecorder = Record();

  void startRecording() async {

    final filepath = Paths.recording;
    // print(filepath);

    await _audioRecorder.start(path: filepath);
    setState(() {
      _recording = true;
    });
  }

  void pauseRecording() async {
    await _audioRecorder.pause();
    setState(() {
      _recording = false;
    });
  }

  void resumeRecording() async {
    await _audioRecorder.resume();
    setState(() {
      _recording = true;
    });
  }

  void stopRecording() async {
    await _audioRecorder.stop();
    // String? path = await _audioRecorder.stop();
    // print('Output path $path');
    setState(() {
      _recording = false;
    });
    Navigator.pushReplacementNamed(context, "/loading");
  }

  void initState() {
    super.initState();
    startRecording();
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
                        "RECORDING",
                        style: GoogleFonts.roboto(textStyle: rTitleTextStyle),
                      )
                    ),
                    SizedBox(
                      height: 70,
                    ),
                    Stack(
                      children: [
                        Container(
                          child: _recording?
                            InkWell(
                              onTap: () {
                                pauseRecording();
                              },
                              child: Container(
                                width: 50,
                                height: 50,
                                child: Image.asset(
                                  "assets/record-pause.png",
                                  // fit: BoxFit.fill,
                                ),
                              ),
                            ):
                            InkWell(
                              onTap: () {
                                resumeRecording();
                              },
                              child: Container(
                                width: 50,
                                height: 50,
                                child: Image.asset(
                                  "assets/record-play.png",
                                  // fit: BoxFit.fill,
                                ),
                              ),
                            ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: 280,
                      padding: EdgeInsets.symmetric(
                          vertical: 10, horizontal: 0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                          children: [
                            Text(
                                "If you need to take a break ",
                                textDirection: TextDirection.ltr,
                                style: GoogleFonts.roboto(textStyle: sGestureTextStyle),
                            ),
                            Text(
                                "just hit pause ",
                                textDirection: TextDirection.ltr,
                                style: GoogleFonts.roboto(textStyle: sGestureTextStyle),
                            ),
                          ]
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: 200,
                      padding: EdgeInsets.symmetric(
                          vertical: 10, horizontal: 0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                          children: [
                            Text(
                                "At the end ",
                                textDirection: TextDirection.ltr,
                                style: GoogleFonts.roboto(textStyle: sGestureTextStyle),
                            ),
                            Text(
                                "of the conversation ",
                                textDirection: TextDirection.ltr,
                                style: GoogleFonts.roboto(textStyle: sGestureTextStyle),
                            ),
                            Text(
                                "just hit stop",
                                textDirection: TextDirection.ltr,
                                style: GoogleFonts.roboto(textStyle: sGestureTextStyle),
                            )
                          ]
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Stack(
                      children: [
                        Container(
                          child: InkWell(
                            onTap: () {
                              stopRecording();
                            },
                            child: Container(
                              width: 53,
                              height: 53,
                              child: Image.asset(
                                "assets/record-stop.png",
                                // fit: BoxFit.fill,
                              ),
                            ),
                          ),
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
