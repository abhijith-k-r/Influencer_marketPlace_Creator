import 'package:flutter/material.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_radii.dart';
import '../../../../../../core/theme/app_text_styles.dart';

class CreationBottomActions extends StatelessWidget {
  final VoidCallback onPublish;
  final VoidCallback onSaveDraft;

  const CreationBottomActions({
    super.key,
    required this.onPublish,
    required this.onSaveDraft,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 52,
          child: ElevatedButton.icon(
            onPressed: onPublish,
            icon: const Icon(Icons.rocket_launch_rounded, size: 20),
            label: Text(
              'Publish Campaign',
              style: AppTextStyles.labelLg(color: AppColors.onPrimary),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: AppColors.onPrimary,
              elevation: 4,
              shadowColor: AppColors.primary.withValues(alpha: 0.3),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppRadii.xl),
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: double.infinity,
          height: 48,
          child: TextButton.icon(
            onPressed: onSaveDraft,
            icon: const Icon(Icons.bookmark_outline_rounded, size: 20, color: AppColors.primary),
            label: Text(
              'Save as Draft',
              style: AppTextStyles.labelLg(color: AppColors.primary),
            ),
            style: TextButton.styleFrom(
              backgroundColor: AppColors.surfaceContainerLow,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppRadii.xl),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
