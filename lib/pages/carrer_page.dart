import 'package:flutter/material.dart';
import 'package:vo_app/classes/classes.dart';
import 'package:vo_app/data/carrer_data.dart';
import 'package:vo_app/data/health_data.dart';
import 'package:vo_app/pages/carrer_detailes_page.dart';
import 'package:vo_app/reusable_components/language_button.dart';
import 'package:vo_app/reusable_components/list_button.dart';
import 'package:vo_app/styles/colors.dart';
import 'package:vo_app/styles/fonts.dart';

class CarrerPage extends StatefulWidget {
  final bool isCareer;
  final List<PageItem> pageItems;
  const CarrerPage(
      {super.key, required this.isCareer, required this.pageItems});

  @override
  State<CarrerPage> createState() => _CarrerPageState();
}

class _CarrerPageState extends State<CarrerPage> {
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
        // leading: Row(                       // a row to come back
        //   children: [
        //     IconButton(
        //       icon: const Icon(
        //         Icons.arrow_back,
        //         color: AppColors.white,
        //         size: 30,
        //       ),
        //       onPressed: () {},
        //     ),
        //   ],
        // ),
        title: Text(widget.isCareer ? 'Career' : 'Health',
            style: Fonts.homePageCardLabel),
        backgroundColor:
            widget.isCareer ? AppColors.weakedGreen : AppColors.spaceCadet,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
            itemCount: widget.pageItems.length + 1,
            itemBuilder: (context, index) {
              return index == 0
                  ? SizedBox(height: 20)
                  : ListButton(
                      content: widget.pageItems[index - 1].content,
                      active: activeITem == index - 1 ? true : false,
                      activeColor: widget.isCareer
                          ? AppColors.weakedGreen
                          : AppColors.spaceCadet,
                      inactiveColor: widget.isCareer
                          ? AppColors.ashGrey
                          : AppColors.spindle,
                      onPressed: () {
                        setState(() {
                          activeITem = index - 1;
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => CarrerDetailesPage(
                                  isCareer: widget.isCareer,
                                  item: widget.pageItems[index - 1])));
                        });
                      },
                    );
            }),
      ),
    );
  }
}
