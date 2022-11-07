// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:book_store/constants/global_colors.dart';
import 'package:book_store/screens/home/home_screen.dart';
import 'package:book_store/screens/wrapper/wrapper.dart';
import 'package:flutter/material.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: BackdropFilter(
        filter: ImageFilter.blur(
            sigmaX: 1.0, sigmaY: 1.0, tileMode: TileMode.mirror),
        child: Container(
            width: width,
            height: height,
            color: Color.fromARGB(134, 21, 62, 150),
            padding: EdgeInsets.only(top: height * 0.2, left: width * 0.1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ListTile(
                  leading: const Icon(
                    Icons.home,
                    color: GlobalColors.white,
                  ),
                  tileColor: GlobalColors.primaryColor,
                  textColor: GlobalColors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  horizontalTitleGap: 10,
                  title: Text("Home"),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Wrapper(
                                index: 0,
                              )),
                    );
                  },
                ),
                SizedBox(
                  height: height * 0.015,
                ),
                SizedBox(
                  height: height * 0.015,
                ),
                ListTile(
                  leading: const Icon(
                    Icons.person,
                    color: GlobalColors.white,
                  ),
                  tileColor: GlobalColors.primaryColor,
                  textColor: GlobalColors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  horizontalTitleGap: 10,
                  title: Text("Profile"),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Wrapper(
                                index: 1,
                              )),
                    );
                  },
                ),
                SizedBox(
                  height: height * 0.015,
                ),
                ListTile(
                  leading: const Icon(
                    Icons.settings,
                    color: GlobalColors.white,
                  ),
                  tileColor: GlobalColors.primaryColor,
                  textColor: GlobalColors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  horizontalTitleGap: 10,
                  title: Text("Setting"),
                ),
                SizedBox(
                  height: height * 0.3,
                ),
                ListTile(
                  leading: const Icon(
                    Icons.person,
                    color: GlobalColors.white,
                  ),
                  tileColor: GlobalColors.primaryColor,
                  textColor: GlobalColors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  horizontalTitleGap: 10,
                  title: Text("Log Out"),
                ),
              ],
            )),
      ),
    );
  }
}
