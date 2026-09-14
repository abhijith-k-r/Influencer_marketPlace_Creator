import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_radii.dart';
import '../../../../core/theme/app_text_styles.dart';

/// Translucent footer bar showing Gross value and Platform Fee deductions.
class EscrowBreakdownBar extends StatelessWidget {
  final String totalValue;
  final String feeAmount;

  const EscrowBreakdownBar({
    super.key,
    required this.totalValue,
    required this.feeAmount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.buttonPrimary.withValues(alpha: 0.2),
        borderRadius: AppRadii.roundedSm,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Gross: $totalValue',
            style: AppTextStyles.caption.copyWith(
              color: AppColors.textWhite.withValues(alpha: 0.7),
            ),
          ),
          Text(
            'Platform Fee (10%): $feeAmount',
            style: AppTextStyles.caption.copyWith(
              color: AppColors.errorBorder,
            ),
          ),
        ],
      ),
    );
  }
}
