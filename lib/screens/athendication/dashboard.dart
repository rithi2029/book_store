// import 'package:book_store/constants/global_colors.dart';
import 'package:book_store/screens/athendication/register.dart';
import 'package:book_store/screens/wrapper/wrapper.dart';
import 'package:book_store/widgets/text_wiget.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../constants/global_colors.dart';
import 'login.dart';

class AuthendicationScreen extends StatefulWidget {
  AuthendicationScreen({Key? key}) : super(key: key);

  @override
  State<AuthendicationScreen> createState() => _AuthendicationScreenState();
}

class _AuthendicationScreenState extends State<AuthendicationScreen> {
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
      body: Container(
        width: width,
        height: height,
        color: GlobalColors.containerColors,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: height * 0.4,
              child: Center(
                child: Lottie.asset("Assets/lottie/lottie1.json",
                    fit: BoxFit.fill),
              ),
            ),
            Container(
              height: height * 0.08,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidget(
                      textColors: themeColor,
                      fontWeight: FontWeight.bold,
                      fntSize: 22,
                      content: "Welcome to Bookstore"),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      "Create an account to save all sparkles and access them from anywhere.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 15.0,
                          color: GlobalColors.grey,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: width,
              height: height * 0.2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 173, 147, 138),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        minimumSize: Size(width * 0.6, height * 0.05)),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                    icon: Icon(Icons.login_outlined),
                    label: TextWidget(
                        textColors: GlobalColors.white,
                        fontWeight: FontWeight.normal,
                        fntSize: 16,
                        content: "Login"),
                  ),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 77, 198, 188),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        minimumSize: Size(width * 0.6, height * 0.05)),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterScreen()),
                      );
                    },
                    icon: Icon(Icons.app_registration),
                    label: TextWidget(
                        textColors: GlobalColors.white,
                        fontWeight: FontWeight.normal,
                        fntSize: 16,
                        content: "Register"),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
