import 'package:flutter/material.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_radii.dart';
import '../../../../../core/theme/app_text_styles.dart';

class CampaignBudgetDurationCard extends StatelessWidget {
  final TextEditingController budgetController;
  final int selectedDuration;
  final ValueChanged<int> onDurationChanged;

  const CampaignBudgetDurationCard({
    super.key,
    required this.budgetController,
    required this.selectedDuration,
    required this.onDurationChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Total Escrow Budget', style: AppTextStyles.labelMd(color: AppColors.onSurfaceVariant)),
        const SizedBox(height: 6),
        Stack(
          alignment: Alignment.centerLeft,
          children: [
            TextField(
              controller: budgetController,
              keyboardType: TextInputType.number,
              style: AppTextStyles.headlineSm(color: AppColors.onSurface),
              decoration: InputDecoration(
                filled: true,
                fillColor: AppColors.surfaceContainerLow,
                contentPadding: const EdgeInsets.only(left: 36, right: 140, top: 12, bottom: 12),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(AppRadii.md), borderSide: BorderSide.none),
              ),
            ),
            Positioned(left: 14, child: Text('₹', style: AppTextStyles.headlineSm(color: AppColors.primary))),
            Positioned(
              right: 10,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(color: AppColors.secondaryFixed, borderRadius: BorderRadius.circular(AppRadii.sm)),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.verified_user_rounded, size: 14, color: AppColors.onSecondaryFixed),
                    const SizedBox(width: 4),
                    Text('Escrow 100% Safe', style: AppTextStyles.labelSm(color: AppColors.onSecondaryFixed)),
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 14),
        Text('Campaign Duration', style: AppTextStyles.labelMd(color: AppColors.onSurfaceVariant)),
        const SizedBox(height: 6),
        Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(color: AppColors.surfaceContainerLow, borderRadius: BorderRadius.circular(AppRadii.md)),
          child: Row(
            children: [1, 2, 3].map((months) {
              final isSelected = selectedDuration == months;
              return Expanded(
                child: InkWell(
                  onTap: () => onDurationChanged(months),
                  borderRadius: BorderRadius.circular(AppRadii.sm),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: isSelected ? AppColors.primary : Colors.transparent,
                      borderRadius: BorderRadius.circular(AppRadii.sm),
                    ),
                    child: Text(
                      '$months ${months == 1 ? 'Month' : 'Months'}',
                      style: AppTextStyles.labelMd(color: isSelected ? AppColors.onPrimary : AppColors.onSurfaceVariant),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
