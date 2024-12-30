import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tabiki_web/presentation/pages/widgets/mobile/mobile_app_bar.dart';
import 'package:tabiki_web/presentation/pages/widgets/mobile/mobile_footer.dart';
import 'package:lottie/lottie.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:tabiki_web/presentation/pages/widgets/mobile/mobile_layout_drawer.dart';

class MobileContactPage extends StatefulWidget {
  const MobileContactPage({super.key});

  @override
  State<MobileContactPage> createState() => _MobileContactPageState();
}

class _MobileContactPageState extends State<MobileContactPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _messageController = TextEditingController();
  bool _isSubmitting = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: MobileAppBar(),
      ),
      drawer: const MobileDrawer(),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFF0FDF4),
              Color(0xFFDCFCE7),
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildHeroSection(),
              _buildContactSection(),
              _buildContactForm(),
              _buildFAQSection(),
              const MobileFooter(
                backgroundColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeroSection() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xFF34D399).withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Text(
              "İletişim",
              style: GoogleFonts.merriweather(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF059669),
              ),
            ),
          ).animate().fadeIn(duration: 600.ms).slideX(),
          const SizedBox(height: 16),
          Text(
            "Size Nasıl\nYardımcı Olabiliriz?",
            textAlign: TextAlign.center,
            style: GoogleFonts.merriweather(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF065F46),
              height: 1.2,
            ),
          ).animate().fadeIn(delay: 200.ms).slideX(),
          const SizedBox(height: 16),
          Text(
            "Sorularınız için bize ulaşabilir, önerilerinizi paylaşabilirsiniz.",
            textAlign: TextAlign.center,
            style: GoogleFonts.merriweather(
              fontSize: 16,
              color: const Color(0xFF065F46).withValues(alpha: 0.8),
              height: 1.6,
            ),
          ).animate().fadeIn(delay: 400.ms).slideX(),
        ],
      ),
    );
  }

  Widget _buildContactSection() {
    final contactMethods = [
      {
        'icon': Icons.phone_rounded,
        'title': 'Telefon',
        'content': '+90 (530) 697 89 70',
        'action': 'tel:+905306978970',
      },
      {
        'icon': Icons.mail_rounded,
        'title': 'E-posta',
        'content': 'destek@tabiki.co',
        'action': 'mailto:destek@tabiki.co',
      },
      {
        'icon': Icons.location_on_rounded,
        'title': 'Adres',
        'content': 'Cumhuriyet, 500. Sk., 48300\nFethiye/Muğla',
        'action': 'https://maps.google.com/?q=36.623524,29.114460',
      },
      {
        'icon': Icons.access_time_rounded,
        'title': 'Çalışma Saatleri',
        'content': 'Hafta içi: 09:00 - 18:00\nHafta sonu: 10:00 - 17:00',
      },
    ];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
      child: Column(
        children: contactMethods.map((method) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: _buildContactCard(method),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildContactCard(Map<String, dynamic> method) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
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
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFF34D399).withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  method['icon'] as IconData,
                  color: const Color(0xFF059669),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      method['title'] as String,
                      style: GoogleFonts.merriweather(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF065F46),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      method['content'] as String,
                      style: GoogleFonts.merriweather(
                        fontSize: 14,
                        color: const Color(0xFF065F46).withValues(alpha: 0.8),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    ).animate().scale();
  }

  Widget _buildContactForm() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Bize Ulaşın",
            style: GoogleFonts.merriweather(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF065F46),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            "Formu doldurarak bize mesaj gönderebilirsiniz. En kısa sürede size dönüş yapacağız.",
            style: GoogleFonts.merriweather(
              fontSize: 16,
              color: const Color(0xFF065F46).withValues(alpha: 0.8),
              height: 1.6,
            ),
          ),
          const SizedBox(height: 24),
          Center(
            child: Lottie.asset(
              'assets/lottie/lottie-1.json',
              height: 200,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 32),
          Form(
            key: _formKey,
            child: Column(
              children: [
                _buildTextField(
                  controller: _nameController,
                  label: 'Ad Soyad',
                  icon: Icons.person_rounded,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Lütfen adınızı ve soyadınızı girin';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                _buildTextField(
                  controller: _emailController,
                  label: 'E-posta',
                  icon: Icons.mail_rounded,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Lütfen e-posta adresinizi girin';
                    }
                    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                      return 'Lütfen geçerli bir e-posta adresi girin';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                _buildTextField(
                  controller: _phoneController,
                  label: 'Telefon',
                  icon: Icons.phone_rounded,
                  keyboardType: TextInputType.phone,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(10),
                    _PhoneNumberFormatter(),
                  ],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Lütfen telefon numaranızı girin';
                    }
                    if (value.replaceAll(RegExp(r'[^0-9]'), '').length < 10) {
                      return 'Lütfen geçerli bir telefon numarası girin';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                _buildTextField(
                  controller: _messageController,
                  label: 'Mesajınız',
                  icon: Icons.message_rounded,
                  maxLines: 5,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Lütfen mesajınızı girin';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: _isSubmitting ? null : _submitForm,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF059669),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: _isSubmitting
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 2,
                            ),
                          )
                        : Text(
                            'Gönder',
                            style: GoogleFonts.merriweather(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
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

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    int maxLines = 1,
    String? Function(String?)? validator,
    TextInputType? keyboardType,
    List<TextInputFormatter>? inputFormatters,
  }) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      validator: validator,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      style: GoogleFonts.merriweather(
        fontSize: 16,
        color: const Color(0xFF065F46),
      ),
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: const Color(0xFF059669)),
        labelStyle: GoogleFonts.merriweather(
          color: const Color(0xFF065F46).withValues(alpha: 0.8),
          fontSize: 16,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFF34D399)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFF059669), width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.red, width: 2),
        ),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }

  Widget _buildFAQSection() {
    final faqItems = [
      {
        'question': 'Siparişlerimi ne kadar sürede teslim ediyorsunuz?',
        'answer':
            'Siparişlerinizi genellikle aynı gün içinde hazırlayıp, belirttiğiniz teslimat zaman diliminde adresinize ulaştırıyoruz. Teslimat planlamamız, sipariş yoğunluğuna ve konumunuza göre optimize edilmiştir.',
      },
      {
        'question': 'Hangi bölgelerde hizmet veriyorsunuz?',
        'answer': 'Şu anda Muğla ve çevresinde aktif olarak hizmet sunuyoruz. Yakında daha fazla bölgede faaliyet göstermeyi planlıyoruz!',
      },
      {
        'question': 'Teslimat ücretiniz var mı?',
        'answer': 'Teslimat ücreti, sipariş tutarına ve teslimat bölgesine bağlı olarak değişmektedir. 800 TL üzeri siparişlerde ücretsiz teslimat sunuyoruz.',
      },
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
      {
        'question': 'Üyelik ücretli mi?',
        'answer': 'Hayır, üyelik tamamen ücretsizdir. Hemen üye olarak avantajlardan yararlanabilirsiniz.',
      },
      {
        'question': 'Hangi ödeme yöntemlerini kabul ediyorsunuz?',
        'answer': 'Kredi kartı, banka kartı ve kapıda ödeme seçenekleri ile ödeme yapabilirsiniz. Ödeme işlemleriniz güvenli ödeme altyapımız tarafından korunur.',
      },
      {
        'question': 'İade ve değişim politikanız nedir?',
        'answer': 'Ürünlerinizi teslim aldığınız anda kontrol edebilir, herhangi bir sorun durumunda anında iade/değişim talep edebilirsiniz. Taze ürünlerde 24 saat içinde iade/değişim yapılabilir.',
      },
    ];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
      child: Column(
        children: [
          Text(
            "Sıkça Sorulan Sorular (SSS)",
            style: GoogleFonts.merriweather(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF065F46),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          ...faqItems.map((item) => _buildFAQItem(
                item['question'] as String,
                item['answer'] as String,
              )),
        ],
      ),
    );
  }

  Widget _buildFAQItem(String question, String answer) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
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
      child: Theme(
        data: Theme.of(context).copyWith(
          dividerColor: Colors.transparent,
        ),
        child: ExpansionTile(
          tilePadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          title: Text(
            question,
            style: GoogleFonts.merriweather(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF065F46),
            ),
          ),
          iconColor: const Color(0xFF059669),
          collapsedIconColor: const Color(0xFF059669),
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                bottom: 20,
              ),
              child: Text(
                answer,
                style: GoogleFonts.merriweather(
                  fontSize: 14,
                  color: const Color(0xFF065F46).withValues(alpha: 0.8),
                  height: 1.6,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _submitForm() async {
    if (!mounted) return;
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isSubmitting = true;
    });

    try {
      final response = await http.post(
        Uri.parse('https://formspree.io/f/mpwzglrk'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode({
          'name': _nameController.text,
          'email': _emailController.text,
          'phone': _phoneController.text,
          'message': _messageController.text,
        }),
      );

      if (response.statusCode == 200) {
        if (!mounted) return;
        _showSuccessDialog();
        _formKey.currentState!.reset();
        _nameController.clear();
        _emailController.clear();
        _phoneController.clear();
        _messageController.clear();
      } else {
        throw 'Form gönderilemedi';
      }
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Bir hata oluştu. Lütfen tekrar deneyin.',
            style: GoogleFonts.merriweather(),
          ),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      if (!mounted) {}
      setState(() {
        _isSubmitting = false;
      });
    }
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFF34D399).withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.check_circle_outline_rounded,
                  color: Color(0xFF059669),
                  size: 48,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'Mesajınız Alındı',
                style: GoogleFonts.merriweather(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF065F46),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'En kısa sürede size dönüş yapacağız.',
                textAlign: TextAlign.center,
                style: GoogleFonts.merriweather(
                  fontSize: 14,
                  color: const Color(0xFF065F46).withValues(alpha: 0.8),
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF059669),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Tamam',
                    style: GoogleFonts.merriweather(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PhoneNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final text = newValue.text;
    if (text.isEmpty) return newValue;

    final buffer = StringBuffer();
    final digits = text.replaceAll(RegExp(r'[^0-9]'), '');

    for (int i = 0; i < digits.length && i < 10; i++) {
      if (i == 0) buffer.write('(');
      buffer.write(digits[i]);
      if (i == 2) buffer.write(') ');
      if (i == 5) buffer.write(' ');
      if (i == 7) buffer.write(' ');
    }

    final string = buffer.toString();
    return newValue.copyWith(
      text: string,
      selection: TextSelection.collapsed(offset: string.length),
    );
  }
}
