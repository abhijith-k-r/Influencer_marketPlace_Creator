import 'package:flutter/material.dart';
import 'package:creator_side/core/theme/app_radii.dart';
import 'package:creator_side/core/theme/app_text_styles.dart';
import 'package:creator_side/core/theme/creator_colors.dart';

class CreatorOpportunityActionRow extends StatelessWidget {
  final VoidCallback onDetailsTap;
  final VoidCallback onApplyTap;

  const CreatorOpportunityActionRow({
    super.key,
    required this.onDetailsTap,
    required this.onApplyTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton(
            onPressed: onDetailsTap,
            style: OutlinedButton.styleFrom(
              foregroundColor: CreatorColors.onSurface,
              side: BorderSide(color: CreatorColors.outlineVariant.withValues(alpha: 0.6)),
              shape: const RoundedRectangleBorder(borderRadius: AppRadii.roundedMd),
              padding: const EdgeInsets.symmetric(vertical: 10),
            ),
            child: Text(
              'View Brief',
              style: AppTextStyles.labelMd(color: CreatorColors.onSurface).copyWith(fontWeight: FontWeight.w600),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: ElevatedButton(
            onPressed: onApplyTap,
            style: ElevatedButton.styleFrom(
              backgroundColor: CreatorColors.primary,
              foregroundColor: CreatorColors.onPrimary,
              elevation: 0,
              shape: const RoundedRectangleBorder(borderRadius: AppRadii.roundedMd),
              padding: const EdgeInsets.symmetric(vertical: 10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Apply Now',
                  style: AppTextStyles.labelMd(color: CreatorColors.onPrimary).copyWith(fontWeight: FontWeight.w700),
                ),
                const SizedBox(width: 4),
                const Icon(Icons.arrow_forward_rounded, size: 16, color: CreatorColors.onPrimary),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
