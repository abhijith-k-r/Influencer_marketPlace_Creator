import 'package:flutter/material.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_radii.dart';
import '../../../../../../core/theme/app_shadows.dart';
import '../../../../../../core/theme/app_text_styles.dart';
import '../../../data/models/payment_transaction_model.dart';

class FilterStatusSection extends StatelessWidget {
  final Set<PaymentTransactionStatus> selectedStatuses;
  final ValueChanged<PaymentTransactionStatus> onToggleStatus;

  static const List<MapEntry<PaymentTransactionStatus, String>> statuses = [
    MapEntry(PaymentTransactionStatus.paid, 'Paid / Completed'),
    MapEntry(PaymentTransactionStatus.pendingEscrow, 'Pending Escrow'),
    MapEntry(PaymentTransactionStatus.underReview, 'Under Review'),
    MapEntry(PaymentTransactionStatus.failed, 'Failed / Reversed'),
    MapEntry(PaymentTransactionStatus.disputed, 'Disputed'),
  ];

  const FilterStatusSection({
    super.key,
    required this.selectedStatuses,
    required this.onToggleStatus,
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
                    Icons.verified_rounded,
                    color: AppColors.primary,
                    size: 20,
                  ),
                  const SizedBox(width: 8),
                  Text('Payment Status', style: AppTextStyles.headlineSm()),
                ],
              ),
              Text('Multi-select', style: AppTextStyles.labelSm(color: AppColors.tertiary)),
            ],
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 6,
            runSpacing: 8,
            children: statuses.map((entry) {
              final isSelected = selectedStatuses.contains(entry.key);
              return GestureDetector(
                onTap: () => onToggleStatus(entry.key),
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
