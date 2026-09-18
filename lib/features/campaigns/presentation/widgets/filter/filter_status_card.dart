import 'package:flutter/material.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_radii.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../data/models/campaign_model.dart';

class FilterStatusCard extends StatelessWidget {
  final Set<CampaignStatus> selectedStatuses;
  final ValueChanged<CampaignStatus> onToggleStatus;

  const FilterStatusCard({
    super.key,
    required this.selectedStatuses,
    required this.onToggleStatus,
  });

  @override
  Widget build(BuildContext context) {
    const statuses = [
      {'status': CampaignStatus.active, 'label': 'Active'},
      {'status': CampaignStatus.completed, 'label': 'Completed'},
      {'status': CampaignStatus.expired, 'label': 'Expired'},
      {'status': CampaignStatus.drafts, 'label': 'Draft'},
    ];

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(AppRadii.xl),
        boxShadow: const [
          BoxShadow(
            color: Color(0x060B1C30),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.check_circle_outline_rounded, size: 20, color: AppColors.tertiary),
                  const SizedBox(width: 8),
                  Text('Campaign Status', style: AppTextStyles.headlineSm(color: AppColors.onSurface)),
                ],
              ),
              Text('Multi-select', style: AppTextStyles.labelSm(color: AppColors.tertiary)),
            ],
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: statuses.map((item) {
              final status = item['status'] as CampaignStatus;
              final isSel = selectedStatuses.contains(status);
              return InkWell(
                onTap: () => onToggleStatus(status),
                borderRadius: BorderRadius.circular(AppRadii.full),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: isSel ? AppColors.primary : AppColors.surfaceContainer,
                    borderRadius: BorderRadius.circular(AppRadii.full),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (isSel) ...[
                        const Icon(Icons.check, size: 16, color: AppColors.onPrimary),
                        const SizedBox(width: 6),
                      ],
                      Text(
                        item['label'] as String,
                        style: AppTextStyles.labelMd(
                          color: isSel ? AppColors.onPrimary : AppColors.tertiary,
                        ),
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
