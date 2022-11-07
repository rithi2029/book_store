// ignore_for_file: prefer_const_constructors

import 'package:book_store/widgets/text_wiget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/global_colors.dart';

class TextForm extends StatelessWidget {
  final String content;
  const TextForm({Key? key, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextWidget(
            textColors: GlobalColors.grey,
            fontWeight: FontWeight.normal,
            fntSize: width * 0.04,
            content: content,
          ),
          Container(
            width: width * 0.6,
            height: height * 0.055,
            padding: EdgeInsets.only(left: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              border: Border.all(
                color: GlobalColors.grey,
              ),
            ),
            child: Center(
              child: TextFormField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Enter Your $content ......",
                    hintStyle: TextStyle(
                        color: GlobalColors.grey, fontSize: width * 0.035)),
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return content;
                  }
                  return null;
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
