import 'package:coffy_application/consts.dart';
import 'package:coffy_application/screens/home_screen.dart';
import 'package:coffy_application/screens/personalScreen.dart';
import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _bottomNavIndex = 0;
  List<IconData> iconList = [
    Icons.home,
    Icons.favorite,
    Icons.shop,
    Icons.notifications,
  ];
  List screens = [
    const HomeScreen(),
    const Text("Favorites Screen"),
    const Text("Cart Screen"),
    const Text("Notifications Screen"),
  ];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: screens[_bottomNavIndex]!, //destination screen
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>personalScreen()));
        },
        backgroundColor: mainColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(size.width * 0.5))
        ),
        child: const Icon(Icons.person, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: iconList,
        activeIndex: _bottomNavIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.verySmoothEdge,
        leftCornerRadius: 32,
        rightCornerRadius: 32,
        backgroundColor: Colors.black,
        activeColor: mainColor,
        inactiveColor: Colors.white,
        iconSize: size.width * 0.07,
        onTap: (index) => setState(() => _bottomNavIndex = index),
        //other params
      ),
    );
  }
}
