// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:book_store/constants/global_colors.dart';
import 'package:book_store/screens/dashboard/widget/category.dart';
import 'package:book_store/screens/dashboard/widget/item_widgets.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import '../../widgets/app_bar.dart';
import '../../widgets/text_wiget.dart';

class SettingScreen extends StatelessWidget {
  final drawer;

  const SettingScreen({Key? key, this.drawer}) : super(key: key);

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
              content: "Setting",
              event: drawer),
        ),
        Container(
          width: width,
          height: height * 0.8,
          decoration: const BoxDecoration(
            color: GlobalColors.containerColors,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: LayoutBuilder(builder: (context, constraints) {
            return Column(children: [
              Container(
                width: width,
                height: constraints.maxHeight * 0.1,
                margin: EdgeInsets.all(6),
                decoration: BoxDecoration(
                    color: GlobalColors.primaryColor,
                    borderRadius: BorderRadius.circular(16)),
                child: Center(
                  child: ListTile(
                    leading: CircleAvatar(),
                    title: TextWidget(
                        textColors: GlobalColors.white,
                        fontWeight: FontWeight.bold,
                        fntSize: 16,
                        content: "Rithi Mahesh"),
                    trailing: InkWell(
                      child: Icon(
                        Icons.edit,
                        color: GlobalColors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 6),
                child: Card(
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(children: const [
                    ExpansionTile(
                      collapsedIconColor: GlobalColors.primaryColor,
                      leading: Icon(
                        Icons.lock,
                        color: GlobalColors.primaryColor,
                      ),
                      title: TextWidget(
                          textColors: GlobalColors.primaryColor,
                          fontWeight: FontWeight.normal,
                          fntSize: 14,
                          content: "Change Password"),
                      children: [],
                    ),
                    ExpansionTile(
                      collapsedIconColor: GlobalColors.primaryColor,
                      leading: Icon(
                        Icons.language,
                        color: GlobalColors.primaryColor,
                      ),
                      title: TextWidget(
                          textColors: GlobalColors.primaryColor,
                          fontWeight: FontWeight.normal,
                          fntSize: 14,
                          content: "Change Language"),
                      children: [],
                    ),
                    ExpansionTile(
                      collapsedIconColor: GlobalColors.primaryColor,
                      leading: Icon(
                        Icons.brush,
                        color: GlobalColors.primaryColor,
                      ),
                      title: TextWidget(
                          textColors: GlobalColors.primaryColor,
                          fontWeight: FontWeight.normal,
                          fntSize: 14,
                          content: "Change Theme"),
                      children: [],
                    ),
                  ]),
                ),
              )
            ]);
          }),
        ),
      ],
    ));
  }
}
