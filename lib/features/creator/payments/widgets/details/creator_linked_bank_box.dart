import 'package:flutter/material.dart';
import 'package:creator_side/core/theme/app_radii.dart';
import 'package:creator_side/core/theme/app_text_styles.dart';
import 'package:creator_side/core/theme/creator_colors.dart';

class CreatorLinkedBankBox extends StatelessWidget {
  const CreatorLinkedBankBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: CreatorColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(AppRadii.xl),
        border: Border.all(color: CreatorColors.outlineVariant.withValues(alpha: 0.6)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: CreatorColors.primary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(AppRadii.md),
                ),
                child: const Icon(Icons.account_balance_rounded, color: CreatorColors.primary, size: 22),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text('HDFC Bank ••4021', style: AppTextStyles.labelLg(color: CreatorColors.onSurface).copyWith(fontWeight: FontWeight.w700)),
                        const SizedBox(width: 6),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: const Color(0xFF00A86B).withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(AppRadii.full),
                          ),
                          child: Text('DEFAULT', style: AppTextStyles.labelSm(color: const Color(0xFF00A86B)).copyWith(fontSize: 10, fontWeight: FontWeight.w700)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 2),
                    Text('UPI ID: rohit.creator@okhdfcbank', style: AppTextStyles.labelSm(color: CreatorColors.outline).copyWith(fontSize: 10)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: CreatorColors.surfaceContainerLow,
              borderRadius: BorderRadius.circular(AppRadii.md),
            ),
            child: Row(
              children: [
                const Icon(Icons.shield_outlined, size: 16, color: CreatorColors.primary),
                const SizedBox(width: 8),
                Expanded(
                  child: Text('Direct RBI-regulated NPCI instant payout enabled', style: AppTextStyles.labelSm(color: CreatorColors.onSurfaceVariant).copyWith(fontSize: 10)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
