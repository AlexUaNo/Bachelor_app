import 'package:flutter/material.dart';
import 'package:vo_app/data/carrer_data.dart';
import 'package:vo_app/data/health_data.dart';
import 'package:vo_app/pages/carrer_page.dart';
import 'package:vo_app/pages/home_screen.dart';
import 'package:vo_app/pages/languages.dart';
import 'package:vo_app/reusable_components/button_navigation.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => NavigationPageState();
}

class NavigationPageState extends State<NavigationPage> {
  int selectedTab = 0;

  void onPressed(int value) {
    setState(() {
      selectedTab = value;
    });
  }

  final List<Widget> pages = [
    HomeScreen(),
    CarrerPage(
      isCareer: true,
      pageItems: carrerPageItems,
    ),
    CarrerPage(isCareer: false, pageItems: healthPageItems),
    Text('Settings'),
    LanguagesScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedTab],
      bottomNavigationBar: ButtomNavigationBar(
        selectedTab: selectedTab,
        onTap: onPressed,
      ),
    );
  }
}
