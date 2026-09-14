import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_radii.dart';
import '../../../../core/theme/app_text_styles.dart';

/// Header pill and escrow verification badge for milestone disbursement.
class MilestoneDisbursementHeader extends StatelessWidget {
  final String milestoneLabel;

  const MilestoneDisbursementHeader({
    super.key,
    this.milestoneLabel = 'MILESTONE #2 DISBURSEMENT',
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: const BoxDecoration(
            color: AppColors.indigoLight,
            borderRadius: AppRadii.roundedXs,
          ),
          child: Text(
            milestoneLabel,
            style: AppTextStyles.caption.copyWith(
              color: AppColors.indigo,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.5,
            ),
          ),
        ),
        Row(
          children: [
            const Icon(
              Icons.shield_outlined,
              size: 14,
              color: AppColors.emeraldDark,
            ),
            const SizedBox(width: 4),
            Text(
              'Escrow Verified',
              style: AppTextStyles.caption.copyWith(
                color: AppColors.emeraldDark,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
