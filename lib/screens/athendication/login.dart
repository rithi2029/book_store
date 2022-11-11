import 'package:book_store/screens/athendication/dashboard.dart';
import 'package:book_store/screens/athendication/widget/custom_text_field.dart';
import 'package:book_store/screens/wrapper/wrapper.dart';
import 'package:book_store/widgets/text_wiget.dart';
import 'package:flutter/material.dart';

import '../../constants/global_colors.dart';
import '../../widgets/textform.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Color themeColor = Colors.white;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
        body: SafeArea(
      child: Container(
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              height: height * 0.05,
              width: width,
              child: Row(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: themeColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0)),
                        minimumSize: Size(width * 0.12, width * 0.12)),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AuthendicationScreen()),
                      );
                    },
                    child: Icon(Icons.arrow_back_rounded),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              width: width,
              height: height * 0.1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextWidget(
                      textColors: themeColor,
                      fontWeight: FontWeight.bold,
                      fntSize: width * 0.06,
                      content: "Welcome !"),
                  TextWidget(
                      textColors: themeColor,
                      fontWeight: FontWeight.normal,
                      fntSize: width * 0.035,
                      content: "Sign in to continue ")
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              width: width,
              height: height * 0.15,
              child: Form(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomInputField(
                      controler: _nameController,
                      icon: Icon(
                        Icons.person,
                        color: themeColor,
                      ),
                      content: "User Name",
                    ),
                    CustomInputField(
                      controler: _passwordController,
                      icon: Icon(
                        Icons.lock,
                        color: themeColor,
                      ),
                      content: "Password",
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              width: width,
              height: height * 0.15,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () {},
                        child: TextWidget(
                            textColors: themeColor,
                            fontWeight: FontWeight.normal,
                            fntSize: 14,
                            content: "Forgot Password ?")),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: themeColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0)),
                          minimumSize: Size(width, height * 0.05)),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Wrapper()),
                        );
                      },
                      icon: Icon(Icons.login_outlined),
                      label: TextWidget(
                          textColors: GlobalColors.white,
                          fontWeight: FontWeight.normal,
                          fntSize: 16,
                          content: "Login"),
                    ),
                  ]),
            ),
            Container(
              width: width,
              height: height * 0.02,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: width * 0.4,
                    height: 2,
                    color: themeColor,
                  ),
                  TextWidget(
                      textColors: themeColor,
                      fontWeight: FontWeight.bold,
                      fntSize: 16,
                      content: "OR "),
                  Container(
                    width: width * 0.4,
                    height: 2,
                    color: themeColor,
                  )
                ],
              ),
            ),
            Container(
              width: width,
              child: Column(
                children: [
                  TextWidget(
                    textColors: themeColor,
                    fontWeight: FontWeight.normal,
                    fntSize: 16,
                    content: "Sing in with ",
                  ),
                ],
              ),
            ),
            TextWidget(
              textColors: themeColor,
              fontWeight: FontWeight.normal,
              fntSize: 16,
              content: " Don't have an account ? Singup",
            ),
          ],
        )),
      ),
    ));
  }
}
