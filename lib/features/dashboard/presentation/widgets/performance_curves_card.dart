import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/theme/app_colors.dart';
import 'earnings_bar_chart.dart';
import 'performance_curves_toggle.dart';
import 'reach_line_chart.dart';

/// Card housing Performance Curves title, toggle, and chart views.
class PerformanceCurvesCard extends StatefulWidget {
  const PerformanceCurvesCard({super.key});

  @override
  State<PerformanceCurvesCard> createState() => _PerformanceCurvesCardState();
}

class _PerformanceCurvesCardState extends State<PerformanceCurvesCard> {
  int _selectedTab = 0; // 0 = Earnings, 1 = Reach

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Performance Curves',
              style: GoogleFonts.plusJakartaSans(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimary,
              ),
            ),
            PerformanceCurvesToggle(
              selectedTab: _selectedTab,
              onTabChanged: (val) => setState(() => _selectedTab = val),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            color: AppColors.surfaceWhite,
            borderRadius: BorderRadius.circular(12),
            boxShadow: const [
              BoxShadow(
                color: Color(0x06000000),
                blurRadius: 6,
                offset: Offset(0, 1),
              ),
            ],
          ),
          padding: const EdgeInsets.all(16),
          child: _selectedTab == 0
              ? const EarningsBarChart()
              : const ReachLineChart(),
        ),
      ],
    );
  }
}
