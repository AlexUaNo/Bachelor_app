import 'package:flutter/material.dart';
import 'package:vo_app/styles/colors.dart';
import 'package:vo_app/styles/fonts.dart';

class ButtomNavigationBar extends StatefulWidget {
  int selectedTab;
  final Function(int) onTap;
  ButtomNavigationBar({
    super.key,
    required this.selectedTab,
    required this.onTap,
  });

  @override
  State<ButtomNavigationBar> createState() => ButtomNavigationBarState();
}

class ButtomNavigationBarState extends State<ButtomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        backgroundColor: AppColors.lightGrey,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: Fonts.bottomNavLabelSelected,
        unselectedLabelStyle: Fonts.bottomNavLabel,
        selectedIconTheme: const IconThemeData(color: AppColors.tune),
        unselectedIconTheme: const IconThemeData(color: Colors.grey),
        currentIndex: widget.selectedTab,
        onTap: widget.onTap,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.work), label: 'Work'),
          BottomNavigationBarItem(
              icon: Icon(Icons.local_hospital), label: 'Health'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Settings'),
          BottomNavigationBarItem(
              icon: Icon(Icons.language), label: 'Language'),
        ]);
  }
}
