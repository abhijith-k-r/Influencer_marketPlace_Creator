import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_radii.dart';
import '../../../../core/theme/app_text_styles.dart';

/// Bottom status ribbon of an active deal card with compensation amount.
class DealStatusRibbon extends StatelessWidget {
  final IconData statusIcon;
  final String statusText;
  final String dealAmount;

  const DealStatusRibbon({
    super.key,
    required this.statusIcon,
    required this.statusText,
    required this.dealAmount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      decoration: BoxDecoration(
        color: AppColors.inputBackground.withValues(alpha: 0.7),
        borderRadius: BorderRadius.circular(AppRadii.sm),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(statusIcon, size: 15, color: AppColors.primary),
              const SizedBox(width: 6),
              Text(
                statusText,
                style: AppTextStyles.caption.copyWith(
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
          Text(
            dealAmount,
            style: AppTextStyles.caption.copyWith(
              fontSize: 12,
              fontWeight: FontWeight.w800,
              color: AppColors.buttonPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
