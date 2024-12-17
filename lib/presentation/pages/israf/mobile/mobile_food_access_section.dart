import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';

class MobileFoodAccessSection extends StatelessWidget {
  const MobileFoodAccessSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(254, 249, 235, 1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              child: Column(
                children: [
                  Text(
                    '"Çiftçiden Sofraya, İsrafı Durdurmak İçin tabiki Yanınızda!"',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 22,
                      fontWeight: FontWeight.w900,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 20),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                      children: const [
                        TextSpan(
                          text: 'İsrafı Önleme Politikamızın Temel İlkeleri\n\n',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: '1. Kaynağında İsrafı Azaltmak\n',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text:
                              'Pazar normlarına uymadığı için kabul edilmeyen (örneğin şekli veya boyutu standart dışı olan) ancak tüketilebilir durumdaki ürünleri alıyor ve uygun fiyatlarla tüketicilere ulaştırıyoruz.\n\n',
                        ),
                        TextSpan(
                          text: '2. Depolama ve Dağıtımı Optimize Etmek\n',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: 'Soğuk hava depolarında ürünleri taze tutarak hızlı teslimat sağlıyor, lojistik kayıpları azaltıyoruz.\n\n',
                        ),
                        TextSpan(
                          text: '3. Ürünlere Değer Katmak\n',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: 'Üreticilerin ürünlerini hak ettiği değerden alıyor, standart dışı ürünleri ekonomik faydaya dönüştürüyoruz.\n\n',
                        ),
                        TextSpan(
                          text: '4. Fazla Ürünleri Değerlendirmek\n',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: 'Satılamayan ürünleri indirimli fiyatlarla sunarak israfı önlüyoruz.',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: context.sized.height * 0.4,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/israf/foods.webp'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: context.sized.height * 0.1),
        ],
      ),
    );
  }
}
