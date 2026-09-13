import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:creator_side/core/theme/app_colors.dart';
import 'package:creator_side/core/theme/app_radii.dart';

/// Aggregated reach and live engagement statistics card matching Figma.
class ConnectedReachSummaryCard extends StatelessWidget {
  const ConnectedReachSummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: const BoxDecoration(
        color: AppColors.surfaceWhite,
        borderRadius: AppRadii.roundedCard,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Flexible(
              child: Text(
                'Total Verified Reach',
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 13.5, fontWeight: FontWeight.w600, color: AppColors.textSecondary,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              decoration: const BoxDecoration(
                color: Color(0xFFE8F5E9),
                borderRadius: AppRadii.roundedPill,
              ),
              child: Row(children: [
                Container(
                  width: 6, height: 6,
                  decoration: const BoxDecoration(color: AppColors.success, shape: BoxShape.circle),
                ),
                const SizedBox(width: 4),
                Text('LIVE SYNC', style: GoogleFonts.plusJakartaSans(
                  fontSize: 10, fontWeight: FontWeight.w700, color: AppColors.success,
                )),
              ]),
            ),
          ]),
          const SizedBox(height: 6),
          Text('231.4K', style: GoogleFonts.plusJakartaSans(
            fontSize: 26, fontWeight: FontWeight.w700, color: AppColors.textPrimary,
          )),
          const SizedBox(height: 6),
          Wrap(spacing: 6, runSpacing: 4, children: [
            _tag('YouTube: 142K'),
            _tag('Instagram: 89.4K'),
            _tag('Avg. 4.8% ER', isHighlight: true),
          ]),
        ],
      ),
    );
  }

  Widget _tag(String text, {bool isHighlight = false}) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
        decoration: BoxDecoration(
          color: isHighlight ? AppColors.trustBadgeBackground : AppColors.inputBackground,
          borderRadius: AppRadii.roundedPill,
        ),
        child: Text(text, style: GoogleFonts.plusJakartaSans(
          fontSize: 11,
          fontWeight: isHighlight ? FontWeight.w600 : FontWeight.w500,
          color: isHighlight ? AppColors.primary : AppColors.textSecondary,
        )),
      );
}
