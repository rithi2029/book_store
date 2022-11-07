import 'dart:convert';

import 'package:book_store/constants/global_colors.dart';
import 'package:book_store/widgets/text_wiget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
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
    return LayoutBuilder(
      builder: ((context, constraints) {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              for (var i = 1; i <= 8; i++)
                Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: constraints.maxWidth * 0.008),
                  padding: EdgeInsets.all(constraints.maxHeight * 0.07),
                  height: constraints.maxHeight * 1,
                  width: constraints.maxWidth * 0.235,
                  decoration: BoxDecoration(
                    color: GlobalColors.white,
                    borderRadius:
                        BorderRadius.circular(constraints.maxWidth * 0.03),
                  ),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: constraints.maxHeight * 0.7,
                          width: double.infinity,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(
                                constraints.maxWidth * 0.01),
                            child: Image.asset(
                              'Assets/pics/c${i}.jpeg',
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.bottomCenter,
                            child: TextWidget(
                              textColors: GlobalColors.primaryColor,
                              fontWeight: FontWeight.bold,
                              fntSize: constraints.maxHeight * 0.1,
                              content: _items[i - 1]["name"],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
            ],
          ),
        );
      }),
    );
  }
}
