import 'package:flutter/material.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_radii.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../data/models/filter_chip_item.dart';

/// Single filter chip bubble with optional platform icon (<55 LOC).
class FilterChipBubble extends StatelessWidget {
  final FilterChipItem item;
  final bool isSelected;
  final VoidCallback onTap;

  const FilterChipBubble({
    super.key,
    required this.item,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: InkWell(
        onTap: onTap,
        borderRadius: AppRadii.roundedPill,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.primary : AppColors.surfaceContainerLowest,
            borderRadius: AppRadii.roundedPill,
            border: isSelected ? null : Border.all(color: AppColors.surfaceContainer, width: 1),
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      color: AppColors.primary.withValues(alpha: 0.25),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ]
                : null,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (item.icon != null) ...[
                Icon(item.icon, size: 15, color: isSelected ? Colors.white : item.iconColor),
                const SizedBox(width: 6),
              ],
              Text(
                item.label,
                style: AppTextStyles.labelMd(
                  color: isSelected ? Colors.white : AppColors.onSurface,
                ).copyWith(fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
