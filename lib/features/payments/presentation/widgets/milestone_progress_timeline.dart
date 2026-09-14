import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_radii.dart';
import '../../../../core/theme/app_text_styles.dart';
import 'milestone_timeline_tile.dart';

class MilestoneProgressTimeline extends StatelessWidget {
  final VoidCallback? onClaimMilestone;

  const MilestoneProgressTimeline({
    super.key,
    this.onClaimMilestone,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Milestone Disbursements', style: AppTextStyles.h3),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: const BoxDecoration(
                color: AppColors.indigoLight,
                borderRadius: AppRadii.roundedSm,
              ),
              child: Text(
                '5 Stages',
                style: AppTextStyles.caption.copyWith(
                  color: AppColors.indigo,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        const MilestoneTimelineTile(
          step: 1,
          title: 'Initial Signing Advance',
          amount: '₹5,000',
          description: 'Released on Oct 12 • Direct Bank Transfer',
          status: MilestoneStatus.paid,
        ),
        MilestoneTimelineTile(
          step: 2,
          title: '50K Views Performance Bonus',
          amount: '₹2,000',
          description: 'Target Achieved (54.3K / 50K Views) • Claim Ready',
          status: MilestoneStatus.ready,
          onTap: onClaimMilestone,
        ),
        const MilestoneTimelineTile(
          step: 3,
          title: '100K Views Performance Bonus',
          amount: '₹5,000',
          description: '85.2K / 100K Views (85% traction)',
          status: MilestoneStatus.inProgress,
          progress: 0.85,
        ),
        const MilestoneTimelineTile(
          step: 4,
          title: '500K Views Mega Stretch',
          amount: '₹7,000',
          description: 'Unlocks after 100K milestone reached',
          status: MilestoneStatus.locked,
        ),
        const MilestoneTimelineTile(
          step: 5,
          title: '1M Views Viral Tier',
          amount: '₹10,000',
          description: 'Max tier for top viral reach',
          status: MilestoneStatus.locked,
          isLast: true,
        ),
      ],
    );
  }
}
