import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_radii.dart';
import '../../../../core/theme/app_shadows.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../data/models/application_item_model.dart';

/// Card item displaying submitted proposal rate, brand, and review status.
class ApplicationCard extends StatelessWidget {
  final ApplicationItemModel application;

  const ApplicationCard({super.key, required this.application});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: AppColors.surfaceWhite,
        borderRadius: AppRadii.roundedMd,
        boxShadow: AppShadows.cardSoft,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(application.brandName, style: AppTextStyles.brandPill),
              _buildStatusPill(application.status),
            ],
          ),
          AppSpacing.verticalSm,
          Text(
            application.campaignTitle,
            style: AppTextStyles.fieldLabel.copyWith(fontSize: 14),
          ),
          AppSpacing.verticalSm,
          Text(
            'Submitted ${application.submittedDate}',
            style: AppTextStyles.body.copyWith(fontSize: 11),
          ),
          const Divider(color: AppColors.inputBackground, height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Proposed Escrow: ${application.proposedRate}',
                style: AppTextStyles.fieldLabel,
              ),
              TextButton(
                onPressed: () {},
                child: Text('View Details', style: AppTextStyles.textLink),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatusPill(ApplicationStatus status) {
    Color bg;
    Color fg;
    String text;

    switch (status) {
      case ApplicationStatus.inReview:
        bg = Colors.amber.shade100;
        fg = Colors.amber.shade900;
        text = 'In Review';
        break;
      case ApplicationStatus.accepted:
        bg = Colors.green.shade100;
        fg = Colors.green.shade800;
        text = 'Accepted';
        break;
      case ApplicationStatus.completed:
        bg = AppColors.pillBackground;
        fg = AppColors.primaryDark;
        text = 'Completed';
        break;
      case ApplicationStatus.rejected:
        bg = Colors.red.shade100;
        fg = Colors.red.shade900;
        text = 'Declined';
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(color: bg, borderRadius: AppRadii.roundedPill),
      child: Text(
        text,
        style: AppTextStyles.brandPill.copyWith(color: fg, fontSize: 10),
      ),
    );
  }
}
