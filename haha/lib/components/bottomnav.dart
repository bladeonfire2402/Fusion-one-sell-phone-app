import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:haha/screen/auth-ui/home.dart';
import 'package:haha/screen/auth-ui/order.dart';
import 'package:haha/screen/auth-ui/profile.dart';
import 'package:haha/screen/auth-ui/search.dart';

class Bottomnav extends StatefulWidget {
  const Bottomnav({super.key});

  @override
  State<Bottomnav> createState() => _BottomnavState();
}

class _BottomnavState extends State<Bottomnav> {
  late List<Widget> pages;

  late HomeScreen HomePage;
  late SearchScreen SearchPage;
  late OrderScreen OrderPage;
  late ProfileScreen ProfilePage;

  int currentTabIndex = 0;

  @override
  void initState() {
    HomePage = HomeScreen();
    SearchPage = SearchScreen();
    OrderPage = OrderScreen();
    ProfilePage = ProfileScreen();

    pages = [HomePage,SearchPage, OrderPage, ProfilePage];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        height: 60,
        backgroundColor: Colors.white,
        color: Colors.black,
        animationDuration: Duration(milliseconds: 350),
        onTap: (int index) {
          setState(() {
            currentTabIndex = index;
          });
        },
        items: [
          Icon(
            Icons.home_outlined,
            color: Colors.white,
          ),
          Icon(Icons.search, color: Colors.white),
          Icon(
            Icons.shopping_bag_outlined,
            color: Colors.white,
          ),
          Icon(
            Icons.person_3_outlined,
            color: Colors.white,
          ),
        ],
      ),
      body: pages[currentTabIndex],
    );
  }
}
