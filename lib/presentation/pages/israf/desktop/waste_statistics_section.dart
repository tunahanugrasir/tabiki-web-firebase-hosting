import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WasteStatisticsSection extends StatelessWidget {
  const WasteStatisticsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80),
      decoration: const BoxDecoration(color: Colors.white),
      child: Column(
        children: [
          Text(
            'Gıda İsrafının Etkileri',
            style: GoogleFonts.poppins(
              fontSize: 48,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Her yıl milyonlarca ton gıda israf ediliyor',
            style: GoogleFonts.poppins(
              fontSize: 20,
              color: Colors.black54,
            ),
          ),
          const SizedBox(height: 60),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildStatisticCard(
                  title: 'Dünya Genelinde',
                  stats: [
                    StatItem(
                      value: '%40-50',
                      description: 'İsraf Oranı',
                      icon: Icons.pie_chart,
                    ),
                    StatItem(
                      value: '680 Milyar \$',
                      description: 'Ekonomik Kayıp',
                      icon: Icons.attach_money,
                    ),
                    StatItem(
                      value: '1.3 Milyar Ton',
                      description: 'Karbon Salınımı',
                      icon: Icons.cloud,
                    ),
                  ],
                  color: const Color(0xFF4CAF50),
                ),
                const SizedBox(width: 30),
                _buildStatisticCard(
                  title: 'Türkiye\'de',
                  stats: [
                    StatItem(
                      value: '12 Milyon Ton',
                      description: 'Yıllık İsraf',
                      icon: Icons.delete_outline,
                    ),
                    StatItem(
                      value: '25 Milyar ₺',
                      description: 'Ekonomik Kayıp',
                      icon: Icons.currency_lira,
                    ),
                    StatItem(
                      value: '%53',
                      description: 'Tarladan Markete Kayıp',
                      icon: Icons.local_shipping,
                    ),
                  ],
                  color: const Color(0xFF2196F3),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatisticCard({
    required String title,
    required List<StatItem> stats,
    required Color color,
  }) {
    return Container(
      width: 400,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ),
          const SizedBox(height: 24),
          ...stats.map((stat) => _buildStatItem(stat, color)),
        ],
      ),
    );
  }

  Widget _buildStatItem(StatItem stat, Color color) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              stat.icon,
              color: color,
              size: 24,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  stat.value,
                  style: GoogleFonts.poppins(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                Text(
                  stat.description,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.black54,
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

class StatItem {
  final String value;
  final String description;
  final IconData icon;

  StatItem({
    required this.value,
    required this.description,
    required this.icon,
  });
}