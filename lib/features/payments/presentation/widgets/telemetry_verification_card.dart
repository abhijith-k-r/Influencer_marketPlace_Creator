import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_radii.dart';
import '../../../../core/theme/app_text_styles.dart';
import 'telemetry_reel_progress_box.dart';

/// Live telemetry audit card showing Meta Graph API verification.
class TelemetryVerificationCard extends StatelessWidget {
  const TelemetryVerificationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surfaceWhite,
        borderRadius: AppRadii.roundedLg,
        border: Border.all(color: AppColors.borderLight),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: const BoxDecoration(
                  color: AppColors.emeraldLight,
                  borderRadius: AppRadii.roundedSm,
                ),
                child: const Icon(
                  Icons.verified_rounded,
                  color: AppColors.emeraldDark,
                  size: 18,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Live Telemetry Audit', style: AppTextStyles.h4),
                    Text(
                      'Verified via Meta Graph API',
                      style: AppTextStyles.caption.copyWith(
                        color: AppColors.textTertiary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          const TelemetryReelProgressBox(),
        ],
      ),
    );
  }
}
