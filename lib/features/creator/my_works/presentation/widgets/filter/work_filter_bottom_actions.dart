import 'package:flutter/material.dart';
import 'package:creator_side/core/theme/app_radii.dart';
import 'package:creator_side/core/theme/app_text_styles.dart';
import 'package:creator_side/core/theme/creator_colors.dart';

/// Apply and Reset buttons for the Work Filter view.
class WorkFilterBottomActions extends StatelessWidget {
  final int resultCount;
  final VoidCallback onApply;
  final VoidCallback onReset;

  const WorkFilterBottomActions({
    super.key,
    this.resultCount = 4,
    required this.onApply,
    required this.onReset,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            onPressed: onApply,
            style: ElevatedButton.styleFrom(
              backgroundColor: CreatorColors.primaryContainer,
              foregroundColor: CreatorColors.onPrimary,
              elevation: 4,
              shadowColor: const Color(0x593B46F1),
              shape: const RoundedRectangleBorder(borderRadius: AppRadii.roundedMd),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Apply Filters ($resultCount Results)',
                  style: AppTextStyles.labelLg(color: Colors.white).copyWith(fontWeight: FontWeight.w700),
                ),
                const SizedBox(width: 8),
                const Icon(Icons.arrow_forward_rounded, size: 20, color: Colors.white),
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: double.infinity,
          height: 46,
          child: TextButton.icon(
            onPressed: onReset,
            icon: const Icon(Icons.restart_alt_rounded, size: 18, color: CreatorColors.primary),
            label: Text(
              'Reset Filters',
              style: AppTextStyles.labelMd(color: CreatorColors.primary).copyWith(fontWeight: FontWeight.w700),
            ),
            style: TextButton.styleFrom(
              backgroundColor: CreatorColors.surfaceContainerLow,
              shape: const RoundedRectangleBorder(borderRadius: AppRadii.roundedMd),
            ),
          ),
        ),
      ],
    );
  }
}
