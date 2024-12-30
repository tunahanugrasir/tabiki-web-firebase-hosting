import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';
import 'package:tabiki_web/presentation/pages/contact/tablet/tablet_contact_faq_section.dart';
import 'package:tabiki_web/presentation/pages/contact/tablet/tablet_contact_form_section.dart';
import 'package:tabiki_web/presentation/pages/contact/tablet/tablet_contact_hero_section.dart';
import 'package:tabiki_web/presentation/pages/contact/tablet/tablet_contact_section.dart';
import 'package:tabiki_web/presentation/pages/home/tablet/tablet_home_page_footer.dart';
import 'package:tabiki_web/presentation/pages/home/tablet/tablet_page_header.dart';

class TabletContactPage extends StatefulWidget {
  const TabletContactPage({super.key});

  @override
  State<TabletContactPage> createState() => _TabletContactPageState();
}

class _TabletContactPageState extends State<TabletContactPage> {
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
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: context.sized.width * 0.1,
                  vertical: context.sized.height * 0.05,
                ),
                child: const TabletPageHeader(),
              ),
              tabletContactHeroSection(context),
              tabletBuildContactSection(context),
              tabletBuildContactFormSection(context, _formKey, _nameController, _emailController, _phoneController, _messageController, _isSubmitting, _submitForm),
              tabletBuildFAQSection(context),
              const TabletHomePageFooter(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFFF0FDF4),
                    Color(0xFFDCFCE7),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Container(
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
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF065F46),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'En kısa sürede size dönüş yapacağız.',
                textAlign: TextAlign.center,
                style: GoogleFonts.merriweather(
                  fontSize: 16,
                  color: const Color(0xFF065F46).withValues(alpha: 0.8),
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF059669),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 16,
                  ),
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
            ],
          ),
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
      // Form verilerini hazırla

      // Burada form verilerini backend'e gönderme işlemi yapılacak
      await Future.delayed(const Duration(seconds: 2)); // Simüle edilmiş API çağrısı

      if (!mounted) return;

      _showSuccessDialog();
      _formKey.currentState!.reset();
      _nameController.clear();
      _emailController.clear();
      _phoneController.clear();
      _messageController.clear();
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
}
