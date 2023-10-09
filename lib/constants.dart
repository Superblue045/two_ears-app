import 'package:flutter/material.dart';

// const kBottomContainerHeight = 80.0;
// const kActiveCardColour = Color(0xFF1D1E33);
// const kInactiveCardColour = Color(0xFF111328);
// const kBottomContainerColour = Color(0xFFEB1555);

const hTitleTextStyle = TextStyle(
  fontSize: 64.0,
  color: Colors.white,
  letterSpacing: 1
);

const hCompanyTextStyle = TextStyle(
  color: Colors.white54,
  letterSpacing: 0.6,
  fontSize: 11
);

const hGestureTextStyle = TextStyle(
  color: Colors.white70,
  fontSize: 15,
  decoration: TextDecoration.underline,
  letterSpacing: 0.5
);

const sGestureTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 16,
  letterSpacing: 1
);

const scrTitleTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 50.0,
  letterSpacing: 1
);

const wTitleTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 36.0,
  // fontWeight: FontWeight.bold,
  letterSpacing: 1
);

const wrDescriptionTextStyle = TextStyle(
  fontSize: 20.0,
);

const rDescriptionTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 20.0,
  letterSpacing: 1
);

const rTitleTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 42.0,
  letterSpacing: 1
);

class Paths {
  static String recoFolder = '/storage/emulated/0/2Ears';
  static String recognise = '/storage/emulated/0/2Ears/sample.mp3';
  static String recording = '/storage/emulated/0/2Ears/script.mp3';
}