import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:sports_hub/style/screen_utils.dart';
import 'package:sports_hub/style/style.dart';
import 'package:sports_hub/ui/screens/events/events.dart';
import 'package:sports_hub/ui/screens/home/home.dart';
import 'package:sports_hub/ui/screens/post/post.dart';
import 'package:sports_hub/ui/screens/profile/profile.dart';
import 'package:sports_hub/ui/screens/search/search.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _selectedIndex = 0;

  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static List<Widget> _widgetOptions = <Widget>[
    Home(),
    SearchPage(),
    PostPage(),
    EventsPage(),
    profile(),
  ];

  @override
  Widget build(BuildContext context) {
    final screenUtil = ScreenUtils(context);
    return Scaffold(
      backgroundColor: AppColors().backgroundColour,
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(screenUtil.screenWidth * 0.005),
        child: Container(
          clipBehavior: Clip.none,
          // height: screenheight * 0.15,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(screenUtil.screenWidth * 0.02),
            child: GNav(
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(
                  () {
                    _selectedIndex = index;
                  },
                );
              },
              tabBorderRadius: 20,
              textSize: screenUtil.screenHeight * 0.50,
              rippleColor: AppColors()
                  .primaryColour, // tab button ripple color when pressed
              // hoverColor: AppColors().primaryColour, // tab button hover color
              haptic: true, // haptic feedback
              tabActiveBorder: Border.all(
                color: AppColors().primaryColour,
                width: 0,
              ), // tab button border
              // tabBorder:
              //     Border.all(color: prop.rang5, width: 1), // tab button border
              // tabShadow: [
              //   BoxShadow(color: prop.rang1, blurRadius: 2)
              // ], // tab button shadow
              // curve: Curves.easeOutExpo, // tab animation curves
              // duration: Duration(milliseconds: 10), // tab animation duration
              gap: 2, // the tab button gap between icon and text
              // color: prop.rang6, // unselected icon color
              activeColor:
                  AppColors().backgroundColour, // selected icon and text color
              // iconSize: 35, // tab button icon size
              tabBackgroundColor:
                  AppColors().textColour, // selected tab background color
              // iconSize: screenWidth ,
              padding: EdgeInsets.symmetric(
                horizontal: screenUtil.screenWidth * 0.05,
                vertical: screenUtil.screenWidth * 0.035,
              ), // navigation bar padding
              tabs: [
                GButton(
                  icon: Icons.home_filled,
                  text: '',
                  textSize: screenUtil.screenHeight,
                ),
                GButton(
                  icon: Icons.search_outlined,
                  text: '',
                  textSize: screenUtil.screenHeight,
                ),
                GButton(
                  icon: Icons.add_circle,
                  text: '',
                  textSize: screenUtil.screenHeight,
                ),
                GButton(
                  icon: Icons.location_on,
                  text: '',
                  textSize: screenUtil.screenHeight,
                ),
                GButton(
                  icon: Icons.account_circle_rounded,
                  text: '',
                  textSize: screenUtil.screenHeight,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
