import 'package:flutter/material.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_radii.dart';
import '../../../../../core/theme/app_text_styles.dart';

class FilterCuratedInsightBox extends StatelessWidget {
  const FilterCuratedInsightBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(AppRadii.xl),
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: AppColors.surfaceContainerLowest,
              borderRadius: BorderRadius.circular(AppRadii.md),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x060B1C30),
                  blurRadius: 4,
                  offset: Offset(0, 1),
                ),
              ],
            ),
            child: const Icon(
              Icons.verified_rounded,
              size: 24,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Curated Creator Matches',
                  style: AppTextStyles.labelMd(color: AppColors.onSurface),
                ),
                const SizedBox(height: 2),
                Text(
                  'All filters guarantee verified engagement rates above 3.5%.',
                  style: AppTextStyles.bodySm(color: AppColors.tertiary),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
