import 'package:flutter/material.dart';
import 'package:tabiki_web/presentation/pages/home/mobile/mobile_layout_home_page_four.dart';
import 'package:tabiki_web/presentation/pages/home/mobile/mobile_layout_home_page_three.dart';
import 'package:tabiki_web/presentation/pages/home/mobile/mobile_layout_home_page_two.dart';
import 'package:tabiki_web/presentation/pages/home/mobile/mobile_page_header.dart';

import '../../widgets/mobile/mobile_app_bar.dart';
import '../../widgets/mobile/mobile_footer.dart';
import '../../widgets/mobile/mobile_layout_drawer.dart';

class MobileLayoutHomePageView extends StatelessWidget {
  const MobileLayoutHomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
          kToolbarHeight,
        ),
        child: MobileAppBar(),
      ),
      drawer: MobileDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            MobileHomePageHeader(),
            MobilehomePageTwo(),
            MobileHomePageThree(),
            MobileHomePageFour(),
            MobileFooter(backgroundColor: Color.fromRGBO(225, 233, 230, 1)),
          ],
        ),
      ),
    );
  }
}
