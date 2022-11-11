import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Color themeColor() {
  return Color.fromARGB(255, 21, 62, 150);
}

var clor = jsonEncode("Color.fromARGB(255, 21, 62, 150)");

class GlobalColors {
  colorTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final int? theme = prefs.getInt("theme");
    print("tm$theme");
    if (theme == null || theme == 0) {
      return primaryColor;
    }
    if (theme == 1) {
      return (primaryColor1);
    }
    if (theme == 2) {
      return primaryColor2;
    }
    if (theme == 3) {
      return primaryColor3;
    }
  }

  //theme1
  static const primaryColor = Color.fromARGB(255, 21, 62, 150);
  static const primaryColorLight = Color.fromARGB(255, 21, 62, 150);
  static const textColors = Color.fromARGB(255, 51, 100, 198);
  static const white = Color.fromARGB(255, 255, 255, 255);
  static const containerColors = Color.fromARGB(255, 240, 239, 239);
  static const categoryList = Colors.white;
  static const fav = Colors.red;
  static const black = Colors.black;
  static const grey = Colors.grey;
  static const success = Color.fromARGB(255, 35, 120, 37);
  static const start = Color.fromARGB(255, 253, 159, 36);
  static const loginBtn = Color.fromARGB(255, 173, 147, 138);
//theme2
  static const primaryColor1 = Color.fromARGB(255, 61, 178, 123);
  static const textColors1 = Color.fromARGB(255, 51, 100, 198);
  static const white1 = Color.fromARGB(255, 255, 255, 255);
  static const containerColors1 = Color.fromARGB(255, 240, 239, 239);
  static const categoryList1 = Colors.white;
  static const fav1 = Colors.red;
  static const black1 = Colors.black;
  static const grey1 = Colors.grey;
  static const success1 = Color.fromRGBO(255, 82, 163, 1);
  static const start1 = Color.fromARGB(255, 253, 159, 36);
  static const loginBtn1 = Color.fromARGB(255, 173, 147, 138);
//theme2
  static const primaryColor2 = Color.fromRGBO(255, 105, 180, 1);
  static const textColors2 = Color.fromARGB(255, 51, 100, 198);
  static const white2 = Color.fromARGB(255, 255, 255, 255);
  static const containerColors2 = Color.fromARGB(255, 240, 239, 239);
  static const categoryList2 = Colors.white;
  static const fav2 = Colors.red;
  static const black2 = Colors.black;
  static const grey2 = Colors.grey;
  static const success2 = Color.fromARGB(255, 35, 120, 37);
  static const start2 = Color.fromARGB(255, 253, 159, 36);
  static const loginBtn2 = Color.fromARGB(255, 173, 147, 138);
//theme3
  static const primaryColor3 = Color.fromARGB(255, 0, 8, 2);
  static const textColors3 = Color.fromARGB(255, 51, 100, 198);
  static const white3 = Color.fromARGB(255, 255, 255, 255);
  static const containerColors3 = Color.fromARGB(255, 240, 239, 239);
  static const categoryList3 = Colors.white;
  static const fav3 = Colors.red;
  static const black3 = Colors.black;
  static const grey3 = Colors.grey;
  static const success3 = Color.fromARGB(255, 35, 120, 37);
  static const start3 = Color.fromARGB(255, 253, 159, 36);
  static const loginBtn3 = Color.fromARGB(255, 173, 147, 138);
}
