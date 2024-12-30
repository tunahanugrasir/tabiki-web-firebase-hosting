import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';

class TabletWasteStatisticsSection extends StatelessWidget {
  const TabletWasteStatisticsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: context.sized.height * 0.06, horizontal: context.sized.width * 0.04),
      decoration: const BoxDecoration(color: Colors.white),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Gıda İsrafının Etkileri',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: context.sized.width * 0.04,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: context.sized.height * 0.02),
            Text(
              'Her yıl milyonlarca ton gıda israf ediliyor',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: context.sized.width * 0.02,
                color: Colors.black54,
              ),
            ),
            SizedBox(height: context.sized.height * 0.04),
            LayoutBuilder(
              builder: (context, constraints) {
                final isNarrow = constraints.maxWidth < 600;
                return Wrap(
                  spacing: context.sized.width * 0.03,
                  runSpacing: context.sized.height * 0.02,
                  alignment: WrapAlignment.center,
                  children: [
                    _buildStatisticCard(
                      context: context,
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
                      maxWidth: isNarrow ? constraints.maxWidth : constraints.maxWidth * 0.45,
                    ),
                    _buildStatisticCard(
                      context: context,
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
                      maxWidth: isNarrow ? constraints.maxWidth : constraints.maxWidth * 0.45,
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatisticCard({
    required BuildContext context,
    required String title,
    required List<StatItem> stats,
    required Color color,
    required double maxWidth,
  }) {
    return Container(
      constraints: BoxConstraints(maxWidth: maxWidth),
      padding: EdgeInsets.all(maxWidth * 0.04),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: color.withValues(alpha: 0.1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.all(maxWidth * 0.03),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: maxWidth * 0.05,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ),
          SizedBox(height: maxWidth * 0.04),
          ...stats.map((stat) => _buildStatItem(stat, color, maxWidth)),
        ],
      ),
    );
  }

  Widget _buildStatItem(StatItem stat, Color color, double maxWidth) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: maxWidth * 0.02),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(maxWidth * 0.02),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              stat.icon,
              color: color,
              size: maxWidth * 0.06,
            ),
          ),
          SizedBox(width: maxWidth * 0.03),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  stat.value,
                  style: GoogleFonts.poppins(
                    fontSize: maxWidth * 0.06,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                Text(
                  stat.description,
                  style: GoogleFonts.poppins(
                    fontSize: maxWidth * 0.035,
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
