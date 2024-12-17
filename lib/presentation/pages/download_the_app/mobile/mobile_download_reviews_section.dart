import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

final List<Map<String, dynamic>> _reviews = [
  {
    'name': 'Nilhan N.',
    'location': 'Antalya',
    'review':
        'Canlı destek ekibi gerçekten harika😍 Her soruma anında yanıt alıyorum. Siparişlerimle ilgili en ufak endişem olduğunda bile 7/24 ulaşabiliyorum. Bu kadar değer verildiğini hissettiren başka bir platform yok.',
    'rating': 5.0,
    'image': 'assets/images/profile4.jpg',
    'favorite_products': ['Çilek'],
  },
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
];

Widget mobileDownloadReviewsSection(BuildContext context) {
  return Container(
    padding: const EdgeInsets.symmetric(
      horizontal: 24,
      vertical: 40,
    ),
    decoration: BoxDecoration(
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          blurRadius: 20,
          offset: const Offset(0, -10),
        ),
      ],
    ),
    child: Column(
      children: [
        Text(
          "Mutlu Müşterilerimiz",
          textAlign: TextAlign.center,
          style: GoogleFonts.merriweather(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF065F46),
          ),
        ).animate().fadeIn(),
        const SizedBox(height: 12),
        Text(
          "Binlerce müşterimizin tabiki deneyimi",
          textAlign: TextAlign.center,
          style: GoogleFonts.merriweather(
            fontSize: 16,
            color: const Color(0xFF065F46).withOpacity(0.8),
          ),
        ).animate().fadeIn(delay: 200.ms),
        const SizedBox(height: 32),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: _reviews.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: _buildReviewCard(context, _reviews[index]),
          ),
        ),
        const SizedBox(height: 32),
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color(0xFF059669),
              width: 2,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.star_rounded,
                    color: Color(0xFF059669),
                    size: 24,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    "4.9 / 5.0",
                    style: GoogleFonts.merriweather(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF059669),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                "10.000+ mutlu müşteri",
                style: GoogleFonts.merriweather(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF059669),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget _buildReviewCard(BuildContext context, Map<String, dynamic> review) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
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
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: const Color(0xFF059669),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Center(
                child: Text(
                  review['name'].toString().split(' ')[0][0],
                  style: GoogleFonts.merriweather(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    review['name'],
                    style: GoogleFonts.merriweather(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF065F46),
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        size: 14,
                        color: const Color(0xFF065F46).withOpacity(0.6),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        review['location'],
                        style: GoogleFonts.merriweather(
                          fontSize: 12,
                          color: const Color(0xFF065F46).withOpacity(0.6),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: List.generate(
            5,
            (index) => Padding(
              padding: const EdgeInsets.only(right: 4),
              child: Icon(
                Icons.star_rounded,
                size: 16,
                color: index < review['rating'] ? const Color(0xFFFBBF24) : const Color(0xFFFBBF24).withOpacity(0.2),
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          review['review'],
          style: GoogleFonts.merriweather(
            fontSize: 14,
            color: const Color(0xFF065F46).withOpacity(0.8),
            height: 1.6,
          ),
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: const Color(0xFF34D399).withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "En Sevdiği Ürünler",
                style: GoogleFonts.merriweather(
                  fontSize: 12,
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
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      product,
                      style: GoogleFonts.merriweather(
                        fontSize: 11,
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
