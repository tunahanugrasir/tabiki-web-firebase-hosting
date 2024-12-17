 import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';
import 'package:tabiki_web/presentation/pages/be_a_producer/desktop/constants/timeline_constants.dart';
import 'package:tabiki_web/presentation/pages/be_a_producer/mobile/widgets/mobile_layout_timeline_step.dart';


Widget mobileLayoutBeAProducerTimeline(BuildContext context) {
    return Container(
      width: context.sized.width,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            TimelineColors.backgroundColor,
            TimelineColors.backgroundEndColor,
          ],
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.sized.width * 0.1,
          vertical: 50,
        ),
        child: Column(
          children: [
            Text(
              "Nasıl Üretici Olunur?",
              textAlign: TextAlign.center,
              style: GoogleFonts.merriweather(
                fontSize: context.sized.width * 0.08,
                fontWeight: FontWeight.bold,
                color: TimelineColors.textColor,
                shadows: [
                  Shadow(
                    color: Colors.black.withOpacity(0.1),
                    offset: const Offset(0, 2),
                    blurRadius: 4,
                  ),
                ],
              ),
            ),
            SizedBox(height: context.sized.height * 0.05),
            ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: context.sized.width * 0.8,
              ),
              child: const Column(
                children: [
                  MobileTimelineStep(
                    icon: Icons.app_registration_rounded,
                    title: "Uygulamamızı İndirin",
                    description: "Uygulamamızı indirin ve üretici olarak kayıt olun",
                    stepNumber: "1",
                    gradientColors: TimelineColors.step1Colors,
                    imagePath: "assets/be_producer/register.webp",
                    isLeft: true,
                  ),
                  MobileTimelineStep(
                    icon: Icons.inventory_2_rounded,
                    title: "Ürünlerinizi Ekleyin",
                    description: "Ürünlerinizi kolayca sisteme ekleyin",
                    stepNumber: "2",
                    gradientColors: TimelineColors.step2Colors,
                    imagePath: "assets/be_producer/product.webp",
                    isLeft: false,
                  ),
                  MobileTimelineStep(
                    icon: Icons.people_rounded,
                    title: "Hazırlığınızı Yapın",
                    description: "Ürünlerinizi ekip arkadaşlarımız gelene kadar hazırlayın",
                    stepNumber: "3",
                    gradientColors: TimelineColors.step3Colors,
                    imagePath: "assets/be_producer/team.webp",
                    isLeft: true,
                  ),
                  MobileTimelineStep(
                    icon: Icons.local_shipping_rounded,
                    title: "Siparişleri Takip Edin",
                    description: "Ürünler bize ulaştıktan sonra gerisini bize bırakın ve siparişlerinizin bildirimini keyifle dinleyin",
                    stepNumber: "4",
                    gradientColors: TimelineColors.step4Colors,
                    imagePath: "assets/be_producer/order.webp",
                    isLeft: false,
                    isLast: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }