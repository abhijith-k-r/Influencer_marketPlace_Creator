import 'package:flutter/material.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_radii.dart';
import '../../../../../core/theme/app_shadows.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../data/models/payment_milestone_model.dart';
import 'milestone_step_tile.dart';

class MilestoneScheduleCard extends StatelessWidget {
  final List<PaymentMilestoneModel> milestones;
  final String statusSubtitle;

  const MilestoneScheduleCard({
    super.key,
    required this.milestones,
    this.statusSubtitle = '2 of 3 Released',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(AppRadii.xxl),
        boxShadow: AppShadows.cardSoft,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.timeline_rounded,
                    color: AppColors.primary,
                    size: 20,
                  ),
                  const SizedBox(width: 8),
                  Text('Milestone Schedule', style: AppTextStyles.headlineSm()),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: AppColors.surfaceContainerHigh,
                  borderRadius: BorderRadius.circular(AppRadii.full),
                ),
                child: Text(
                  statusSubtitle,
                  style: AppTextStyles.labelSm(color: AppColors.onSurface),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          ...milestones.asMap().entries.map((entry) {
            final idx = entry.key;
            final milestone = entry.value;
            final isLast = idx == milestones.length - 1;
            return MilestoneStepTile(
              milestone: milestone,
              isLast: isLast,
            );
          }),
        ],
      ),
    );
  }
}
