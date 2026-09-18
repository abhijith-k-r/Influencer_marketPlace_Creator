import 'package:flutter/material.dart';
import 'package:creator_side/core/theme/app_radii.dart';
import 'package:creator_side/core/theme/app_text_styles.dart';
import 'package:creator_side/core/theme/creator_colors.dart';

/// Bottom dual-button quick action triggers: Contact Brand & Withdraw.
class WorkDetailsActionBar extends StatelessWidget {
  final VoidCallback onContactBrand;
  final VoidCallback onWithdraw;

  const WorkDetailsActionBar({
    super.key,
    required this.onContactBrand,
    required this.onWithdraw,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 48,
            child: ElevatedButton.icon(
              onPressed: onContactBrand,
              icon: const Icon(Icons.chat_bubble_outline_rounded, size: 18),
              label: Text(
                'Contact Brand',
                style: AppTextStyles.labelMd(
                  color: CreatorColors.primary,
                ).copyWith(fontWeight: FontWeight.w700),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: CreatorColors.primaryFixed,
                foregroundColor: CreatorColors.primary,
                elevation: 0,
                shape: const RoundedRectangleBorder(
                  borderRadius: AppRadii.roundedMd,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: SizedBox(
            height: 48,
            child: ElevatedButton.icon(
              onPressed: onWithdraw,
              icon: const Icon(Icons.cancel_outlined, size: 18),
              label: Text(
                'Withdraw',
                style: AppTextStyles.labelMd(
                  color: CreatorColors.onErrorContainer,
                ).copyWith(fontWeight: FontWeight.w700),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: CreatorColors.errorContainer,
                foregroundColor: CreatorColors.onErrorContainer,
                elevation: 0,
                shape: const RoundedRectangleBorder(
                  borderRadius: AppRadii.roundedMd,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
