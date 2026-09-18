import 'package:flutter/material.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_radii.dart';
import '../../../../../../core/theme/app_text_styles.dart';

class FilterDateBox extends StatelessWidget {
  final String label;
  final String date;
  final IconData icon;
  final bool isPrimary;

  const FilterDateBox({
    super.key,
    required this.label,
    required this.date,
    required this.icon,
    this.isPrimary = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(AppRadii.xl),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: AppTextStyles.labelSm(color: AppColors.tertiary)),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(date, style: AppTextStyles.bodyMd(color: AppColors.onSurface)),
              Icon(
                icon,
                size: 18,
                color: isPrimary ? AppColors.primary : AppColors.tertiary,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
