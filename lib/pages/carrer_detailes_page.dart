import 'package:flutter/material.dart';
import 'package:vo_app/classes/classes.dart';
import 'package:vo_app/pages/video_page.dart';
import 'package:vo_app/reusable_components/language_button.dart';
import 'package:vo_app/reusable_components/list_button.dart';
import 'package:vo_app/styles/colors.dart';
import 'package:vo_app/styles/fonts.dart';

class CarrerDetailesPage extends StatefulWidget {
  PageItem item;
  bool isCareer;
  CarrerDetailesPage({super.key, required this.item, required this.isCareer});

  @override
  State<CarrerDetailesPage> createState() => _CarrerDetailesPageState();
}

class _CarrerDetailesPageState extends State<CarrerDetailesPage> {
  int activeITem = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: Row(
          children: [
            IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: AppColors.white,
                size: 30,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
        title: Text(widget.item.content, style: Fonts.homePageCardLabel),
        backgroundColor:
            widget.isCareer ? AppColors.weakedGreen : AppColors.spaceCadet,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            widget.item.content,
            style: Fonts.header3,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.7,
            child: ListView.builder(
                itemCount: widget.item.items.length + 1,
                itemBuilder: (context, index) {
                  return index == 0
                      ? SizedBox(height: 20)
                      : ListButton(
                          content: widget.item.items[index - 1].title,
                          active: activeITem == index - 1 ? true : false,
                          activeColor: AppColors.weakedGreen,
                          inactiveColor: AppColors.ashGrey,
                          onPressed: () {
                            setState(() {
                              activeITem = index - 1;
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => VideoPage(
                                        isCareer: widget.isCareer,
                                        item:
                                            widget.item.items[index - 1].items,
                                        title: widget.item.content,
                                      )));
                            });
                          },
                        );
                }),
          ),
        ],
      ),
    );
  }
}
