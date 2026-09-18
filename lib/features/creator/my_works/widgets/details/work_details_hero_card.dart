import 'package:flutter/material.dart';
import 'package:creator_side/core/theme/app_radii.dart';
import 'package:creator_side/core/theme/app_shadows.dart';
import 'package:creator_side/core/theme/app_text_styles.dart';
import 'package:creator_side/core/theme/creator_colors.dart';
import '../../models/creator_work_item.dart';
import '../list/my_works_status_badge.dart';
import 'work_details_escrow_badge.dart';
import 'work_details_metrics_tile.dart';

/// Hero card for Work Details containing brand info, timeline, payout, and escrow.
class WorkDetailsHeroCard extends StatelessWidget {
  final CreatorWorkItem item;

  const WorkDetailsHeroCard({super.key, required this.item});

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
              Expanded(
                child: Row(
                  children: [
                    Container(
                      width: 44,
                      height: 44,
                      decoration: const BoxDecoration(color: CreatorColors.surfaceContainer, borderRadius: AppRadii.roundedMd),
                      child: const Center(child: Icon(Icons.campaign_rounded, color: CreatorColors.primary, size: 24)),
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
                                  style: AppTextStyles.headlineSm(color: CreatorColors.onSurface).copyWith(fontSize: 16, fontWeight: FontWeight.w700),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              const SizedBox(width: 4),
                              const Icon(Icons.verified_rounded, size: 16, color: CreatorColors.primary),
                            ],
                          ),
                          Text('Deal ID: ${item.dealId}', style: AppTextStyles.labelSm(color: CreatorColors.outline), overflow: TextOverflow.ellipsis),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              MyWorksStatusBadge(status: item.status),
            ],
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            children: [
              _buildTag('Public Campaign', CreatorColors.primary),
              _buildTag(item.category, CreatorColors.onSurfaceVariant),
            ],
          ),
          const SizedBox(height: 8),
          Text(item.campaignTitle, style: AppTextStyles.headlineLg(color: CreatorColors.onSurface).copyWith(fontSize: 20, fontWeight: FontWeight.w800)),
          const SizedBox(height: 12),
          WorkDetailsMetricsTile(agreedFee: item.agreedFee, timeline: item.timeline),
          const SizedBox(height: 12),
          WorkDetailsEscrowBadge(amount: item.escrowLockedAmount),
        ],
      ),
    );
  }

  Widget _buildTag(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      decoration: const BoxDecoration(color: CreatorColors.surfaceContainerLow, borderRadius: AppRadii.roundedFull),
      child: Text(text, style: AppTextStyles.labelSm(color: color).copyWith(fontWeight: FontWeight.w600)),
    );
  }
}
