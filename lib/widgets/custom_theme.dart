import 'package:book_store/constants/global_colors.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../screens/wrapper/wrapper.dart';

class CustomTheme extends StatefulWidget {
  final Color themeColor;
  final int themeNumber;
  const CustomTheme(
      {Key? key, required this.themeColor, required this.themeNumber})
      : super(key: key);

  @override
  _CustomThemeState createState() => _CustomThemeState();
}

class _CustomThemeState extends State<CustomTheme> {
  int active = 0;
  @override
  selected() async {
    final prefs = await SharedPreferences.getInstance();
    final int? theme = prefs.getInt("theme");
    setState(() {
      active = theme!;
    });
  }

  void initState() {
    super.initState();
    selected();
  }

  int selecter = 0;
  @override
  Widget build(BuildContext context) {
    print("demo$active");

    return GestureDetector(
      onTap: () async {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setInt("theme", widget.themeNumber);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Wrapper()),
        );
        setState(() {
          selecter = widget.themeNumber;
        });
      },
      child: Container(
        margin: EdgeInsets.all(10),
        width: 20,
        height: 20,
        decoration: BoxDecoration(
            color: widget.themeNumber == active
                ? widget.themeColor
                : GlobalColors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(width: 5, color: widget.themeColor)),
      ),
    );
  }
}
