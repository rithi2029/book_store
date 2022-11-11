// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:book_store/screens/cart/cart.dart';
import 'package:book_store/widgets/text_wiget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants/global_colors.dart';
import '../../widgets/app_bar.dart';
import '../../widgets/textform.dart';
import '../order_conformation/order_conformationScreen.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({Key? key}) : super(key: key);

  @override
  _CheckOutScreenState createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
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
              height: height * 0.07,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CartScreen()),
                      );
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: themeColor,
                    ),
                  ),
                  Container(
                    height: height * 0.06,
                    width: width * 0.5,
                    decoration: BoxDecoration(
                        color: themeColor,
                        borderRadius: BorderRadius.circular(10)),
                    padding: EdgeInsets.all(4),
                    child: Center(
                      child: TextWidget(
                          textColors: GlobalColors.white,
                          fontWeight: FontWeight.bold,
                          fntSize: width * 0.05,
                          content: "CheckOut"),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.only(bottom: 10),
              height: height * 0.765,
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Container(
                      width: width,
                      child: ExpansionTile(
                        initiallyExpanded: true,
                        title: TextWidget(
                            textColors: themeColor,
                            fontWeight: FontWeight.bold,
                            fntSize: width * 0.04,
                            content: "CUSTOMER INFORMATIONS"),
                        children: [
                          TextForm(
                            content: "Name",
                          ),
                          TextForm(
                            content: "Mobile",
                          ),
                          TextForm(
                            content: "Email",
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Container(
                      width: width,
                      child: ExpansionTile(
                        title: TextWidget(
                            textColors: themeColor,
                            fontWeight: FontWeight.bold,
                            fntSize: width * 0.04,
                            content: "Delivery INFORMATIONS"),
                        children: const [
                          TextForm(
                            content: "Country",
                          ),
                          TextForm(
                            content: "State",
                          ),
                          TextForm(
                            content: "City",
                          ),
                          TextForm(
                            content: "Zipcode",
                          ),
                          TextForm(
                            content: "Address",
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Container(
                      width: width,
                      child: ExpansionTile(
                        title: TextWidget(
                            textColors: themeColor,
                            fontWeight: FontWeight.bold,
                            fntSize: width * 0.04,
                            content: "SELECT PAYMENT METHOD"),
                        children: [
                          Container(
                            width: width,
                            child: Row(
                              children: [
                                Radio(
                                  value: "",
                                  groupValue: "",
                                  onChanged: (index) {},
                                  activeColor: themeColor,
                                ),
                                TextWidget(
                                    textColors: themeColor,
                                    fontWeight: FontWeight.normal,
                                    fntSize: width * 0.036,
                                    content: "Cash On Delivery")
                              ],
                            ),
                          ),
                          Container(
                            width: width,
                            child: Row(
                              children: [
                                Radio(
                                  toggleable: true,
                                  value: "",
                                  groupValue: "",
                                  onChanged: (index) {},
                                  activeColor: themeColor,
                                ),
                                TextWidget(
                                    textColors: themeColor,
                                    fontWeight: FontWeight.normal,
                                    fntSize: width * 0.036,
                                    content: "Direct Debit")
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: TextWidget(
                        textColors: themeColor,
                        fontWeight: FontWeight.w600,
                        fntSize: width * 0.040,
                        content: "ORDER SUMMARY"),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 30.0),
                    width: width,
                    height: height * 0.07,
                    decoration: BoxDecoration(
                        border: Border(top: BorderSide(color: themeColor))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TextWidget(
                                textColors: GlobalColors.textColors,
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
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TextWidget(
                                textColors: GlobalColors.textColors,
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
                    margin: EdgeInsets.symmetric(horizontal: 30),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: themeColor)),
                    height: height * 0.05,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextWidget(
                            textColors: themeColor,
                            fontWeight: FontWeight.w600,
                            fntSize: width * 0.035,
                            content: "Total "),
                        TextWidget(
                            textColors: themeColor,
                            fontWeight: FontWeight.w600,
                            fntSize: width * 0.035,
                            content: "\$10.97 ")
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: Container(
          height: height * 0.1,
          color: themeColor,
          child: Center(
              child: Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: GlobalColors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  minimumSize: Size(width * 0.5, height * 0.05)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OrdersScreen()),
                );
              },
              child: TextWidget(
                  textColors: themeColor,
                  fontWeight: FontWeight.bold,
                  fntSize: width * 0.045,
                  content: "ORDER NOW"),
            ),
          )),
        ));
  }
}
