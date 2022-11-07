import 'dart:convert';

import 'package:book_store/constants/global_colors.dart';
import 'package:book_store/widgets/text_wiget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../product/product_screen.dart';

class ItemWidget extends StatefulWidget {
  final String content;
  const ItemWidget({Key? key, required this.content}) : super(key: key);

  @override
  State<ItemWidget> createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<ItemWidget> {
  List _items = [];
  List _cat = [];

  getData() async {
    final String response =
        await rootBundle.loadString('Assets/json/data.json');
    final data = await json.decode(response);
    setState(() {
      _items = data[widget.content];
      _cat = data["category"];
    });

    print("dvibevieub" + _items.toString());
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
              for (var i = 0; i < 4; i++)
                Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: constraints.maxWidth * 0.017),
                  height: constraints.maxHeight * 1,
                  width: constraints.maxWidth * 0.465,
                  decoration: BoxDecoration(
                    color: GlobalColors.white,
                    borderRadius:
                        BorderRadius.circular(constraints.maxWidth * 0.02),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProductScreen()),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(2),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: constraints.maxHeight * 0.1,
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(horizontal: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: GlobalColors.primaryColor),
                                  child: TextWidget(
                                    textColors: GlobalColors.white,
                                    fontWeight: FontWeight.bold,
                                    fntSize: constraints.maxHeight * 0.035,
                                    content: "-50%",
                                  ),
                                ),
                                Icon(Icons.favorite_border,
                                    color: GlobalColors.fav)
                              ],
                            ),
                          ),
                          Container(
                            height: constraints.maxHeight * 0.5,
                            margin: EdgeInsets.symmetric(horizontal: 2),
                            width: constraints.maxWidth * 0.25,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(
                                  constraints.maxWidth * 0.01),
                              child: Image.asset(
                                'Assets/pics/${_items[i]["id"]}.jpeg',
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: constraints.maxHeight * 0.1,
                                alignment: Alignment.centerLeft,
                                child: TextWidget(
                                  textColors: GlobalColors.primaryColor,
                                  fontWeight: FontWeight.bold,
                                  fntSize: constraints.maxHeight * 0.035,
                                  content:
                                      " Category : ${_cat[_items[i]["category"]]["name"]}",
                                ),
                              ),
                              Row(
                                children: [
                                  for (var i = 0; i < 5; i++)
                                    InkWell(
                                      onTap: () {},
                                      child: Icon(Icons.star_border,
                                          size: constraints.maxWidth * 0.025,
                                          color: GlobalColors.start),
                                    )
                                ],
                              )
                            ],
                          ),
                          Container(
                            height: constraints.maxHeight * 0.18,
                            width: double.infinity,
                            margin: EdgeInsets.symmetric(
                                horizontal: constraints.maxWidth * 0.01),
                            child: TextWidget(
                              textColors: GlobalColors.primaryColor,
                              fontWeight: FontWeight.bold,
                              fntSize: constraints.maxHeight * 0.035,
                              content: _items[i]["name"],
                            ),
                          ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: constraints.maxWidth * 0.02),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(1),
                                        color: GlobalColors.containerColors),
                                    child: TextWidget(
                                      textColors: GlobalColors.success,
                                      fontWeight: FontWeight.bold,
                                      fntSize: constraints.maxHeight * 0.035,
                                      content: "${_items[i]["price"]} Rs",
                                    ),
                                  ),
                                  Icon(Icons.shopping_cart_checkout_rounded,
                                      color: GlobalColors.primaryColor)
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
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
