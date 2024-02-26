import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:vo_app/styles/colors.dart';
import 'package:vo_app/styles/fonts.dart';

class LanguageButton extends StatelessWidget {
  String language;
  bool active;
  final VoidCallback onPressed;
  LanguageButton(
      {super.key,
      required this.language,
      required this.active,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        child: Container(
          padding: EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width,
          // height: 50,
          decoration: BoxDecoration(
            color: active ? AppColors.casal : AppColors.ashGrey,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Center(
              child: Text(
            language,
            style: active ? Fonts.LanguageButtonActive : Fonts.LanguageButton,
            overflow: TextOverflow.ellipsis,
          )),
        ));
  }
}
