

import 'package:flutter/material.dart';
import 'package:tabiki_web/presentation/pages/home/tablet/tablet_home_page_footer.dart';
import 'package:tabiki_web/presentation/pages/israf/tablet/tablet_food_access_section.dart';
import 'package:tabiki_web/presentation/pages/israf/tablet/tablet_how_it_works.dart';
import 'package:tabiki_web/presentation/pages/israf/tablet/tablet_scrolling_food_banner.dart';
import 'package:tabiki_web/presentation/pages/israf/tablet/tablet_waste_statistics_section.dart';
import 'package:tabiki_web/presentation/pages/israf/tablet/tablet_why_choose_us.dart';

class TabletIsrafPage extends StatelessWidget {
  const TabletIsrafPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TabletHowItWorks(),
            TabletWasteStatisticsSection(),
            TabletFoodAccessSection(),
            TabletWhyChooseUs(),
            TabletScrollingFoodBanner(),
            TabletHomePageFooter(
              backgroundColor: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
