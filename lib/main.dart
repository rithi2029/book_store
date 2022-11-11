import 'package:book_store/screens/athendication/dashboard.dart';
import 'package:book_store/screens/dashboard/dashboard_screen.dart';
import 'package:book_store/screens/home/home_screen.dart';
import 'package:book_store/screens/wrapper/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Book Store',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        "/": (context) => AuthendicationScreen(),
      },
      // home: ZoomDrawer(
      // style: DrawerStyle.style4,
      // mainScreen: HomeScreen(),
      // menuScreen: const Demo(),
      // ),
    );
  }
}
