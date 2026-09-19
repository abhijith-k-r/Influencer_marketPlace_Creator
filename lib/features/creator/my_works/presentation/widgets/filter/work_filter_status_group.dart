import 'package:flutter/material.dart';
import 'package:creator_side/core/theme/app_radii.dart';
import 'package:creator_side/core/theme/app_shadows.dart';
import 'package:creator_side/core/theme/app_text_styles.dart';
import 'package:creator_side/core/theme/creator_colors.dart';

/// Multi-select deliverable status chip selector for Work Filter.
class WorkFilterStatusGroup extends StatelessWidget {
  final Set<String> selectedStatuses;
  final ValueChanged<String> onToggleStatus;

  static const List<String> availableStatuses = [
    'Applied',
    'Accepted',
    'In Progress',
    'Completed',
    'Paid',
  ];

  const WorkFilterStatusGroup({
    super.key,
    required this.selectedStatuses,
    required this.onToggleStatus,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: CreatorColors.surfaceContainerLowest,
        borderRadius: AppRadii.roundedXl,
        boxShadow: AppShadows.cardSoft,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Deliverable Status',
                style: AppTextStyles.labelLg(color: CreatorColors.onSurface).copyWith(fontWeight: FontWeight.w700),
              ),
              Text(
                '${selectedStatuses.length} Selected',
                style: AppTextStyles.labelSm(color: CreatorColors.primary).copyWith(fontWeight: FontWeight.w700),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: availableStatuses.map((status) {
              final isSelected = selectedStatuses.contains(status);
              return InkWell(
                onTap: () => onToggleStatus(status),
                borderRadius: AppRadii.roundedFull,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                  decoration: BoxDecoration(
                    color: isSelected ? CreatorColors.primaryContainer : CreatorColors.surfaceContainerLow,
                    borderRadius: AppRadii.roundedFull,
                    boxShadow: isSelected
                        ? const [BoxShadow(color: Color(0x403B46F1), blurRadius: 8, offset: Offset(0, 3))]
                        : null,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (isSelected) ...[
                        const Icon(Icons.check_rounded, color: Colors.white, size: 16),
                        const SizedBox(width: 4),
                      ],
                      Text(
                        status,
                        style: AppTextStyles.labelMd(
                          color: isSelected ? Colors.white : CreatorColors.onSurfaceVariant,
                        ).copyWith(fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
