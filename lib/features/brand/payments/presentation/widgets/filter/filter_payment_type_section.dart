import 'package:flutter/material.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_radii.dart';
import '../../../../../../core/theme/app_shadows.dart';
import '../../../../../../core/theme/app_text_styles.dart';
import '../../../data/models/payment_transaction_model.dart';

class FilterPaymentTypeSection extends StatelessWidget {
  final Set<PaymentType> selectedTypes;
  final ValueChanged<PaymentType> onToggleType;

  static const List<MapEntry<PaymentType, String>> types = [
    MapEntry(PaymentType.initialAdvance, 'Initial Advance'),
    MapEntry(PaymentType.milestoneRelease, 'Milestone Release'),
    MapEntry(PaymentType.finalPayout, 'Final Payout'),
    MapEntry(PaymentType.performanceBonus, 'Performance Bonus'),
    MapEntry(PaymentType.refund, 'Refund / Cancellation'),
  ];

  const FilterPaymentTypeSection({
    super.key,
    required this.selectedTypes,
    required this.onToggleType,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(AppRadii.xxl),
        boxShadow: AppShadows.cardSoft,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.account_balance_wallet_outlined,
                    color: AppColors.primary,
                    size: 20,
                  ),
                  const SizedBox(width: 8),
                  Text('Payment Type', style: AppTextStyles.headlineSm()),
                ],
              ),
              Text('Select breakdown', style: AppTextStyles.labelSm(color: AppColors.tertiary)),
            ],
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 6,
            runSpacing: 8,
            children: types.map((entry) {
              final isSelected = selectedTypes.contains(entry.key);
              return GestureDetector(
                onTap: () => onToggleType(entry.key),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 150),
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: isSelected ? AppColors.primary : AppColors.surfaceContainerLow,
                    borderRadius: BorderRadius.circular(AppRadii.full),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (isSelected) ...[
                        const Icon(Icons.check, size: 14, color: Colors.white),
                        const SizedBox(width: 4),
                      ],
                      Text(
                        entry.value,
                        style: AppTextStyles.labelSm(
                          color: isSelected ? Colors.white : AppColors.onSurface,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
