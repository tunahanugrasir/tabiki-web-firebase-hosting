import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';

class HomePageThree extends StatelessWidget {
  const HomePageThree({
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
          image: AssetImage('assets/images/6.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          top: context.sized.height * 0.25,
          left: context.sized.width * 0.08,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "HAK EDİLMİŞ KAZANÇ",
              style: GoogleFonts.merriweather(
                fontSize: context.sized.width * 0.03,
                fontWeight: FontWeight.bold,
                color: const Color.fromRGBO(51, 110, 122, 1),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "tabiki’de fiyatları üreticilerimiz belirler.\nHer siparişin %80'ini doğrudan alırlar.\nBiz ise pazarlama, satış ve lojistik süreçlerini kolaylaştırırız.\nYerel üreticileri destekleyin!",
              style: GoogleFonts.merriweather(
                fontSize: context.sized.width * 0.015,
                color: const Color.fromRGBO(51, 110, 122, 1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
