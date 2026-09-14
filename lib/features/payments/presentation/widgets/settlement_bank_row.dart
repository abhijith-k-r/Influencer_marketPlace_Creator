import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_radii.dart';
import '../../../../core/theme/app_text_styles.dart';

/// Primary bank account tile with verified status badge.
class SettlementBankRow extends StatelessWidget {
  final String bankName;
  final String accountNumber;
  final String initial;

  const SettlementBankRow({
    super.key,
    this.bankName = 'HDFC Bank',
    this.accountNumber = '•••• 4892',
    this.initial = 'H',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.scaffoldBackground,
        borderRadius: AppRadii.roundedMd,
        border: Border.all(color: AppColors.borderLight),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: AppColors.indigo.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    initial,
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: AppColors.indigo,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$bankName $accountNumber',
                    style: AppTextStyles.bodySmall.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  Text(
                    'Primary Payout Account',
                    style: AppTextStyles.caption.copyWith(color: AppColors.textTertiary),
                  ),
                ],
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: const BoxDecoration(
              color: AppColors.emeraldLight,
              borderRadius: AppRadii.roundedXs,
            ),
            child: Row(
              children: [
                const Icon(Icons.check_circle_rounded, color: AppColors.emerald, size: 12),
                const SizedBox(width: 4),
                Text(
                  'Verified',
                  style: AppTextStyles.caption.copyWith(
                    color: AppColors.emeraldDark,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
