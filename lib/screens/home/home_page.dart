import 'package:flutter/material.dart';
import 'package:kitab_qurdu/color.dart';
import 'package:kitab_qurdu/screens/home/home_screen.dart';

import '../account_page.dart/account.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> screens = [
    const HomeScreen(),
    const Scaffold(),
    const Scaffold(),
    const AccountPage(),
  ];

  int currentIndex = 0;

  void setCurretIndex(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: screens[currentIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: kPrimaryColor,
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(0.0),
        child: BottomAppBar(
          shape: const AutomaticNotchedShape(
            RoundedRectangleBorder(),
            StadiumBorder(
              side: BorderSide(),
            ),
          ),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            IconButton(
              iconSize: 30,
              onPressed: () => setCurretIndex(0),
              icon: Icon(
                currentIndex == 0 ? Icons.home : Icons.home_outlined,
                color: kPrimaryColor,
              ),
            ),
            IconButton(
              iconSize: 30,
              onPressed: () => setCurretIndex(1),
              icon: Icon(
                currentIndex == 1 ? Icons.favorite : Icons.favorite_border,
                color: kPrimaryColor,
              ),
            ),
            SizedBox(
              width: screenWidth * 0.05,
            ),
            IconButton(
              iconSize: 30,
              onPressed: () => setCurretIndex(2),
              icon: Icon(
                currentIndex == 2
                    ? Icons.shopping_cart
                    : Icons.shopping_cart_outlined,
                color: kPrimaryColor,
              ),
            ),
            IconButton(
              iconSize: 30,
              onPressed: () => setCurretIndex(3),
              icon: Icon(
                currentIndex == 3 ? Icons.person : Icons.person_outline,
                color: kPrimaryColor,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
