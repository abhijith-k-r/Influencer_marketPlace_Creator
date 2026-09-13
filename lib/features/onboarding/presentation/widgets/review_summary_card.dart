import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_radii.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';

/// Review card item displaying section summary with an edit shortcut.
class ReviewSummaryCard extends StatelessWidget {
  final String title;
  final List<Widget> children;
  final VoidCallback? onEdit;

  const ReviewSummaryCard({
    super.key,
    required this.title,
    required this.children,
    this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppSpacing.paddingBentoCard,
      decoration: const BoxDecoration(
        color: AppColors.surfaceWhite,
        borderRadius: AppRadii.roundedMd,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title.toUpperCase(),
                style: AppTextStyles.brandPill.copyWith(
                  color: AppColors.primary,
                  fontSize: 11,
                ),
              ),
              if (onEdit != null)
                GestureDetector(
                  onTap: onEdit,
                  child: Text('Edit', style: AppTextStyles.textLink),
                ),
            ],
          ),
          const Divider(color: AppColors.inputBackground, height: 16),
          ...children,
        ],
      ),
    );
  }
}
