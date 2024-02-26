import 'package:flutter/material.dart';
import 'package:vo_app/styles/colors.dart';
import 'package:vo_app/styles/fonts.dart';

class HomePageCard extends StatelessWidget {
  Color backgroundColor;
  String title;
  Icon icon;
  final VoidCallback onPressed;

  HomePageCard(
      {super.key,
      required this.icon,
      required this.backgroundColor,
      required this.title,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed();
      },
      child: Card(
          color: backgroundColor,
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  icon,
                  const SizedBox(width: 10),
                  Text(
                    title,
                    style: Fonts.homePageCardLabel,
                  ),
                ]),
                Container(
                  margin:
                      EdgeInsets.only(top: 15, right: 20, left: 20, bottom: 0),
                  child: const LinearProgressIndicator(
                    value: 0.5,
                    minHeight: 10,
                    backgroundColor: AppColors.white,
                    valueColor: AlwaysStoppedAnimation<Color>(AppColors.salmon),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
