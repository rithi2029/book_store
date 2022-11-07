import 'package:book_store/screens/home/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../drawer/drawer.dart';

class Wrapper extends StatefulWidget {
  final int? index;
  const Wrapper({Key? key, this.index}) : super(key: key);

  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  double transX = 0.0;
  double transY = 0.0;
  double transZ = 0.0;
  double scale = 1.0;
  bool drawerClose = true;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    drawer() {
      if (drawerClose) {
        setState(() {
          transX = size.width - size.width * 0.4;
          transY = size.height - size.height * 0.9;
          scale = 0.8;
          drawerClose = !drawerClose;
        });
      } else {
        setState(() {
          transX = 0.0;
          transY = 0.0;
          scale = 1.0;
          drawerClose = !drawerClose;
        });
      }
    }

    return Scaffold(
      body: Stack(
        children: [
          DrawerScreen(),
          AnimatedContainer(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
            duration: Duration(milliseconds: 200),
            transform: Matrix4.translationValues(transX, transY, transZ)
              ..scale(scale),
            child: HomeScreen(
              drawer: drawer,
              index: widget.index,
            ),
          )
        ],
      ),
    );
  }
}
