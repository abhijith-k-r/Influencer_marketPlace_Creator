import 'package:flutter/material.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_radii.dart';
import '../../../../../../core/theme/app_text_styles.dart';
import '../../../data/models/campaign_model.dart';

class CampaignTypeCard extends StatelessWidget {
  final CampaignAccessType type;
  final bool isSelected;
  final String badgeText;
  final String title;
  final String desc;
  final IconData icon;
  final ValueChanged<CampaignAccessType> onSelect;

  const CampaignTypeCard({
    super.key,
    required this.type,
    required this.isSelected,
    required this.badgeText,
    required this.title,
    required this.desc,
    required this.icon,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onSelect(type),
      borderRadius: BorderRadius.circular(AppRadii.xl),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary.withValues(alpha: 0.05) : AppColors.surfaceContainerLowest,
          borderRadius: BorderRadius.circular(AppRadii.xl),
          border: Border.all(color: isSelected ? AppColors.primary : Colors.transparent, width: 2),
          boxShadow: const [BoxShadow(color: Color(0x060B1C30), blurRadius: 8, offset: Offset(0, 2))],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: isSelected ? AppColors.primary.withValues(alpha: 0.1) : AppColors.surfaceContainerHigh,
                    borderRadius: BorderRadius.circular(AppRadii.md),
                  ),
                  child: Icon(icon, size: 20, color: isSelected ? AppColors.primary : AppColors.tertiary),
                ),
                if (isSelected)
                  Container(
                    width: 20,
                    height: 20,
                    decoration: const BoxDecoration(color: AppColors.primary, shape: BoxShape.circle),
                    child: const Icon(Icons.check, size: 12, color: Colors.white),
                  ),
              ],
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.primaryFixed : AppColors.surfaceContainerHigh,
                borderRadius: BorderRadius.circular(AppRadii.full),
              ),
              child: Text(
                badgeText,
                style: AppTextStyles.labelSm(color: isSelected ? AppColors.onPrimaryFixed : AppColors.tertiary),
              ),
            ),
            const SizedBox(height: 6),
            Text(title, style: AppTextStyles.headlineSm(color: AppColors.onSurface)),
            const SizedBox(height: 2),
            Text(desc, style: AppTextStyles.bodySm(color: AppColors.onSurfaceVariant), maxLines: 2, overflow: TextOverflow.ellipsis),
          ],
        ),
      ),
    );
  }
}
