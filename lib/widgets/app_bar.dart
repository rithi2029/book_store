import 'package:badges/badges.dart';
import 'package:book_store/constants/global_colors.dart';
import 'package:book_store/widgets/text_wiget.dart';
import 'package:flutter/material.dart';

import '../screens/cart/cart.dart';

enum Menu { itemOne, itemTwo, itemThree, itemFour }

class HomeAppBar extends StatefulWidget {
  final event;
  final Widget icon;
  final bool cart;
  final String content;
  const HomeAppBar(
      {Key? key,
      required this.icon,
      required this.content,
      this.event,
      required this.cart})
      : super(key: key);

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  String _selectedMenu = '';

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return Column(
        children: [
          Padding(
            padding: EdgeInsets.all(constraints.maxHeight * 0.2),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              height: constraints.maxHeight * 0.6,
              child: Row(
                children: [
                  InkWell(
                      onTap: () {
                        widget.event();
                      },
                      child: widget.icon),
                  Padding(
                    padding: EdgeInsets.only(left: constraints.maxWidth * 0.09),
                    child: TextWidget(
                      textColors: GlobalColors.primaryColor,
                      fontWeight: FontWeight.bold,
                      fntSize: constraints.maxWidth * 0.05,
                      content: widget.content,
                    ),
                  ),
                  const Spacer(),
                  widget.cart
                      ? PopupMenuButton(
                          // Callback that sets the selected popup menu item.
                          onSelected: (item) {
                            print("iamselected $item");
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Icon(
                            Icons.more_vert_outlined,
                            color: GlobalColors.primaryColor,
                          ),
                          itemBuilder: (BuildContext context) =>
                              <PopupMenuEntry>[
                                const PopupMenuItem(
                                  child: Text('Clear Cart'),
                                ),
                              ])
                      : Badge(
                          badgeColor: Colors.red,
                          padding: EdgeInsets.all(3),
                          badgeContent: TextWidget(
                            textColors: GlobalColors.white,
                            fontWeight: FontWeight.bold,
                            fntSize: constraints.maxWidth * 0.03,
                            content: "3",
                          ),
                          child: InkWell(
                            autofocus: true,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CartScreen()),
                              );
                            },
                            child: const Icon(
                              Icons.shopping_bag_outlined,
                              color: GlobalColors.primaryColor,
                            ),
                          ),
                        )
                ],
              ),
            ),
          ),
        ],
      );
    });
  }
}
