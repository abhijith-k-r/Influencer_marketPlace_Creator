import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/theme/app_colors.dart';
import 'earnings_chart_header.dart';

/// 6-month earnings bar chart showing monthly revenue performance.
class EarningsBarChart extends StatelessWidget {
  const EarningsBarChart({super.key});

  static const _bars = [
    ('JAN', 40.0, false),
    ('FEB', 50.0, false),
    ('MAR', 63.0, false),
    ('APR', 47.0, false),
    ('MAY', 71.0, false),
    ('JUN', 85.0, true),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const EarningsChartHeader(),
        const SizedBox(height: 16),
        SizedBox(
          height: 112,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: _bars.map(_buildBar).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildBar((String, double, bool) bar) {
    final (label, height, isCurrent) = bar;
    final color = isCurrent ? AppColors.primary : const Color(0xFFDCE9FF);
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 28,
          height: height,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          label,
          style: GoogleFonts.plusJakartaSans(
            fontSize: 10,
            fontWeight: isCurrent ? FontWeight.w700 : FontWeight.w500,
            color: isCurrent ? AppColors.primary : AppColors.textSecondary,
          ),
        ),
      ],
    );
  }
}
