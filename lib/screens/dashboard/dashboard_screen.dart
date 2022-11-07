// ignore_for_file: avoid_unnecessary_containers

import 'package:book_store/constants/global_colors.dart';
import 'package:book_store/screens/dashboard/widget/category.dart';
import 'package:book_store/screens/dashboard/widget/item_widgets.dart';
import 'package:flutter/material.dart';

import '../../widgets/app_bar.dart';
import '../../widgets/text_wiget.dart';

class DashboardScreen extends StatelessWidget {
  final drawer;
  DashboardScreen({Key? key, required this.drawer}) : super(key: key);

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
              icon: Icon(
                Icons.sort,
                size: height * 0.030,
                color: GlobalColors.primaryColor,
              ),
              content: "Book Store",
              event: drawer),
        ),
        Container(
          width: width,
          height: height * 0.08,
          decoration: const BoxDecoration(
            color: GlobalColors.primaryColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
          child: LayoutBuilder(builder: (context, constraints) {
            return Column(children: [
              Container(
                width: width,
                height: constraints.maxHeight * 0.6,
                margin: EdgeInsets.only(
                    top: width * 0.03, left: width * 0.03, right: width * 0.03),
                decoration: BoxDecoration(
                  color: GlobalColors.white,
                  border: Border.all(
                    color: GlobalColors.primaryColor,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Container(
                      height: constraints.maxHeight * 0.6,
                      width: width * 0.75,
                      margin: EdgeInsets.only(left: 25),
                      child: TextFormField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Search here ...",
                            hintStyle: TextStyle(
                                fontSize: constraints.maxWidth * 0.04)),
                      ),
                    ),
                    Spacer(),
                    Container(
                      margin: const EdgeInsets.only(right: 10),
                      child: InkWell(
                        splashColor: GlobalColors.primaryColor,
                        mouseCursor: MouseCursor.uncontrolled,
                        onTap: () {},
                        child: const Icon(
                          Icons.search_sharp,
                          color: GlobalColors.primaryColor,
                          size: 25,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ]);
          }),
        ),
        Container(
          width: width,
          height: height * 0.8,
          decoration: const BoxDecoration(
            color: GlobalColors.containerColors,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  width: width,
                  height: height * 0.06,
                  decoration: BoxDecoration(),
                  child: TextWidget(
                    textColors: GlobalColors.primaryColor,
                    fontWeight: FontWeight.bold,
                    fntSize: height * 0.020,
                    content: "Categories",
                  ),
                ),
                Container(
                  width: width,
                  height: height * 0.15,
                  child: CategoryScreen(),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  width: width,
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  height: height * 0.06,
                  decoration: BoxDecoration(),
                  child: TextWidget(
                    textColors: GlobalColors.primaryColor,
                    fontWeight: FontWeight.bold,
                    fntSize: height * 0.020,
                    content: "Best Seller",
                  ),
                ),
                Container(
                  height: height * 0.35,
                  width: width,
                  child: ItemWidget(
                    content: "best_seller",
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  width: width,
                  margin: EdgeInsets.symmetric(
                      horizontal: width * 0.015, vertical: height * 0.005),
                  height: height * 0.06,
                  decoration: BoxDecoration(),
                  child: TextWidget(
                    textColors: GlobalColors.primaryColor,
                    fontWeight: FontWeight.bold,
                    fntSize: height * 0.020,
                    content: "New Arrivals",
                  ),
                ),
                Container(
                  height: height * 0.35,
                  width: width,
                  child: ItemWidget(
                    content: "new_arrivals",
                  ),
                ),
                Container(
                  height: height * 0.1,
                  width: width,
                ),
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
