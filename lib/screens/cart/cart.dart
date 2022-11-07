// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'dart:convert';

import 'package:book_store/constants/global_colors.dart';
import 'package:book_store/screens/dashboard/dashboard_screen.dart';
import 'package:book_store/screens/dashboard/widget/category.dart';
import 'package:book_store/screens/dashboard/widget/item_widgets.dart';
import 'package:book_store/screens/home/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../widgets/app_bar.dart';
import '../../widgets/text_wiget.dart';
import '../checkout/checkout.dart';
import '../wrapper/wrapper.dart';

class CartScreen extends StatefulWidget {
  CartScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List _items = [];

  getData() async {
    final String response =
        await rootBundle.loadString('Assets/json/data.json');
    final data = await json.decode(response);
    setState(() {
      _items = data["category"];
    });
  }

  @override
  void initState() {
    getData();
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
                cart: true,
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
                    color: GlobalColors.primaryColor,
                  ),
                ),
                content: "Cart",
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
                for (var i = 5; i <= _items.length; i++)
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
                          child: Radio(
                            value: "",
                            groupValue: "",
                            onChanged: (index) {},
                            activeColor: GlobalColors.primaryColor,
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
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              TextWidget(
                                  textColors: GlobalColors.primaryColor,
                                  fontWeight: FontWeight.bold,
                                  fntSize: 14,
                                  content: "Product Title"),
                              TextWidget(
                                  textColors: GlobalColors.primaryColor,
                                  fontWeight: FontWeight.bold,
                                  fntSize: 15,
                                  content: "\$40"),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(CupertinoIcons.cart_badge_minus,
                                  color: GlobalColors.fav),
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
                                        color: GlobalColors.primaryColor,
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
                                      textColors: GlobalColors.primaryColor,
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
                                        color: GlobalColors.primaryColor,
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
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        height: height * 0.17,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                      color: GlobalColors.primaryColor,
                      borderRadius: BorderRadius.circular(50)),
                  child: Icon(
                    Icons.add,
                    color: GlobalColors.white,
                    size: 16,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 4.0),
                  child: TextWidget(
                      textColors: GlobalColors.primaryColor,
                      fontWeight: FontWeight.bold,
                      fntSize: 13,
                      content: "Add Coupen Code "),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWidget(
                    textColors: GlobalColors.primaryColor,
                    fontWeight: FontWeight.bold,
                    fntSize: 18,
                    content: "Total :"),
                TextWidget(
                    textColors: GlobalColors.primaryColor,
                    fontWeight: FontWeight.bold,
                    fntSize: 18,
                    content: "\$ 120"),
              ],
            ),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                  backgroundColor: GlobalColors.primaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  minimumSize: Size(width, height * 0.05)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CheckOutScreen()),
                );
              },
              icon: Icon(Icons.arrow_forward_sharp),
              label: TextWidget(
                  textColors: GlobalColors.white,
                  fontWeight: FontWeight.normal,
                  fntSize: 16,
                  content: "Proceed to Checkout"),
            )
          ],
        ),
      ),
    );
  }
}
