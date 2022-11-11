// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:book_store/constants/global_colors.dart';
import 'package:book_store/screens/dashboard/dashboard_screen.dart';
import 'package:book_store/screens/dashboard/widget/category.dart';
import 'package:book_store/screens/dashboard/widget/item_widgets.dart';
import 'package:book_store/screens/home/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../widgets/app_bar.dart';
import '../../widgets/text_wiget.dart';
import '../wrapper/wrapper.dart';

class ProductScreen extends StatefulWidget {
  ProductScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  Color themeColor = Colors.white;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

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
                content: "Product",
                event: () {}),
          ),
          Container(
            height: height * 0.75,
            child: ListView(
              children: [
                Container(
                  padding: EdgeInsets.all(height * 0.03),
                  decoration: BoxDecoration(
                      color: GlobalColors.containerColors,
                      borderRadius:
                          BorderRadius.only(bottomRight: Radius.circular(150))),
                  width: width,
                  height: height * 0.4,
                  child: Image.asset(
                    "Assets/pics/c1.jpeg",
                    fit: BoxFit.contain,
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.only(left: width * 0.03, top: 20, bottom: 10),
                  alignment: Alignment.centerLeft,
                  width: width,
                  height: height * 0.05,
                  child: TextWidget(
                    content: "The Lord Of The Rings",
                    textColors: themeColor,
                    fontWeight: FontWeight.bold,
                    fntSize: 24,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RatingBar.builder(
                          initialRating: 4,
                          minRating: 1,
                          direction: Axis.horizontal,
                          itemCount: 5,
                          itemSize: 22,
                          onRatingUpdate: (index) {},
                          itemBuilder: (context, _) {
                            return Padding(
                              padding: EdgeInsets.only(left: width * 0.03),
                              child: Icon(
                                Icons.favorite,
                                color: GlobalColors.fav,
                              ),
                            );
                          },
                        ),
                        TextWidget(
                            textColors: themeColor,
                            fontWeight: FontWeight.bold,
                            fntSize: 18,
                            content: "\$120"),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: TextWidget(
                      content:
                          "This is more detailed description of the product you can write large description, this is lengthy description",
                      fntSize: 16,
                      fontWeight: FontWeight.w400,
                      textColors: themeColor,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    children: [
                      TextWidget(
                          textColors: themeColor,
                          fontWeight: FontWeight.bold,
                          fntSize: 17,
                          content: "Category :"),
                      Container(
                        margin: EdgeInsets.only(left: 5),
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: GlobalColors.white,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(
                                  color: GlobalColors.containerColors,
                                  spreadRadius: 3,
                                  blurRadius: 5,
                                  offset: Offset(0, 3))
                            ]),
                        child: TextWidget(
                            textColors: themeColor,
                            fontWeight: FontWeight.normal,
                            fntSize: 16,
                            content: "Fantasy"),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
        color: GlobalColors.containerColors,
        padding: EdgeInsets.symmetric(horizontal: 20),
        height: height * 0.1,
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: GlobalColors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          color: GlobalColors.containerColors,
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
                margin: EdgeInsets.symmetric(horizontal: 10),
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
                          color: GlobalColors.containerColors,
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
          ),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(backgroundColor: themeColor),
            onPressed: () {},
            icon: Icon(CupertinoIcons.cart_badge_plus),
            label: TextWidget(
                textColors: GlobalColors.white,
                fontWeight: FontWeight.normal,
                fntSize: 16,
                content: "Add to Cart"),
          )
        ]),
      ),
    );
  }
}
