import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';
import 'package:tabiki_web/presentation/pages/home/desktop/desktop_page_header.dart';

class HomePageOne extends StatelessWidget {
  const HomePageOne({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.sized.height,
      width: context.sized.width,
      decoration: const BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage('assets/images/header-background.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.sized.width * 0.1,
          vertical: context.sized.height * 0.05,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const DesktopPageHeader(),
            const SizedBox(height: 100),
            Text(
              "tabiki doğal, tabiki yerel!",
              style: GoogleFonts.merriweather(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                color: const Color.fromRGBO(51, 110, 122, 1),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "Bölgenizdeki üreticileri keşfedin\nve yerel üretimi destekleyin.",
              style: GoogleFonts.merriweather(
                fontSize: 20,
                color: const Color.fromRGBO(51, 110, 122, 1),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(51, 110, 122, 1),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                "Alışverişe Başla",
                style: GoogleFonts.merriweather(
                  fontSize: 20,
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
