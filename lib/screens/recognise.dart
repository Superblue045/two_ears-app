import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:two_ears/apis/api.dart';
import 'package:two_ears/constants.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:record/record.dart';

class RecognisePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RecognisePagePageState();
  }
}

class _RecognisePagePageState extends State<RecognisePage> {

  String _token="";
  bool _recognising=false;
  Record _audioRecorder = Record();

  void startRecording() async {
    Map<Permission, PermissionStatus> permissions = await [
      Permission.storage,
      Permission.microphone,
    ].request();

    bool permissionsGranted = permissions[Permission.storage]!.isGranted &&
        permissions[Permission.microphone]!.isGranted;

    if (permissionsGranted) {
      Directory appFolder = Directory(Paths.recoFolder);
      bool appFolderExists = await appFolder.exists();
      if (!appFolderExists) {
        final created = await appFolder.create(recursive: true);
        print(created.path);
      }

      final filepath = Paths.recognise;

      await _audioRecorder.start(path: filepath);
      setState(() {
        _recognising = true;
      });

    } else {
      print('Permissions not granted');
    }
  }

  void stopRecording() async {
    await _audioRecorder.stop();
    setState(() {
      _recognising = false;
    });
    uploadAudio(Paths.recognise, VOICE_UPLOAD);
  }

  void initState() {
    super.initState();
    _loadToken();
  }

  _loadToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _token = (prefs.getString('token')??'');
      _recognising=false;
    });
  }

  uploadAudio(filepath, url) async {
    var request = http.MultipartRequest('POST', Uri.parse(url));

    Map<String, String> headers = {
      // "Accept": "application/json",
      "AccessToken": _token,
    }; // ignore this headers if there is no authentication
    request.headers.addAll(headers);

    request.files.add(await http.MultipartFile.fromPath('file', filepath));
    var res = await request.send();
    if (res.statusCode == 200) {
      Navigator.pushReplacementNamed(context, "/congratulations");
    }
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
                    SizedBox(
                      height: 40,
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
                            borderRadius: BorderRadius.circular(0),
                          ),
                          child: Column(
                            children: [
                              Text(
                                "As the primary user, ",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.roboto(textStyle: sGestureTextStyle),
                              ),
                              Text(
                                "2Ears needs to ",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.roboto(textStyle: sGestureTextStyle),
                              ),
                              Text(
                                "recognise your voice.",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.roboto(textStyle: sGestureTextStyle),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Stack(
                      children: [
                        Container(
                          child: _recognising?
                          InkWell(
                            onTap: () async {
                              stopRecording();
                            },
                            child: Container(
                              width: 120,
                              height: 120,
                              child: Image.asset(
                                "assets/recognise-stop.png",
                                // fit: BoxFit.fill,
                              ),
                            ),
                          ):
                          InkWell(
                            onTap: () async {
                              startRecording();
                            },
                            child: Container(
                              width: 120,
                              height: 120,
                              child: Image.asset(
                                "assets/recognise-play.png",
                                // fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.all(20.0),
                      padding: const EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          Text(
                              "When you're ready press ",
                              textDirection: TextDirection.ltr,
                              style: wrDescriptionTextStyle
                          ),
                          Text(
                              "the above microphone icon ",
                              textDirection: TextDirection.ltr,
                              style: wrDescriptionTextStyle
                          ),
                          Text(
                              "and read aloud the ",
                              textDirection: TextDirection.ltr,
                              style: wrDescriptionTextStyle
                          ),
                          Text(
                              "following words ...",
                              textDirection: TextDirection.ltr,
                              style: wrDescriptionTextStyle
                          ),
                        ]
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(25.0),
                      child: Center(
                        child: (
                          Text(
                              '"Be who you are and say what you feel, because those who mind don\'t matter and those who matter don\'t mind". Dr. Seuss',
                              textDirection: TextDirection.ltr,
                              style: rDescriptionTextStyle
                          )
                        )
                      ),
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