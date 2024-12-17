import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';

class MobilehomePageTwo extends StatelessWidget {
  const MobilehomePageTwo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.sized.height,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage('assets/mobile/first.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: context.sized.width * 0.1, right: context.sized.width * 0.1, bottom: context.sized.height * 0.03),
        child: Column(
          children: [
            const Spacer(),
            Text(
              "BURADA FİYATLARI BİZ DEĞİL,\nÜRETİCİLERİMİZ BELİRLİYOR",
              textAlign: TextAlign.center,
              style: GoogleFonts.merriweather(
                fontSize: context.sized.height * 0.02,
                fontWeight: FontWeight.bold,
                color: const Color.fromRGBO(51, 110, 122, 1),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "Üreticilerimizin, ürünlerini depolama, lojistik ve satış zorluklarıyla başa çıkmak zorunda kalmadan, kendi belirledikleri fiyatlarla tüketicilere ulaştırabilecekleri bir platform sağlıyoruz.",
              textAlign: TextAlign.center,
              style: GoogleFonts.merriweather(
                fontSize: context.sized.height * 0.02,
                color: const Color.fromRGBO(51, 110, 122, 1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}