import 'package:flutter/material.dart';
import 'package:creator_side/core/theme/app_radii.dart';
import 'package:creator_side/core/theme/app_shadows.dart';
import 'package:creator_side/core/theme/app_text_styles.dart';
import 'package:creator_side/core/theme/creator_colors.dart';

/// Feedback card in Work Details showing latest notes from brand lead.
class WorkBrandFeedbackCard extends StatelessWidget {
  const WorkBrandFeedbackCard({super.key});

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
              Row(
                children: [
                  const Icon(Icons.rate_review_rounded, color: CreatorColors.primary, size: 20),
                  const SizedBox(width: 8),
                  Text(
                    'Brand Feedback & Notes',
                    style: AppTextStyles.headlineSm(
                      color: CreatorColors.onSurface,
                    ).copyWith(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              Text('2h ago', style: AppTextStyles.labelSm(color: CreatorColors.outline)),
            ],
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(14),
            decoration: const BoxDecoration(
              color: CreatorColors.surfaceContainerLow,
              borderRadius: AppRadii.roundedMd,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '“The pacing and street tone in Draft v1 look stellar Aarav! Just ensure the swipe-up story tag is visible for 5 full seconds.”',
                  style: AppTextStyles.bodyMd(
                    color: CreatorColors.onSurface,
                  ).copyWith(fontStyle: FontStyle.italic, height: 1.4),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'By Rhea Sen • Campaign Lead',
                      style: AppTextStyles.labelSm(
                        color: CreatorColors.outline,
                      ).copyWith(fontWeight: FontWeight.w600),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Row(
                        children: [
                          Text(
                            'View Full',
                            style: AppTextStyles.labelMd(
                              color: CreatorColors.primary,
                            ).copyWith(fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(width: 2),
                          const Icon(Icons.arrow_forward_rounded, size: 14, color: CreatorColors.primary),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
