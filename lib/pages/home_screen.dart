import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:vo_app/data/carrer_data.dart';
import 'package:vo_app/data/health_data.dart';
import 'package:vo_app/pages/carrer_page.dart';
import 'package:vo_app/reusable_components/homepage_card.dart';
import 'package:vo_app/styles/colors.dart';
import 'package:vo_app/styles/fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   centerTitle: true,
      //   title:
      //   // actions: [                     // signs for Setting , Language on the right top - do not need it
      //   //   IconButton(onPressed: () {}, icon: Icon(Icons.settings, size: 30)),
      //   //   IconButton(onPressed: () {}, icon: Icon(Icons.language, size: 30)),
      //   // ]
      // ),
      body: Column(
        children: [
          Container(
            child: Image.asset(
              'assets/logo_black.png',
              width: 200,
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  HomePageCard(
                      backgroundColor: AppColors.weakedGreen,
                      title: 'CAREER',
                      icon: Icon(
                        Icons.work,
                        size: 40,
                        color: AppColors.white,
                      ),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => CarrerPage(
                                  isCareer: true,
                                  pageItems: carrerPageItems,
                                )));
                      }),
                  const SizedBox(height: 15),
                  HomePageCard(
                      backgroundColor: AppColors.spaceCadet,
                      title: 'HEALTH',
                      icon: Icon(
                        Icons.local_hospital,
                        size: 40,
                        color: AppColors.white,
                      ),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => CarrerPage(
                                  isCareer: false,
                                  pageItems: healthPageItems,
                                )));
                      }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
