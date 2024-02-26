import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vo_app/pages/navigation_page.dart';
import 'package:vo_app/reusable_components/confirm_button.dart';
import 'package:vo_app/reusable_components/language_button.dart';
import 'package:vo_app/styles/fonts.dart';

class LanguagesScreen extends StatefulWidget {
  const LanguagesScreen({super.key});

  @override
  State<LanguagesScreen> createState() => _LanguagesScreenState();
}

class _LanguagesScreenState extends State<LanguagesScreen> {
  int? activItem = null;
  late SharedPreferences prefs;
  late Future language;

  Future<int?> getSelectedLanguage() async {
    prefs = await SharedPreferences.getInstance();
    activItem = prefs.getInt('selectedLanguage');
  }

  @override
  void initState() {
    super.initState();
    language = getSelectedLanguage();
  }

  List<LanguageButtonItem> languages = [
    LanguageButtonItem(language: 'English', active: false, onPressed: () {}),
    LanguageButtonItem(language: 'Norsk', active: false, onPressed: () {}),
    LanguageButtonItem(language: 'Украiнська', active: false, onPressed: () {}),
    LanguageButtonItem(language: 'عربي', active: false, onPressed: () {}),
    LanguageButtonItem(language: 'Somaliyeed', active: false, onPressed: () {}),
    LanguageButtonItem(language: 'فارسی', active: false, onPressed: () {}),
    LanguageButtonItem(language: 'اردو', active: false, onPressed: () {}),
    LanguageButtonItem(language: 'Español', active: false, onPressed: () {}),
    LanguageButtonItem(language: 'Kiswahili', active: false, onPressed: () {}),
    LanguageButtonItem(language: 'ትግሪኛ', active: false, onPressed: () {}),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/logo_black.png',
                    width: 200,
                  ),
                ],
              ),
              // const SizedBox(height: 20),
              const Text('Welcome to VO!', style: Fonts.header1),
              const Text('Select a language', style: Fonts.header1),
              const SizedBox(height: 10),
              Container(
                height: MediaQuery.of(context).size.height * 0.50,
                child: FutureBuilder(
                    future: language,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return ListView.builder(
                            itemCount: languages.length,
                            itemBuilder: (context, index) {
                              return LanguageButton(
                                language: languages[index].language,
                                active: activItem == index ? true : false,
                                onPressed: () {
                                  setState(() {
                                    activItem = index;
                                  });
                                },
                              );
                            });
                      } else {
                        return Container(
                          child: CircularProgressIndicator(),
                        );
                      }
                    }),
              ),
              activItem == null
                  ? Icon(
                      Icons.arrow_downward,
                      size: 30,
                    )
                  : ConfirmButton(onPressed: () async {
                      await prefs.setInt('selectedLanguage', activItem!);
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: ((context) => NavigationPage()),
                        ),
                      );
                    })
            ],
          ),
        ),
      ),
    );
  }
}

class LanguageButtonItem {
  final String language;
  final bool active;
  final VoidCallback onPressed;

  const LanguageButtonItem({
    required this.language,
    required this.active,
    required this.onPressed,
  });
}
