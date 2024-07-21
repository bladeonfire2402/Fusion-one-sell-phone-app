import 'package:flutter/material.dart';

class AppWidget {
  static TextStyle boldTextFeildStyle() {
    return TextStyle(
        color: Colors.black, fontSize: 27, fontWeight: FontWeight.bold,fontFamily: "Montserrat");
  }
  static TextStyle SuperBigWhiteboldTextFeildStyle() {
    return TextStyle(
        color: const Color.fromARGB(255, 255, 255, 255), fontSize: 30, fontWeight: FontWeight.bold,fontFamily: "Montserrat");
  }

  static TextStyle lightTextFeildStyle() {
    return TextStyle(
        color: const Color.fromARGB(137, 255, 254, 254), fontSize: 18, fontWeight: FontWeight.w500,fontFamily: "Montserrat");
  }
  static TextStyle BoldlightTextFeildStyle() {
    return TextStyle(
        color: const Color.fromARGB(137, 255, 255, 255), fontSize: 23, fontWeight: FontWeight.bold,fontFamily: "Montserrat");
  }
  static TextStyle DarklightTextFeildStyle() {
    return TextStyle(
        color: Color.fromARGB(136, 0, 0, 0), fontSize: 23, fontWeight: FontWeight.bold,fontFamily: "Montserrat");
  }
  static TextStyle BlackStyle() {
    return TextStyle(
        color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold,fontFamily: "Montserrat");
  }
  static TextStyle OrangelightTextFeildStyle() {
    return TextStyle(
        color: Color.fromARGB(135, 237, 82, 5), fontSize: 18, fontWeight: FontWeight.bold,fontFamily: "Montserrat");
  }
  static TextStyle avgOrangelightTextFeildStyle() {
    return TextStyle(
        color: Color.fromARGB(137, 241, 106, 2), fontSize: 23, fontWeight: FontWeight.bold,fontFamily: "Montserrat");
  }
  static TextStyle smlightTextFeildStyle() {
    return TextStyle(
        color: Colors.black54, fontSize: 14, fontWeight: FontWeight.bold);
  }
}
