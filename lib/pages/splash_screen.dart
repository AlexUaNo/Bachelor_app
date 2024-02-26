import 'package:flutter/material.dart';
import 'package:vo_app/pages/languages.dart';
import 'package:vo_app/pages/navigation_page.dart';
import 'package:vo_app/styles/fonts.dart';

class SplashScreen extends StatelessWidget {
  int? selectedLanguage;
  SplashScreen({super.key, required this.selectedLanguage});

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 5),
      () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
              // for language!
              builder: ((context) => selectedLanguage == null
                  ? LanguagesScreen()
                  : const NavigationPage())),
        );
      },
    );
    return Scaffold(
      //   appBar: AppBar(
      //     title: const Text('Splash Screen'),
      //   ),
      body: Container(
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Image.asset(
              'assets/logo_black.png',
              width: 200,
            ),
            const Text('Welcome to VO', style: Fonts.header1),
            SizedBox(
              height: 30,
            ),
            const Text('Livsmestringsapp', style: Fonts.italicBold),
          ]),
        ),
      ),
    );
  }
}
