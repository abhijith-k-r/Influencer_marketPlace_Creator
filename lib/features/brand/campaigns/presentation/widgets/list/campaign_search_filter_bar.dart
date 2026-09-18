import 'package:flutter/material.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_radii.dart';
import '../../../../../../core/theme/app_text_styles.dart';

class CampaignSearchFilterBar extends StatelessWidget {
  final ValueChanged<String> onSearchChanged;
  final VoidCallback onFilterTap;
  final bool hasActiveFilters;

  const CampaignSearchFilterBar({
    super.key,
    required this.onSearchChanged,
    required this.onFilterTap,
    this.hasActiveFilters = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(AppRadii.xl),
        boxShadow: const [BoxShadow(color: Color(0x080B1C30), blurRadius: 10, offset: Offset(0, 2))],
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 40,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(color: AppColors.surfaceContainerLow, borderRadius: BorderRadius.circular(AppRadii.md)),
              child: Row(
                children: [
                  const Icon(Icons.search, size: 20, color: AppColors.tertiary),
                  const SizedBox(width: 6),
                  Expanded(
                    child: TextField(
                      onChanged: onSearchChanged,
                      style: AppTextStyles.bodySm(),
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.zero,
                        hintText: 'Search campaign, category...',
                        hintStyle: AppTextStyles.bodySm(color: AppColors.tertiary),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 8),
          Stack(
            clipBehavior: Clip.none,
            children: [
              IconButton(
                onPressed: onFilterTap,
                style: IconButton.styleFrom(
                  backgroundColor: AppColors.surfaceContainerLow,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadii.md)),
                  minimumSize: const Size(40, 40),
                ),
                icon: const Icon(Icons.tune_rounded, size: 20, color: AppColors.onSurface),
              ),
              if (hasActiveFilters)
                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.surfaceContainerLowest, width: 1.5),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
