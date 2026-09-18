import 'package:flutter/material.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_radii.dart';
import '../../../../../core/theme/app_text_styles.dart';

class FilterHeaderBar extends StatelessWidget {
  final VoidCallback onBack;
  final VoidCallback onResetAll;

  const FilterHeaderBar({
    super.key,
    required this.onBack,
    required this.onResetAll,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: onBack,
          style: IconButton.styleFrom(
            backgroundColor: AppColors.surfaceContainerLow,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppRadii.md),
            ),
            minimumSize: const Size(40, 40),
          ),
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 18,
            color: AppColors.onSurface,
          ),
        ),
        Column(
          children: [
            Text(
              'Filter Campaigns',
              style: AppTextStyles.headlineSm(color: AppColors.onSurface),
            ),
            Text(
              'Brand Portal',
              style: AppTextStyles.labelSm(color: AppColors.tertiary),
            ),
          ],
        ),
        TextButton(
          onPressed: onResetAll,
          child: Text(
            'Reset All',
            style: AppTextStyles.labelLg(color: AppColors.primary),
          ),
        ),
      ],
    );
  }
}
