import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_radii.dart';
import '../../../../core/theme/app_text_styles.dart';

/// Reel gradient thumbnail and link header for telemetry audits.
class TelemetryReelHeader extends StatelessWidget {
  final String title;
  final String reelUrl;

  const TelemetryReelHeader({
    super.key,
    required this.title,
    required this.reelUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 36,
          height: 36,
          decoration: const BoxDecoration(
            gradient: AppColors.instagramGradient,
            borderRadius: AppRadii.roundedSm,
          ),
          child: const Center(
            child: Icon(
              Icons.play_arrow_rounded,
              color: AppColors.textWhite,
              size: 20,
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppTextStyles.bodySmall.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),
              Text(
                reelUrl,
                style: AppTextStyles.caption.copyWith(color: AppColors.indigo),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
