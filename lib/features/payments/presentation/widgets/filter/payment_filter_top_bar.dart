import 'package:flutter/material.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_radii.dart';
import '../../../../../core/theme/app_shadows.dart';
import '../../../../../core/theme/app_text_styles.dart';

class PaymentFilterTopBar extends StatelessWidget {
  final VoidCallback onBackTap;
  final VoidCallback onResetAllTap;

  const PaymentFilterTopBar({
    super.key,
    required this.onBackTap,
    required this.onResetAllTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(AppRadii.xxl),
        boxShadow: AppShadows.cardSoft,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: onBackTap,
                icon: const Icon(Icons.arrow_back_ios_new, size: 18),
                style: IconButton.styleFrom(
                  backgroundColor: AppColors.surfaceContainerLow,
                  foregroundColor: AppColors.onSurface,
                  minimumSize: const Size(36, 36),
                ),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Filter Payments', style: AppTextStyles.headlineSm()),
                  const SizedBox(height: 1),
                  Text(
                    'Brand Escrow & Payout Audit',
                    style: AppTextStyles.labelSm(color: AppColors.tertiary),
                  ),
                ],
              ),
            ],
          ),
          TextButton(
            onPressed: onResetAllTap,
            child: Text(
              'Reset All',
              style: AppTextStyles.labelMd(color: AppColors.primary),
            ),
          ),
        ],
      ),
    );
  }
}
