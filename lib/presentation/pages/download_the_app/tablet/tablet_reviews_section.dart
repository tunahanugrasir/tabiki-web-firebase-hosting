import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';

final List<Map<String, dynamic>> _reviews = [
  {
    'name': 'Ayşe Y.',
    'location': 'Muğla',
    'review': 'Taze ürünler ve hızlı teslimat. Çok memnunum. Her hafta düzenli olarak alışveriş yapıyorum ve her seferinde aynı kaliteli hizmeti alıyorum.',
    'rating': 5.0,
    'image': 'assets/images/profile1.jpg',
    'favorite_products': ['Günlük Süt', 'Köy Peyniri'],
  },
  {
    'name': 'Mehmet K.',
    'location': 'Aydın',
    'review': 'Üreticilerle direkt iletişim kurabilmek harika. Ürünlerin nereden geldiğini bilmek ve üreticilerin hikayelerini okumak çok değerli.',
    'rating': 5,
    'image': 'assets/images/profile2.jpg',
    'favorite_products': ['Taze Sebzeler', 'Bal'],
  },
  {
    'name': 'Zeynep A.',
    'location': 'İzmir',
    'review': 'Ürün kalitesi ve fiyatlar çok iyi. Özellikle mevsimlik meyvelerin tadı ve tazeliği muhteşem. Aracı olmadan direkt üreticiden almak hem ekonomik hem de güvenilir.',
    'rating': 5,
    'image': 'assets/images/profile3.jpg',
    'favorite_products': ['Mevsim Meyveleri', 'Zeytinyağı'],
  },
  {
    'name': 'Nilhan N.',
    'location': 'Antalya',
    'review':
        'Canlı destek ekibi gerçekten harika😍 Her soruma anında yanıt alıyorum. Siparişlerimle ilgili en ufak endişem olduğunda bile 7/24 ulaşabiliyorum. Bu kadar değer verildiğini hissettiren başka bir platform yok.',
    'rating': 5.0,
    'image': 'assets/images/profile4.jpg',
    'favorite_products': ['Kurutulmuş Sebzeler', 'Çilek'],
  },
];
Widget tabletBuildReviewsSection(BuildContext context) {
  return Container(
    padding: EdgeInsets.symmetric(
      horizontal: context.sized.width * 0.1,
      vertical: 80,
    ),
    decoration: BoxDecoration(
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.05),
          blurRadius: 20,
          offset: const Offset(0, -10),
        ),
      ],
    ),
    child: Column(
      children: [
        Column(
          children: [
            Text(
              "Mutlu Müşterilerimiz",
              style: GoogleFonts.merriweather(
                fontSize: 42,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF065F46),
              ),
            ).animate().fadeIn(),
            const SizedBox(height: 16),
            Text(
              "Binlerce müşterimizin tabiki deneyimi",
              textAlign: TextAlign.center,
              style: GoogleFonts.merriweather(
                fontSize: 20,
                color: const Color(0xFF065F46).withValues(alpha: 0.8),
              ),
            ).animate().fadeIn(delay: 200.ms),
            const SizedBox(height: 64),
          ],
        ),
        Center(
          child: Wrap(
            spacing: 32,
            runSpacing: 32,
            alignment: WrapAlignment.center,
            children: [
              SizedBox(
                width: context.sized.width * 0.8,
                child: Wrap(
                  spacing: 32,
                  runSpacing: 32,
                  children: [
                    _buildReviewCard(context, _reviews[0]),
                    _buildReviewCard(context, _reviews[1]),
                  ],
                ),
              ),
              SizedBox(
                width: context.sized.width * 0.8,
                child: Wrap(
                  spacing: 32,
                  runSpacing: 32,
                  children: [
                    _buildReviewCard(context, _reviews[2]),
                    _buildReviewCard(context, _reviews[3]),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 48),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color(0xFF059669),
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(32),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.star_rounded,
                    color: Color(0xFF059669),
                    size: 24,
                  ),
                  const SizedBox(width: 12),
                  Text(
                    "4.9 / 5.0 ortalama puan",
                    style: GoogleFonts.merriweather(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF059669),
                    ),
                  ),
                  const SizedBox(width: 24),
                  Container(
                    width: 1,
                    height: 24,
                    color: const Color(0xFF059669).withValues(alpha: 0.2),
                  ),
                  const SizedBox(width: 24),
                  Text(
                    "10.000+ mutlu müşteri",
                    style: GoogleFonts.merriweather(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF059669),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget _buildReviewCard(BuildContext context, Map<String, dynamic> review) {
  return Container(
    width: context.sized.width * 0.38,
    height: 400,
    padding: const EdgeInsets.all(28),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(24),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.05),
          blurRadius: 20,
          offset: const Offset(0, 10),
          spreadRadius: 0,
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                color: const Color(0xFF059669),
                borderRadius: BorderRadius.circular(32),
              ),
              child: Center(
                child: Text(
                  review['name'].toString().split(' ')[0][0],
                  style: GoogleFonts.merriweather(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    review['name'],
                    style: GoogleFonts.merriweather(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF065F46),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        size: 16,
                        color: const Color(0xFF065F46).withValues(alpha: 0.6),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        review['location'],
                        style: GoogleFonts.merriweather(
                          fontSize: 14,
                          color: const Color(0xFF065F46).withValues(alpha: 0.6),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        Row(
          children: List.generate(
            5,
            (index) => Icon(
              Icons.star_rounded,
              size: 20,
              color: index < review['rating'] ? const Color(0xFFFBBF24) : const Color(0xFFFBBF24).withValues(alpha: 0.2),
            ),
          ),
        ),
        const SizedBox(height: 24),
        Expanded(
          child: Text(
            review['review'],
            style: GoogleFonts.merriweather(
              fontSize: 16,
              color: const Color(0xFF065F46).withValues(alpha: 0.8),
              height: 1.6,
            ),
          ),
        ),
        const SizedBox(height: 24),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFF34D399).withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "En Sevdiği Ürünler",
                style: GoogleFonts.merriweather(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF065F46),
                ),
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: (review['favorite_products'] as List<String>).map((product) {
                  return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      product,
                      style: GoogleFonts.merriweather(
                        fontSize: 12,
                        color: const Color(0xFF065F46),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ],
    ),
  ).animate().fadeIn().slideY(begin: 0.2);
}
