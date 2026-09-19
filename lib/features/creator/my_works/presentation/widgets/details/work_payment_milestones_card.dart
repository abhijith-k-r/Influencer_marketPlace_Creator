import 'package:flutter/material.dart';
import 'package:creator_side/core/theme/app_radii.dart';
import 'package:creator_side/core/theme/app_shadows.dart';
import 'package:creator_side/core/theme/app_text_styles.dart';
import 'package:creator_side/core/theme/creator_colors.dart';
import 'package:creator_side/features/creator/my_works/data/models/creator_work_milestone.dart';
import 'work_payment_milestone_tile.dart';

/// Container for Payment Milestones in Work Details.
class WorkPaymentMilestonesCard extends StatelessWidget {
  final List<CreatorWorkMilestone> milestones;

  const WorkPaymentMilestonesCard({super.key, required this.milestones});

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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Payment Milestones',
                    style: AppTextStyles.headlineSm(
                      color: CreatorColors.onSurface,
                    ).copyWith(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                  Text(
                    'Automated release via smart triggers',
                    style: AppTextStyles.bodySm(color: CreatorColors.outline),
                  ),
                ],
              ),
              const Icon(
                Icons.payments_rounded,
                color: CreatorColors.primary,
                size: 22,
              ),
            ],
          ),
          const SizedBox(height: 12),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: milestones.length,
            separatorBuilder: (_, _) => const SizedBox(height: 8),
            itemBuilder: (context, index) => WorkPaymentMilestoneTile(item: milestones[index]),
          ),
        ],
      ),
    );
  }
}
