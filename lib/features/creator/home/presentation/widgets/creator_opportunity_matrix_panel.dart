import 'package:flutter/material.dart';
import 'package:creator_side/core/theme/app_radii.dart';
import 'package:creator_side/core/theme/app_text_styles.dart';
import 'package:creator_side/core/theme/creator_colors.dart';
import 'package:creator_side/features/creator/home/data/models/creator_opportunity_model.dart';

/// Bento-style matrix panel with flex-constrained rows to prevent overflow (<85 LOC).
class CreatorOpportunityMatrixPanel extends StatelessWidget {
  final CreatorOpportunityModel opportunity;

  const CreatorOpportunityMatrixPanel({
    super.key,
    required this.opportunity,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: const BoxDecoration(
        color: CreatorColors.surfaceContainerLow,
        borderRadius: AppRadii.roundedMd,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ASSURED CREATOR FEE',
                      style: AppTextStyles.labelSm(color: CreatorColors.outline).copyWith(fontSize: 10, letterSpacing: 0.5),
                    ),
                    const SizedBox(height: 2),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          opportunity.assuredBudget,
                          style: AppTextStyles.headlineMd(color: CreatorColors.primary).copyWith(fontWeight: FontWeight.w800),
                        ),
                        const SizedBox(width: 4),
                        Flexible(
                          child: Text(
                            opportunity.budgetNote,
                            style: AppTextStyles.labelSm(color: CreatorColors.outline).copyWith(fontSize: 10),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'TIMELINE',
                    style: AppTextStyles.labelSm(color: CreatorColors.outline).copyWith(fontSize: 10, letterSpacing: 0.5),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    opportunity.duration,
                    style: AppTextStyles.labelMd(color: CreatorColors.onSurface).copyWith(fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Divider(height: 1),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Icon(opportunity.deliverableIcon, size: 16, color: CreatorColors.primaryContainer),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        opportunity.deliverable,
                        style: AppTextStyles.labelSm(color: CreatorColors.onSurface).copyWith(fontWeight: FontWeight.w600),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.timer_outlined, size: 14, color: CreatorColors.outline),
                  const SizedBox(width: 4),
                  Text(
                    opportunity.closesIn,
                    style: AppTextStyles.labelSm(color: CreatorColors.outline).copyWith(fontSize: 10),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
