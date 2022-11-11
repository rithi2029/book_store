// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:book_store/screens/cart/cart.dart';
import 'package:book_store/screens/wrapper/wrapper.dart';
import 'package:book_store/widgets/text_wiget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants/global_colors.dart';
import '../../widgets/app_bar.dart';
import '../../widgets/textform.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  _OrdersScreenState createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
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
            padding: EdgeInsets.symmetric(vertical: 20),
            height: height * 0.26,
            color: themeColor,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(children: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Wrapper()),
                      );
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: GlobalColors.white,
                    ),
                  ),
                  Container(
                    height: height * 0.06,
                    width: width * 0.7,
                    margin: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                        color: themeColor,
                        borderRadius: BorderRadius.circular(10)),
                    padding: EdgeInsets.all(4),
                    child: Center(
                      child: TextWidget(
                          textColors: GlobalColors.white,
                          fontWeight: FontWeight.bold,
                          fntSize: width * 0.05,
                          content: "Order Confirmation"),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_back,
                      color: themeColor,
                    ),
                  ),
                ]),
                Row(
                  children: [],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextWidget(
                        textColors: GlobalColors.white,
                        fontWeight: FontWeight.bold,
                        fntSize: width * 0.04,
                        content: "Your order is completed")
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: TextWidget(
              textColors: GlobalColors.textColors,
              fontWeight: FontWeight.bold,
              fntSize: width * 0.04,
              content: "Hi Rithi,",
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: TextWidget(
              textColors: GlobalColors.grey,
              fontWeight: FontWeight.w500,
              fntSize: width * 0.037,
              content: "Thank you for purchasing on Book Store .",
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: TextWidget(
                textColors: GlobalColors.textColors,
                fontWeight: FontWeight.w600,
                fntSize: width * 0.040,
                content: "ORDER CODE : #248"),
          ),
          SizedBox(
            height: 4,
          ),
          Container(
            width: width,
            child: ExpansionTile(
              initiallyExpanded: true,
              iconColor: GlobalColors.grey,
              collapsedIconColor: GlobalColors.grey,
              title: TextWidget(
                  textColors: GlobalColors.grey,
                  fontWeight: FontWeight.w600,
                  fntSize: width * 0.035,
                  content: "ORDER DETAILS"),
              children: [
                Container(
                  height: height * 0.35,
                  child: ListView(
                    children: [
                      for (var i = 1; i <= 5; i++)
                        Container(
                          width: width,
                          height: height * 0.08,
                          margin: EdgeInsets.symmetric(vertical: 5),
                          child: Row(
                            children: [
                              Container(
                                width: width * 0.1,
                                child: Radio(
                                  value: "",
                                  groupValue: "",
                                  onChanged: (index) {},
                                  activeColor: GlobalColors.grey,
                                ),
                              ),
                              Container(
                                width: width * 0.14,
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    TextWidget(
                                        textColors: themeColor,
                                        fontWeight: FontWeight.normal,
                                        fntSize: 14,
                                        content: "Product Title"),
                                    TextWidget(
                                      textColors: themeColor,
                                      fontWeight: FontWeight.normal,
                                      fntSize: 13,
                                      content: "Qty : x2",
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: width * 0.3,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    TextWidget(
                                        textColors: themeColor,
                                        fontWeight: FontWeight.normal,
                                        fntSize: 14,
                                        content: "\$24.00"),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            width: width,
            height: height * 0.1,
            decoration: BoxDecoration(
                border: Border(top: BorderSide(color: GlobalColors.grey))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextWidget(
                        textColors: GlobalColors.grey,
                        fontWeight: FontWeight.w600,
                        fntSize: width * 0.035,
                        content: "SUBTOTAL "),
                    TextWidget(
                        textColors: GlobalColors.textColors,
                        fontWeight: FontWeight.w600,
                        fntSize: width * 0.035,
                        content: "\$8.97 ")
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextWidget(
                        textColors: GlobalColors.grey,
                        fontWeight: FontWeight.w600,
                        fntSize: width * 0.035,
                        content: "DELIVERY FEE "),
                    TextWidget(
                        textColors: GlobalColors.textColors,
                        fontWeight: FontWeight.w600,
                        fntSize: width * 0.035,
                        content: "\$2.00 ")
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
                color: themeColor,
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: GlobalColors.grey)),
            height: height * 0.05,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextWidget(
                    textColors: GlobalColors.white,
                    fontWeight: FontWeight.bold,
                    fntSize: width * 0.035,
                    content: "Total "),
                TextWidget(
                    textColors: GlobalColors.white,
                    fontWeight: FontWeight.bold,
                    fntSize: width * 0.035,
                    content: "\$10.97 ")
              ],
            ),
          ),
        ],
      ),
    );
  }
}
