import 'package:flutter/material.dart';
import 'package:tabiki_web/presentation/pages/home/desktop/desktop_home_page_footer.dart';
import 'package:tabiki_web/presentation/pages/israf/desktop/food_access_section.dart';
import 'package:tabiki_web/presentation/pages/israf/desktop/how_it_works.dart';
import 'package:tabiki_web/presentation/pages/israf/desktop/scrolling_food_banner.dart';
import 'package:tabiki_web/presentation/pages/israf/desktop/waste_statistics_section.dart';
import 'package:tabiki_web/presentation/pages/israf/desktop/why_choose_us.dart';

class IsrafPage extends StatelessWidget {
  const IsrafPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HowItWorks(),
            WasteStatisticsSection(),
            FoodAccessSection(),
            WhyChooseUs(),
            ScrollingFoodBanner(),
            HomePageFooter(
              backgroundColor: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
