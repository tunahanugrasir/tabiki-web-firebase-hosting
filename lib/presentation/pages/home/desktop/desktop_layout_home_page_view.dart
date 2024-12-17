import 'package:flutter/material.dart';
import 'package:tabiki_web/presentation/pages/home/desktop/desktop_home_page_footer.dart';
import 'package:tabiki_web/presentation/pages/home/desktop/desktop_home_page_four.dart';
import 'package:tabiki_web/presentation/pages/home/desktop/desktop_home_page_one.dart';
import 'package:tabiki_web/presentation/pages/home/desktop/desktop_home_page_three.dart';
import 'package:tabiki_web/presentation/pages/home/desktop/desktop_home_page_two.dart';

class DesktopLayoutHomePageView extends StatelessWidget {
  const DesktopLayoutHomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            HomePageOne(),
            HomePageTwo(),
            HomePageThree(),
            HomePageFour(),
            HomePageFooter(
              backgroundColor: Color.fromRGBO(225, 233, 230, 1),
            ),
          ],
        ),
      ),
    );
  }
}
