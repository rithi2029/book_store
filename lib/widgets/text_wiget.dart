import 'package:flutter/cupertino.dart';

import '../constants/global_colors.dart';

class TextWidget extends StatelessWidget {
  final Color textColors;
  final FontWeight fontWeight;
  final double fntSize;
  final String content;
  const TextWidget(
      {Key? key,
      required this.textColors,
      required this.fontWeight,
      required this.fntSize,
      required this.content})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      style: TextStyle(
          color: textColors, fontSize: fntSize, fontWeight: fontWeight),
    );
  }
}
