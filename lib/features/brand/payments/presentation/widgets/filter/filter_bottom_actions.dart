import 'package:flutter/material.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_radii.dart';
import '../../../../../../core/theme/app_text_styles.dart';

class FilterBottomActions extends StatelessWidget {
  final int resultsCount;
  final VoidCallback onApply;
  final VoidCallback onClearAll;

  const FilterBottomActions({
    super.key,
    required this.resultsCount,
    required this.onApply,
    required this.onClearAll,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.surface.withValues(alpha: 0.95),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton.icon(
              onPressed: onApply,
              icon: const Icon(Icons.filter_alt_outlined, size: 20),
              label: Text(
                'Apply Filters ($resultsCount Results)',
                style: AppTextStyles.labelLg(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppRadii.xl),
                ),
              ),
            ),
          ),
          const SizedBox(height: 6),
          SizedBox(
            width: double.infinity,
            height: 42,
            child: TextButton(
              onPressed: onClearAll,
              style: TextButton.styleFrom(
                backgroundColor: AppColors.surfaceContainerLow,
                foregroundColor: AppColors.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppRadii.xl),
                ),
              ),
              child: Text(
                'Clear All Filters',
                style: AppTextStyles.labelMd(color: AppColors.primary),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
