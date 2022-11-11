// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:flutter/material.dart';

import '../../../constants/global_colors.dart';

class CustomInputField extends StatefulWidget {
  final TextEditingController controler;
  final Widget icon;
  final String content;
  CustomInputField(
      {Key? key,
      required this.controler,
      required this.icon,
      required this.content})
      : super(key: key);

  @override
  State<CustomInputField> createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
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
    return Container(
      child: TextFormField(
        controller: widget.controler,
        decoration: InputDecoration(
          suffixIcon: widget.icon,
          labelText: widget.content,
          labelStyle: TextStyle(
            color: themeColor,
            fontSize: width * 0.03,
          ),
          floatingLabelStyle: TextStyle(
            color: themeColor,
            fontSize: width * 0.03,
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: themeColor),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: themeColor),
          ),
        ),
        keyboardType: TextInputType.name,
        keyboardAppearance: Brightness.dark,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return '*PLEASE ENTER ${widget.content.toUpperCase()}';
          }
          return null;
        },
      ),
    );
  }
}
