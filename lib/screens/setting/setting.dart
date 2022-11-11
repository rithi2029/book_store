// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:book_store/constants/global_colors.dart';
import 'package:book_store/screens/dashboard/widget/category.dart';
import 'package:book_store/screens/dashboard/widget/item_widgets.dart';
import 'package:book_store/widgets/custom_theme.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import '../../widgets/app_bar.dart';
import '../../widgets/text_wiget.dart';

class SettingScreen extends StatefulWidget {
  final drawer;

  const SettingScreen({Key? key, this.drawer}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
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
              icon: Icon(
                Icons.sort,
                size: height * 0.030,
                color: themeColor,
              ),
              content: "Setting",
              event: widget.drawer),
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
                    color: themeColor, borderRadius: BorderRadius.circular(16)),
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
                  child: Column(children: [
                    ExpansionTile(
                      leading: Icon(
                        Icons.language,
                        color: themeColor,
                      ),
                      title: TextWidget(
                          textColors: themeColor,
                          fontWeight: FontWeight.normal,
                          fntSize: 14,
                          content: "Change Language"),
                      children: [],
                    ),
                    ExpansionTile(
                      leading: Icon(
                        Icons.brush,
                        color: themeColor,
                      ),
                      title: TextWidget(
                          textColors: themeColor,
                          fontWeight: FontWeight.normal,
                          fntSize: 14,
                          content: "Change Theme"),
                      children: [
                        Row(
                          children: const [
                            CustomTheme(
                                themeColor: GlobalColors.primaryColor,
                                themeNumber: 0),
                            CustomTheme(
                                themeColor: GlobalColors.primaryColor1,
                                themeNumber: 1),
                            CustomTheme(
                                themeColor: GlobalColors.primaryColor2,
                                themeNumber: 2),
                            CustomTheme(
                                themeColor: GlobalColors.primaryColor3,
                                themeNumber: 3)
                          ],
                        )
                      ],
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
