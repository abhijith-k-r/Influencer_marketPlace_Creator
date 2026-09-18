import 'package:flutter/material.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_radii.dart';
import '../../../../../core/theme/app_text_styles.dart';
import 'campaign_criteria_data.dart';

class CampaignTargetPlatformsWrap extends StatelessWidget {
  final Set<String> selectedPlatforms;
  final ValueChanged<String> onTogglePlatform;

  const CampaignTargetPlatformsWrap({
    super.key,
    required this.selectedPlatforms,
    required this.onTogglePlatform,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      children: targetCriteriaPlatforms.map((p) {
        final isSel = selectedPlatforms.contains(p['name']);
        return InkWell(
          onTap: () => onTogglePlatform(p['name'] as String),
          borderRadius: BorderRadius.circular(AppRadii.full),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            decoration: BoxDecoration(
              color: isSel ? AppColors.primary : AppColors.surfaceContainerHigh,
              borderRadius: BorderRadius.circular(AppRadii.full),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(p['icon'] as IconData, size: 16, color: isSel ? AppColors.onPrimary : AppColors.onSurface),
                const SizedBox(width: 6),
                Text(p['name'] as String, style: AppTextStyles.labelMd(color: isSel ? AppColors.onPrimary : AppColors.onSurface)),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
