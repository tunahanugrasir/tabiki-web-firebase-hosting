import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';
import 'package:lottie/lottie.dart';

Widget tabletBuildContactFormSection(BuildContext context, GlobalKey<FormState> formKey, TextEditingController nameController, TextEditingController emailController,
    TextEditingController phoneController, TextEditingController messageController, bool isSubmitting, Function() submitForm) {
  return Container(
    padding: EdgeInsets.symmetric(
      horizontal: context.sized.width * 0.1,
      vertical: 80,
    ),
    color: Colors.white,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 48.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Bize Ulaşın",
                  style: GoogleFonts.merriweather(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF065F46),
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  "Formu doldurarak bize mesaj gönderebilirsiniz. En kısa sürede size dönüş yapacağız.",
                  style: GoogleFonts.merriweather(
                    fontSize: 18,
                    color: const Color(0xFF065F46).withValues(alpha: 0.8),
                    height: 1.6,
                  ),
                ),
                const SizedBox(height: 48),
                Lottie.asset(
                  'assets/lottie/lottie-1.json',
                  height: 400,
                  fit: BoxFit.contain,
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                _buildTextField(
                  controller: nameController,
                  label: 'Ad Soyad',
                  icon: Icons.person_rounded,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Lütfen adınızı ve soyadınızı girin';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                _buildTextField(
                  controller: emailController,
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
                const SizedBox(height: 24),
                _buildTextField(
                  controller: phoneController,
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
                const SizedBox(height: 24),
                _buildTextField(
                  controller: messageController,
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
                const SizedBox(height: 32),
                SizedBox(
                  width: double.infinity,
                  height: 64,
                  child: ElevatedButton(
                    onPressed: isSubmitting ? null : submitForm,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF059669),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: isSubmitting
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
  return SizedBox(
    height: maxLines > 1 ? 160 : 64,
    child: TextFormField(
      controller: controller,
      maxLines: maxLines,
      validator: validator ??
          (value) {
            if (value == null || value.trim().isEmpty) {
              return 'Bu alan boş bırakılamaz';
            }
            return null;
          },
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      style: GoogleFonts.merriweather(
        fontSize: 16,
        color: const Color(0xFF065F46),
      ),
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Icon(icon, color: const Color(0xFF059669)),
        ),
        labelStyle: GoogleFonts.merriweather(
          color: const Color(0xFF065F46).withValues(alpha: 0.8),
          fontSize: 16,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
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
    ),
  );
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
