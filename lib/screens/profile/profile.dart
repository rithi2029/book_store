// ignore_for_file: avoid_unnecessary_containers

import 'package:book_store/constants/global_colors.dart';
import 'package:book_store/screens/dashboard/widget/category.dart';
import 'package:book_store/screens/dashboard/widget/item_widgets.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import '../../widgets/app_bar.dart';
import '../../widgets/text_wiget.dart';

class ProfileScreen extends StatelessWidget {
  final drawer;

  const ProfileScreen({Key? key, this.drawer}) : super(key: key);

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
            child: Center(child: Text('Profile'))),
      ],
    ));
  }
}
