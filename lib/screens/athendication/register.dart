// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:book_store/screens/athendication/dashboard.dart';
import 'package:book_store/screens/athendication/widget/custom_text_field.dart';
import 'package:book_store/widgets/text_wiget.dart';
import 'package:flutter/material.dart';

import '../../constants/global_colors.dart';
import '../../widgets/textform.dart';
import '../wrapper/wrapper.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  Color themeColor = Colors.white;
  final _register = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
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

    create_user() {
      print("reg" + _nameController.text);
      print("reg" + _passwordController.text);
      print("reg" + _emailController.text);
    }

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
                      content: "Sign up to continue ")
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              width: width,
              height: height * 0.27,
              child: Form(
                key: _register,
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
                        controler: _emailController,
                        icon: Icon(
                          Icons.mail,
                          color: themeColor,
                        ),
                        content: "Email",
                      ),
                      CustomInputField(
                        controler: _passwordController,
                        icon: Icon(
                          Icons.lock,
                          color: themeColor,
                        ),
                        content: "Password",
                      ),
                    ]),
              ),
            ),
            Container(
              width: width,
              height: height * 0.15,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: themeColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0)),
                          minimumSize: Size(width, height * 0.05)),
                      onPressed: () {
                        if (_register.currentState!.validate()) {
                          create_user(); // Navigator.push(

                        }
                        //   context,
                        //   MaterialPageRoute(builder: (context) => Wrapper()),
                        // );
                      },
                      icon: Icon(Icons.login_outlined),
                      label: TextWidget(
                          textColors: GlobalColors.white,
                          fontWeight: FontWeight.normal,
                          fntSize: 16,
                          content: "Register"),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: TextWidget(
                            textColors: themeColor,
                            fontWeight: FontWeight.normal,
                            fntSize: 16,
                            content: "Already have an account !"))
                  ]),
            ),
            Container(
              width: width,
              height: height * 0.04,
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
