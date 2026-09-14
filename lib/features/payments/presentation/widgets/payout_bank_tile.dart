import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_radii.dart';
import '../../../../core/theme/app_text_styles.dart';

/// Bank destination tile with instant arrival estimate and verification icon.
class PayoutBankTile extends StatelessWidget {
  final String bankName;
  final String accountNumber;
  final String arrivalEstimate;

  const PayoutBankTile({
    super.key,
    this.bankName = 'HDFC Bank',
    this.accountNumber = '•••• 4892',
    this.arrivalEstimate = 'Arrival: IMPS Instant (2-4 hours)',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: const BoxDecoration(
        color: AppColors.scaffoldBackground,
        borderRadius: AppRadii.roundedMd,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$bankName $accountNumber',
                style: AppTextStyles.bodyMedium.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                arrivalEstimate,
                style: AppTextStyles.caption.copyWith(
                  color: AppColors.emeraldDark,
                ),
              ),
            ],
          ),
          const Icon(
            Icons.check_circle_rounded,
            color: AppColors.emerald,
            size: 20,
          ),
        ],
      ),
    );
  }
}
