import 'package:flutter/material.dart';
import 'package:creator_side/core/theme/app_colors.dart';
import 'package:creator_side/core/theme/app_radii.dart';
import 'package:creator_side/core/theme/app_text_styles.dart';
import 'verification_status_badge.dart';

/// Top header row of status banner card with spinning badge and current status.
class VerificationStatusHeaderRow extends StatelessWidget {
  const VerificationStatusHeaderRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Row(
            children: [
              const VerificationStatusBadge(),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            'CURRENT STATUS',
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyles.brandPill.copyWith(
                              fontSize: 10,
                              letterSpacing: 0.55,
                              color: AppColors.primary,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        const SizedBox(width: 6),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.primary.withValues(alpha: 0.1),
                            borderRadius: AppRadii.roundedPill,
                          ),
                          child: Text(
                            'Reviewing',
                            style: AppTextStyles.brandPill.copyWith(
                              fontSize: 10,
                              color: AppColors.primary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'Profile verification in progress',
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.fieldLabel.copyWith(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: const BoxDecoration(
            color: AppColors.surfaceWhite,
            borderRadius: AppRadii.roundedPill,
          ),
          child: Text(
            'Step 4 of 4',
            style: AppTextStyles.brandPill.copyWith(
              fontSize: 11,
              color: AppColors.primary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
