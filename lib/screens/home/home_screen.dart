// ignore_for_file: prefer_const_constructors

import 'package:badges/badges.dart';
import 'package:book_store/screens/profile/profile.dart';
import 'package:book_store/screens/setting/setting.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../../constants/global_colors.dart';
import '../../widgets/icon_widget.dart';
import '../../widgets/text_wiget.dart';
import '../cart/cart.dart';
import '../dashboard/dashboard_screen.dart';
import '../drawer/drawer.dart';
import '../wish_list/wish_list.dart';

class HomeScreen extends StatefulWidget {
  final drawer;
  final int? index;
  HomeScreen({Key? key, required this.drawer, this.index}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w600);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

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
    if (widget.index == null) {
      setState(() {
        _selectedIndex = 0;
      });
    } else {
      setState(() {
        _selectedIndex = widget.index!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetOptions = <Widget>[
      DashboardScreen(
        drawer: widget.drawer,
      ),
      WishListScreen(
        drawer: widget.drawer,
      ),
      ProfileScreen(
        drawer: widget.drawer,
      ),
      SettingScreen(
        drawer: widget.drawer,
      )
    ];

    return Scaffold(
      body: widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: themeColor,
              hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor: GlobalColors.white,
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: Duration(milliseconds: 300),
              tabBackgroundColor: themeColor,
              color: Colors.black,
              tabs: [
                GButton(
                  icon: Icons.home_outlined,
                  text: 'Home',
                  iconColor: themeColor,
                ),
                GButton(
                  icon: Icons.favorite_border,
                  text: 'WishList',
                  iconColor: themeColor,
                ),
                GButton(
                  icon: Icons.person_outline,
                  text: 'Profile',
                  iconColor: themeColor,
                ),
                GButton(
                  icon: Icons.settings_outlined,
                  text: 'Setting',
                  iconColor: themeColor,
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
