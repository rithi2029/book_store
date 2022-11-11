// ignore_for_file: avoid_unnecessary_containers

import 'dart:convert';

import 'package:book_store/constants/global_colors.dart';
import 'package:book_store/screens/dashboard/widget/category.dart';
import 'package:book_store/screens/dashboard/widget/item_widgets.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../widgets/app_bar.dart';
import '../../widgets/text_wiget.dart';
import '../wrapper/wrapper.dart';

class WishListScreen extends StatefulWidget {
  final drawer;

  const WishListScreen({Key? key, this.drawer}) : super(key: key);

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  List _items = [];

  getData() async {
    final String response =
        await rootBundle.loadString('Assets/json/data.json');
    final data = await json.decode(response);
    setState(() {
      _items = data["category"];
    });
  }

  Color themeColor = Colors.white;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();

    GlobalColors().colorTheme().then((value) {
      setState(() {
        themeColor = value;
      });
      // do functions requiring value parameter
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: ListView(
        physics: NeverScrollableScrollPhysics(),
        children: [
          Container(
            height: height * 0.05,
            width: double.infinity,
            child: HomeAppBar(
                cart: false,
                icon: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Wrapper()),
                    );
                  },
                  child: Icon(
                    Icons.arrow_back,
                    size: height * 0.030,
                    color: themeColor,
                  ),
                ),
                content: "Wish List",
                event: () {}),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
                color: GlobalColors.containerColors,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
            height: height * 0.75,
            child: ListView(
              children: [
                for (var i = 2; i <= 4; i++)
                  Container(
                    height: height * 0.13,
                    margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: GlobalColors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      children: [
                        Container(
                          width: width * 0.1,
                          child: InkWell(
                            child: Icon(CupertinoIcons.heart_fill,
                                color: GlobalColors.fav),
                          ),
                        ),
                        Container(
                          width: width * 0.2,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: Image.asset(
                              'Assets/pics/c${i}.jpeg',
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Container(
                          width: width * 0.3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextWidget(
                                  textColors: themeColor,
                                  fontWeight: FontWeight.bold,
                                  fntSize: 14,
                                  content: "Product Title"),
                              TextWidget(
                                  textColors: themeColor,
                                  fontWeight: FontWeight.bold,
                                  fntSize: 15,
                                  content: "\$40"),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        color: GlobalColors.white,
                                        borderRadius: BorderRadius.circular(20),
                                        boxShadow: [
                                          BoxShadow(
                                              color:
                                                  GlobalColors.containerColors,
                                              spreadRadius: 3,
                                              blurRadius: 5,
                                              offset: Offset(0, 3))
                                        ]),
                                    child: InkWell(
                                      mouseCursor: MouseCursor.uncontrolled,
                                      child: Icon(
                                        CupertinoIcons.minus_circle,
                                        size: 16,
                                        color: themeColor,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    child: TextWidget(
                                      fontWeight: FontWeight.bold,
                                      fntSize: 15,
                                      content: "01",
                                      textColors: themeColor,
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        color: GlobalColors.white,
                                        borderRadius: BorderRadius.circular(20),
                                        boxShadow: [
                                          BoxShadow(
                                              color:
                                                  GlobalColors.containerColors,
                                              spreadRadius: 3,
                                              blurRadius: 5,
                                              offset: Offset(0, 3))
                                        ]),
                                    child: InkWell(
                                      mouseCursor: MouseCursor.uncontrolled,
                                      child: Icon(
                                        CupertinoIcons.add_circled,
                                        size: 16,
                                        color: themeColor,
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                // Image.asset(
                //   'Assets/pics/c${i}.jpeg',
                //   fit: BoxFit.fill,
                // ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
