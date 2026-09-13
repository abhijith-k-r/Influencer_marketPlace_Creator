import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_radii.dart';
import '../../../../core/theme/app_text_styles.dart';

/// Search input bar for filtering campaigns in the Discovery screen.
class CampaignSearchBar extends StatelessWidget {
  final ValueChanged<String>? onChanged;

  const CampaignSearchBar({super.key, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      padding: const EdgeInsets.symmetric(horizontal: 14),
      decoration: const BoxDecoration(
        color: AppColors.surfaceWhite,
        borderRadius: AppRadii.roundedMd,
      ),
      child: Row(
        children: [
          const Icon(
            Icons.search_rounded,
            color: AppColors.textPlaceholder,
            size: 20,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              onChanged: onChanged,
              style: AppTextStyles.fieldInput,
              decoration: InputDecoration(
                hintText: 'Search sponsorships by brand or niche...',
                hintStyle: AppTextStyles.fieldPlaceholder.copyWith(
                  fontSize: 13,
                ),
                border: InputBorder.none,
                isDense: true,
                contentPadding: EdgeInsets.zero,
              ),
            ),
          ),
          const Icon(Icons.tune_rounded, color: AppColors.primary, size: 18),
        ],
      ),
    );
  }
}
