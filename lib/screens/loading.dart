import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:two_ears/constants.dart';
import 'package:two_ears/apis/api.dart';

import 'package:google_fonts/google_fonts.dart';

class LoadingPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoadingPagePageState();
  }
}

class _LoadingPagePageState extends State<LoadingPage> {

  String _token="";

  void initState() {
    super.initState();
    _loadToken();
  }

  _loadToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _token = (prefs.getString('token')??'');
    });
    uploadDialog(Paths.recording, UPLOAD_DIALOG);
  }

  uploadDialog(filepath, url) async {

    var request = http.MultipartRequest('POST', Uri.parse(url));

    Map<String, String> headers = {
      // "Accept": "application/json",
      "AccessToken": _token,
    }; // ignore this headers if there is no authentication
    request.headers.addAll(headers);

    request.files.add(await http.MultipartFile.fromPath('file', filepath));
    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);
    Map<String,dynamic>resposne=jsonDecode(response.body);
    if (response.statusCode == 200) {
      _setResult(resposne['result']['voice'], resposne['result']['audience']);
      Navigator.pushReplacementNamed(context, "/results");
    } else {
    }
  }

  _setResult(double sp1, double sp2) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    double voice = sp1 * 100.0;
    double audience = sp2 * 100.0;
    int submitVoice = voice.round();
    int submitAudience = audience.round();
    preferences.setInt("voice", submitVoice);
    preferences.setInt("audience", submitAudience);
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
                        child: CircularProgressIndicator(),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: 250,
                      padding: EdgeInsets.symmetric(
                          vertical: 10, horizontal: 0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Text(
                            "Calculating your ",
                            textDirection: TextDirection.ltr,
                            style: GoogleFonts.roboto(textStyle: sGestureTextStyle),
                          ),
                          Text(
                            "listening performance ...",
                            textDirection: TextDirection.ltr,
                            style: GoogleFonts.roboto(textStyle: sGestureTextStyle),
                          ),
                        ]
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