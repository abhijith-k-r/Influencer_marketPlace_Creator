import 'package:flutter/material.dart';
import 'package:creator_side/core/theme/app_radii.dart';
import 'package:creator_side/core/theme/app_text_styles.dart';
import 'package:creator_side/core/theme/creator_colors.dart';

class CreatorRedeemDestinationBox extends StatelessWidget {
  const CreatorRedeemDestinationBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: CreatorColors.surfaceContainerLowest,
        borderRadius: AppRadii.roundedXl,
        border: Border.all(color: CreatorColors.outlineVariant.withValues(alpha: 0.6)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Destination Account',
                style: AppTextStyles.labelSm(
                  color: CreatorColors.outline,
                ).copyWith(fontWeight: FontWeight.w600),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: const BoxDecoration(
                  color: Color(0x1F00A86B),
                  borderRadius: AppRadii.roundedFull,
                ),
                child: Row(
                  children: [
                    const Icon(Icons.check_circle_rounded, size: 10, color: Color(0xFF00A86B)),
                    const SizedBox(width: 3),
                    Text(
                      'VERIFIED UPI',
                      style: AppTextStyles.labelSm(
                        color: const Color(0xFF00A86B),
                      ).copyWith(fontSize: 10, fontWeight: FontWeight.w800),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: CreatorColors.primaryContainer.withValues(alpha: 0.4),
                  borderRadius: AppRadii.roundedMd,
                ),
                child: const Icon(Icons.account_balance_rounded, size: 20, color: CreatorColors.primary),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'HDFC Bank (••4021)',
                      style: AppTextStyles.labelLg(
                        color: CreatorColors.onSurface,
                      ).copyWith(fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'rohit.creator@okhdfcbank',
                      style: AppTextStyles.labelSm(color: CreatorColors.outline).copyWith(fontSize: 10),
                    ),
                  ],
                ),
              ),
              Text(
                'Instant',
                style: AppTextStyles.labelSm(
                  color: const Color(0xFF00A86B),
                ).copyWith(fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
