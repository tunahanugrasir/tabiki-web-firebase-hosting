import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';

class TabletHomePageTwo extends StatelessWidget {
  const TabletHomePageTwo({
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
          image: AssetImage('assets/images/5.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Row(
        children: [
          const Spacer(),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 200),
                  child: Text(
                    "BURADA FİYATLARI BİZ DEĞİL,\nÜRETİCİLERİMİZ BELİRLİYOR",
                    style: GoogleFonts.merriweather(
                      fontSize: context.sized.width * 0.02,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromRGBO(51, 110, 122, 1),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 100, right: 100, top: 20.0, bottom: 20),
                  child: Text(
                    "Üreticilerimizin, ürünlerini depolama, lojistik ve satış zorluklarıyla başa çıkmak zorunda kalmadan, kendi belirledikleri fiyatlarla tüketicilere ulaştırabilecekleri bir platform sağlıyoruz. Bu şekilde yerel üreticilerin geçim kaynaklarını desteklerken, tüketicilere de taze, doğal ve yerel ürünlere kolayca ulaşma fırsatı sunuyoruz.",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.merriweather(
                      fontSize: context.sized.width * 0.015,
                      color: const Color.fromRGBO(51, 110, 122, 1),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
