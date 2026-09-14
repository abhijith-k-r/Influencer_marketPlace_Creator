import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_radii.dart';
import '../../../../core/theme/app_text_styles.dart';

/// Top header for escrow card with "100% Fully Funded" badge and lock status.
class EscrowFundingHeader extends StatelessWidget {
  const EscrowFundingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            color: AppColors.surfaceWhite.withValues(alpha: 0.15),
            borderRadius: AppRadii.roundedPill,
            border: Border.all(
              color: AppColors.surfaceWhite.withValues(alpha: 0.25),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 7,
                height: 7,
                decoration: const BoxDecoration(
                  color: AppColors.emerald,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 6),
              Text(
                '100% FULLY FUNDED',
                style: AppTextStyles.liveBadge.copyWith(
                  color: AppColors.textWhite,
                ),
              ),
            ],
          ),
        ),
        Row(
          children: [
            Icon(
              Icons.lock_outline_rounded,
              color: AppColors.textWhite.withValues(alpha: 0.7),
              size: 14,
            ),
            const SizedBox(width: 4),
            Text(
              'Lumina Escrow',
              style: AppTextStyles.caption.copyWith(
                color: AppColors.textWhite.withValues(alpha: 0.7),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
