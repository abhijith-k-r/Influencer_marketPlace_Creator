import 'package:flutter/material.dart';
import 'package:creator_side/core/theme/app_colors.dart';
import 'package:creator_side/core/theme/app_radii.dart';
import 'package:creator_side/core/theme/app_text_styles.dart';

/// Section title and Filter & Sort action row for BrandHomeScreen.
class BrandHomeSectionHeader extends StatelessWidget {
  final VoidCallback onFilterSort;

  const BrandHomeSectionHeader({super.key, required this.onFilterSort});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Top Matched Creators',
                style: AppTextStyles.headlineSm(color: AppColors.onSurface)
                    .copyWith(fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 2),
              Text(
                'Showing 24 creators',
                style: AppTextStyles.bodySm(color: AppColors.tertiary),
              ),
            ],
          ),
        ),
        InkWell(
          onTap: onFilterSort,
          borderRadius: AppRadii.roundedPill,
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Filter & Sort',
                  style: AppTextStyles.labelSm(color: AppColors.primary)
                      .copyWith(fontWeight: FontWeight.w700),
                ),
                const SizedBox(width: 2),
                const Icon(
                  Icons.swap_vert_rounded,
                  size: 16,
                  color: AppColors.primary,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
