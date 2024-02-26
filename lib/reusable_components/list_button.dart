import 'package:flutter/material.dart';
import 'package:vo_app/styles/colors.dart';
import 'package:vo_app/styles/fonts.dart';

class ListButton extends StatelessWidget {
  String content;
  bool active;
  Color activeColor;
  Color inactiveColor;

  final VoidCallback onPressed;
  ListButton(
      {super.key,
      required this.content,
      required this.activeColor,
      required this.inactiveColor,
      required this.active,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 70,
          decoration: BoxDecoration(
            color: active ? activeColor : inactiveColor,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Center(
              child: Text(content,
                  style: active
                      ? Fonts.LanguageButtonActive
                      : Fonts.LanguageButton)),
        ));
  }
}
