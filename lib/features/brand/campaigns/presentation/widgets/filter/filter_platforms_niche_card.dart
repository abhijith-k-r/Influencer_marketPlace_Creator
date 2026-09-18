import 'package:flutter/material.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_radii.dart';
import '../../../../../../core/theme/app_text_styles.dart';
import 'filter_platform_constants.dart';

class FilterPlatformsNicheCard extends StatelessWidget {
  final Set<String> selectedPlatforms;
  final Set<String> selectedNiches;
  final ValueChanged<String> onTogglePlatform;
  final ValueChanged<String> onToggleNiche;

  const FilterPlatformsNicheCard({
    super.key,
    required this.selectedPlatforms,
    required this.selectedNiches,
    required this.onTogglePlatform,
    required this.onToggleNiche,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(AppRadii.xl),
        boxShadow: const [BoxShadow(color: Color(0x060B1C30), blurRadius: 10, offset: Offset(0, 2))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Target Platforms', style: AppTextStyles.headlineSm(color: AppColors.onSurface)),
              Text('Deliverables', style: AppTextStyles.labelSm(color: AppColors.tertiary)),
            ],
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 8,
            children: filterAllPlatforms.map((plat) {
              final isSel = selectedPlatforms.contains(plat);
              return InkWell(
                onTap: () => onTogglePlatform(plat),
                borderRadius: BorderRadius.circular(AppRadii.full),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                  decoration: BoxDecoration(
                    color: isSel ? AppColors.primary : AppColors.surfaceContainer,
                    borderRadius: BorderRadius.circular(AppRadii.full),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (isSel) ...[const Icon(Icons.check, size: 16, color: AppColors.onPrimary), const SizedBox(width: 4)],
                      Text(plat, style: AppTextStyles.labelMd(color: isSel ? AppColors.onPrimary : AppColors.tertiary)),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 16),
          const Divider(color: AppColors.surfaceContainer, height: 1),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Creator Niche', style: AppTextStyles.headlineSm(color: AppColors.onSurface)),
              Text('Audience Fit', style: AppTextStyles.labelSm(color: AppColors.tertiary)),
            ],
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: filterAllNiches.map((niche) {
              final isSel = selectedNiches.contains(niche);
              return InkWell(
                onTap: () => onToggleNiche(niche),
                borderRadius: BorderRadius.circular(AppRadii.md),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                  decoration: BoxDecoration(
                    color: isSel ? AppColors.surfaceContainerHigh : AppColors.surfaceContainer,
                    borderRadius: BorderRadius.circular(AppRadii.md),
                  ),
                  child: Text(niche, style: AppTextStyles.labelMd(color: isSel ? AppColors.onSurface : AppColors.tertiary)),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
