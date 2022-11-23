import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import '../widgets/widgets.dart';
import '../pallete.dart';
import 'hfirst_screen.dart';
import 'user_profile.dart';

class HomeScreen extends StatefulWidget {
  final List firstlist;
  const HomeScreen({Key? key, required this.firstlist}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
  //    void initState() {
  //  print(widget.firstlist[2]);
  // super.initState();
  // }

    // ignore: no_leading_underscores_for_local_identifiers
    PersistentTabController _controller;

    _controller = PersistentTabController(initialIndex: 0);
    // ignore: no_leading_underscores_for_local_identifiers
    List<Widget> _buildScreens() {
      return [
       FirstScreen(firstlist: [widget.firstlist[2]],),
        const FirstScreen(firstlist: [],),
        const FirstScreen(firstlist: [],),
        Profile(firstlist: [widget.firstlist[2]],),
      ];

    }
    //  debugPrint(firstlist[2]);

    // ignore: no_leading_underscores_for_local_identifiers
    List<PersistentBottomNavBarItem> _navBarsItems() {
      return [
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.home),
          title: ("Home"),
          textStyle: textColor12,
          activeColorPrimary: primaryColor,
          inactiveColorPrimary: iconColor,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.favorite),
          title: ("Favorite"),
          textStyle: textColor12,
          activeColorPrimary: primaryColor,
          inactiveColorPrimary: iconColor,
        ),
       
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.search),
          title: ("Search"),
          textStyle: textColor12,
          activeColorPrimary: primaryColor,
          inactiveColorPrimary: iconColor,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.person),
          title: ("Profile"),
          textStyle: textColor12,
          activeColorPrimary: primaryColor,
          inactiveColorPrimary: iconColor,
        ),
      ];
    }

    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: barColor,
      // Default is Colors.white.
      handleAndroidBackButtonPress: true,
      // Default is true.
      resizeToAvoidBottomInset: true,
      // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true,
      // Default is true.
      hideNavigationBarWhenKeyboardShows: true,
      // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: backGroundColor,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style9, // Choose the nav bar style with this property.
    );
  }
}


