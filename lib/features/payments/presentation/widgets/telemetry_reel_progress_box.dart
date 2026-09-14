import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_radii.dart';
import '../../../../core/theme/app_text_styles.dart';
import 'telemetry_reel_header.dart';

/// Reel verification metrics preview with progress indicator and target reach.
class TelemetryReelProgressBox extends StatelessWidget {
  final String title;
  final String reelUrl;
  final String views;
  final String targetReached;
  final double progress;

  const TelemetryReelProgressBox({
    super.key,
    this.title = 'Sony WH-1000XM5 Review Reel',
    this.reelUrl = 'instagram.com/reel/Cx94b2...',
    this.views = '54,320 Views',
    this.targetReached = '108% Target Reached',
    this.progress = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.scaffoldBackground,
        borderRadius: AppRadii.roundedMd,
        border: Border.all(color: AppColors.borderLight),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TelemetryReelHeader(title: title, reelUrl: reelUrl),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                views,
                style: AppTextStyles.bodySmall.copyWith(
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: const BoxDecoration(
                  color: AppColors.emeraldLight,
                  borderRadius: AppRadii.roundedXs,
                ),
                child: Text(
                  targetReached,
                  style: AppTextStyles.caption.copyWith(
                    color: AppColors.emeraldDark,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          ClipRRect(
            borderRadius: BorderRadius.circular(3),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 6,
              backgroundColor: AppColors.borderLight,
              valueColor: const AlwaysStoppedAnimation(AppColors.emerald),
            ),
          ),
        ],
      ),
    );
  }
}
