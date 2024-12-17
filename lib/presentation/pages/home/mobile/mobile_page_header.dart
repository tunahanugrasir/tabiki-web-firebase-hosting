 import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';
import 'package:tabiki_web/presentation/pages/widgets/mobile/mobile_layout_drawer.dart';

class MobileHomePageHeader extends StatelessWidget {
  const MobileHomePageHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.sized.height,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/mobile/header.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(top: context.sized.height * 0.1, bottom: context.sized.height * 0.1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: context.sized.height * 0.2,
              width: context.sized.width,
              child: Column(
                children: [
                  Text(
                    "nilhan tunahan",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.merriweather(
                      fontSize: context.sized.height * 0.03,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      color: const Color.fromRGBO(51, 110, 122, 1),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Bölgenizdeki üreticileri keşfedin\nve yerel üretimi destekleyin.",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.merriweather(
                      fontSize: context.sized.height * 0.02,
                      color: const Color.fromRGBO(51, 110, 122, 1),
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
                      onPressed: () => MobileDrawer.showDownloadDialog(context),
              style: ElevatedButton.styleFrom(
                elevation: 5,
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                backgroundColor: const Color.fromRGBO(51, 110, 122, 1),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                "Alışverişe Başla",
                style: GoogleFonts.merriweather(
                  fontSize: context.sized.height * 0.02,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
