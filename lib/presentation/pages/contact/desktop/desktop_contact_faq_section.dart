import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';

final List<Map<String, dynamic>> _faqCategories = [
  {
    'title': 'Sipariş ve Teslimat',
    'items': [
      {
        'question': 'Siparişlerimi ne kadar sürede teslim ediyorsunuz?',
        'answer':
            'Siparişlerinizi genellikle aynı gün içinde hazırlayıp, belirttiğiniz teslimat zaman diliminde adresinize ulaştırıyoruz. Teslimat planlamamız, sipariş yoğunluğuna ve konumunuza göre optimize edilmiştir.',
      },
      {
        'question': 'Hangi bölgelerde hizmet veriyorsunuz?',
        'answer': 'Şu anda Fethiye ve çevresinde aktif olarak hizmet sunuyoruz. Yakında daha fazla bölgede faaliyet göstermeyi planlıyoruz!',
      },
      {
        'question': 'Teslimat ücretiniz var mı?',
        'answer': 'Teslimat ücreti, sipariş tutarına ve teslimat bölgesine bağlı olarak değişmektedir. 800 TL üzeri siparişlerde ücretsiz teslimat sunuyoruz.',
      },
    ],
  },
  {
    'title': 'Ürünler',
    'items': [
      {
        'question': 'Ürünlerinizin kaynağı nedir?',
        'answer': 'Ürünlerimiz, doğrudan yerel çiftçilerden temin edilmektedir. Tüm ürünler taze, doğal ve kaliteli olarak sizlere sunulmaktadır.',
      },
      {
        'question': 'Stokta olmayan bir ürün için ne yapmalıyım?',
        'answer': 'Stokta olmayan ürünler için "Haberdar Et" seçeneğini kullanabilirsiniz. Ürün stoklarımıza yeniden eklendiğinde size bilgi vereceğiz.',
      },
      {
        'question': 'Ürünleriniz organik mi?',
        'answer': 'Evet, ürünlerimizin büyük bir kısmı organik sertifikalıdır. Her ürünün detay sayfasında bu bilgiye ulaşabilirsiniz.',
      },
    ],
  },
  {
    'title': 'Üyelik ve Hesap',
    'items': [
      {
        'question': 'Üyelik ücretli mi?',
        'answer': 'Hayır, üyelik tamamen ücretsizdir. Hemen üye olarak avantajlardan yararlanabilirsiniz.',
      },
      {
        'question': 'Şifremi unuttum, ne yapabilirim?',
        'answer': 'Şifrenizi unuttuysanız, giriş sayfasında bulunan "Şifremi Unuttum" seçeneğini kullanarak yeni bir şifre oluşturabilirsiniz.',
      },
      {
        'question': 'Üyelik bilgilerini nasıl güncelleyebilirim?',
        'answer': 'Profil sayfanıza giderek adres, telefon numarası gibi bilgilerinizi kolayca güncelleyebilirsiniz.',
      },
    ],
  },
  {
    'title': 'Ödeme',
    'items': [
      {
        'question': 'Hangi ödeme yöntemlerini kabul ediyorsunuz?',
        'answer': 'Kredi kartı, banka kartı ve kapıda ödeme seçenekleri ile ödeme yapabilirsiniz. Ödeme işlemleriniz güvenli ödeme altyapımız tarafından korunur.',
      },
      {
        'question': 'Fatura bilgilerimi nasıl alabilirim?',
        'answer': 'Fatura bilgileriniz, sipariş tamamlandığında e-posta adresinize gönderilmektedir. Ayrıca "Hesabım" sekmesinden faturalarınıza ulaşabilirsiniz.',
      },
    ],
  },
  {
    'title': 'İade ve Değişim',
    'items': [
      {
        'question': 'Teslimat sırasında ürünlerim kusurlu çıkarsa ne yapmalıyım?',
        'answer':
            'Teslimat sırasında bir ürünün kusurlu olduğunu fark ederseniz, teslimat görevlisine bildirerek değişim talep edebilirsiniz. Ayrıca bizimle iletişime geçerek durumu bildirmeniz yeterlidir.',
      },
      {
        'question': 'Ürün iadesi yapabilir miyim?',
        'answer': 'Evet, kullanılmamış ve zarar görmüş ürünleri teslimat tarihinden itibaren 24 saat içinde iade edebilirsiniz.',
      },
    ],
  },
  {
    'title': 'Diğer Sorular',
    'items': [
      {
        'question': 'Kurumsal müşterilere özel hizmet sunuyor musunuz?',
        'answer': 'Evet, restoranlar, oteller ve diğer kurumsal müşteriler için özel fiyatlandırma ve teslimat hizmetlerimiz bulunmaktadır. Daha fazla bilgi için bizimle iletişime geçebilirsiniz.',
      },
      {
        'question': 'İletişim bilgilerinize nasıl ulaşabilirim?',
        'answer': 'Bize +90 (216) 123 45 67 numaralı telefondan, destek@tabiki.co adresinden veya web sitemizdeki iletişim formu aracılığıyla ulaşabilirsiniz.',
      },
       {
        'question': 'Hesabımı nasıl silebilirim?',
        'answer': 'Hesabınızı silmek için destek@tabiki.co adresine hesap silme talebinizi iletebilirsiniz. Ekibimiz en kısa sürede size yardımcı olacaktır.',
      },
      {
        'question': 'Hesap silme işlemi ne kadar sürer?',
        'answer': 'Hesap silme talebiniz alındıktan sonra, işlem genellikle 24-48 saat içinde tamamlanır. Tüm verileriniz KVKK kapsamında güvenli bir şekilde silinecektir.',
      },
    ],
  },
];
Widget buildFAQSection(BuildContext context) {
  return Container(
    padding: EdgeInsets.symmetric(
      horizontal: context.sized.width * 0.1,
      vertical: 80,
    ),
    child: Column(
      children: [
        Text(
          "Sıkça Sorulan Sorular (SSS)",
          style: GoogleFonts.merriweather(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF065F46),
          ),
        ),
        const SizedBox(height: 48),
        ..._faqCategories.map((category) => _buildFAQCategory(context, category)),
      ],
    ),
  );
}

Widget _buildFAQCategory(BuildContext context, Map<String, dynamic> category) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Text(
          category['title'] as String,
          style: GoogleFonts.merriweather(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF065F46),
          ),
        ),
      ),
      Wrap(
        spacing: 32,
        runSpacing: 32,
        children: (category['items'] as List<Map<String, dynamic>>).map((item) => _buildFAQCard(context, item)).toList(),
      ),
    ],
  );
}

Widget _buildFAQCard(BuildContext context, Map<String, dynamic> item) {
  return Container(
    width: context.sized.width * 0.4,
    padding: const EdgeInsets.all(32),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.1),
          blurRadius: 20,
          offset: const Offset(0, 10),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: const Color(0xFF34D399).withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(
                Icons.help_outline_rounded,
                color: Color(0xFF059669),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                item['question'] as String,
                style: GoogleFonts.merriweather(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF065F46),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Text(
          item['answer'] as String,
          style: GoogleFonts.merriweather(
            fontSize: 16,
            color: const Color(0xFF065F46).withValues(alpha: 0.8),
            height: 1.6,
          ),
        ),
      ],
    ),
  ).animate().scale();
}
