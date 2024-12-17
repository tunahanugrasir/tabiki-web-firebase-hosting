import 'package:flutter/material.dart';
import 'package:tabiki_web/presentation/pages/israf/mobile/mobile_food_access_section.dart';
import 'package:tabiki_web/presentation/pages/israf/mobile/mobile_how_it_works.dart';
import 'package:tabiki_web/presentation/pages/israf/mobile/mobile_scrolling_food_banner.dart';
import 'package:tabiki_web/presentation/pages/israf/mobile/mobile_waste_statistics_section.dart';
import 'package:tabiki_web/presentation/pages/israf/mobile/mobile_why_choose_us.dart';


import '../../widgets/mobile/mobile_app_bar.dart';
import '../../widgets/mobile/mobile_footer.dart';
import '../../widgets/mobile/mobile_layout_drawer.dart';


class MobileIsrafPage extends StatelessWidget {
  const MobileIsrafPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: MobileAppBar(),
      ),
      drawer:  MobileDrawer(),
      body: SingleChildScrollView(
        padding: EdgeInsets.zero,
        physics: ClampingScrollPhysics(),
        child: Column(
          children: [
            MobileHowItWorks(),
            MobileWasteStatisticsSection(),
            MobileFoodAccessSection(),
            MobileWhyChooseUs(),
            MobileScrollingFoodBanner(),
            MobileFooter(backgroundColor: Colors.white),
          ],
        ),
      ),
    );
  }
}
