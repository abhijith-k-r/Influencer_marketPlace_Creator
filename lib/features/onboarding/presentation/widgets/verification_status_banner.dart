import 'package:flutter/material.dart';
import 'package:creator_side/core/theme/app_colors.dart';
import 'package:creator_side/core/theme/app_radii.dart';
import 'verification_status_header_row.dart';
import 'verification_status_progress_bar.dart';

/// Status banner card displaying 'Under Review' and 85% completed progress.
class VerificationStatusBanner extends StatelessWidget {
  const VerificationStatusBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.pillBackground.withValues(alpha: 0.35),
        borderRadius: AppRadii.roundedCard,
      ),
      child: const Column(
        children: [
          VerificationStatusHeaderRow(),
          SizedBox(height: 14),
          VerificationStatusProgressBar(),
        ],
      ),
    );
  }
}
