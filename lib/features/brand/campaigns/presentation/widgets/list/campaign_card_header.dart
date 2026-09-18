import 'package:flutter/material.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_radii.dart';
import '../../../../../../core/theme/app_text_styles.dart';
import '../../../data/models/campaign_model.dart';

class CampaignCardHeader extends StatelessWidget {
  final CampaignAccessType accessType;
  final CampaignStatus status;
  final String dateRange;

  const CampaignCardHeader({
    super.key,
    required this.accessType,
    required this.status,
    required this.dateRange,
  });

  @override
  Widget build(BuildContext context) {
    final isPublic = accessType == CampaignAccessType.public;
    final isExpired = status == CampaignStatus.expired;
    final isCompleted = status == CampaignStatus.completed;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
              decoration: BoxDecoration(
                color: isPublic ? AppColors.secondaryFixed : AppColors.tertiaryFixed,
                borderRadius: BorderRadius.circular(AppRadii.full),
              ),
              child: Text(
                isPublic ? 'Public' : 'Private',
                style: AppTextStyles.labelSm(color: isPublic ? AppColors.onSecondaryFixed : AppColors.onTertiaryFixed),
              ),
            ),
            const SizedBox(width: 6),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
              decoration: BoxDecoration(
                color: isExpired ? AppColors.errorContainer : (isCompleted ? AppColors.surfaceContainerHigh : AppColors.surfaceContainerLow),
                borderRadius: BorderRadius.circular(AppRadii.full),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 6,
                    height: 6,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isExpired ? AppColors.error : (isCompleted ? AppColors.tertiary : AppColors.secondary),
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    _formatStatus(status),
                    style: AppTextStyles.labelSm(color: isExpired ? AppColors.onErrorContainer : AppColors.onSurface),
                  ),
                ],
              ),
            ),
          ],
        ),
        Text(dateRange, style: AppTextStyles.labelSm(color: AppColors.tertiary)),
      ],
    );
  }

  String _formatStatus(CampaignStatus s) {
    switch (s) {
      case CampaignStatus.active: return 'Active';
      case CampaignStatus.completed: return 'Completed';
      case CampaignStatus.drafts: return 'Draft';
      case CampaignStatus.expired: return 'Expired';
    }
  }
}
