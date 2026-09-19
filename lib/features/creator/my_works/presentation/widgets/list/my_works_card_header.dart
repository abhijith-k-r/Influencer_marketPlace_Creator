import 'package:flutter/material.dart';
import 'package:creator_side/core/theme/app_radii.dart';
import 'package:creator_side/core/theme/app_text_styles.dart';
import 'package:creator_side/core/theme/creator_colors.dart';
import 'package:creator_side/features/creator/my_works/data/models/creator_work_item.dart';
import 'my_works_status_badge.dart';

/// Top meta row of a creator work card showing brand logo, titles, and status badge.
class MyWorksCardHeader extends StatelessWidget {
  final CreatorWorkItem item;

  const MyWorksCardHeader({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 44,
          height: 44,
          decoration: const BoxDecoration(
            color: CreatorColors.surfaceContainerHigh,
            borderRadius: AppRadii.roundedMd,
          ),
          child: const Center(
            child: Icon(
              Icons.campaign_rounded,
              color: CreatorColors.primary,
              size: 22,
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Flexible(
                    child: Text(
                      item.brandName,
                      style: AppTextStyles.headlineSm(
                        color: CreatorColors.onSurface,
                      ).copyWith(fontSize: 16, fontWeight: FontWeight.w700),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  if (item.isVerified) ...[
                    const SizedBox(width: 4),
                    const Icon(
                      Icons.verified_rounded,
                      size: 16,
                      color: CreatorColors.primaryContainer,
                    ),
                  ],
                ],
              ),
              const SizedBox(height: 2),
              Text(
                item.campaignTitle,
                style: AppTextStyles.bodySm(
                  color: CreatorColors.onSurfaceVariant,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        const SizedBox(width: 8),
        MyWorksStatusBadge(status: item.status),
      ],
    );
  }
}
