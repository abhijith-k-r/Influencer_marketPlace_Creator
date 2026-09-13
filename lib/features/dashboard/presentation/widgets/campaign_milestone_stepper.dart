import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/theme/app_colors.dart';
import 'campaign_action_buttons.dart';

/// Milestone progress bar, stage markers, and action buttons.
class CampaignMilestoneStepper extends StatelessWidget {
  const CampaignMilestoneStepper({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Milestone: Reels Concept Draft',
              style: GoogleFonts.plusJakartaSans(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
            Text(
              '66%',
              style: GoogleFonts.plusJakartaSans(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: AppColors.primary,
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        Container(
          height: 8,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.inputBackground,
            borderRadius: BorderRadius.circular(999),
          ),
          alignment: Alignment.centerLeft,
          child: FractionallySizedBox(
            widthFactor: 0.6666,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(999),
              ),
            ),
          ),
        ),
        const SizedBox(height: 6),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildStageText('Brief Approved ✓', false),
            _buildStageText('Draft Submitted', true),
            _buildStageText('Final Reel Post', false),
          ],
        ),
        const SizedBox(height: 14),
        const CampaignActionButtons(),
      ],
    );
  }

  Widget _buildStageText(String label, bool isCurrent) {
    return Text(
      label,
      style: GoogleFonts.plusJakartaSans(
        fontSize: 10,
        fontWeight: isCurrent ? FontWeight.w700 : FontWeight.w500,
        color: isCurrent ? AppColors.primary : AppColors.textSecondary,
      ),
    );
  }
}
