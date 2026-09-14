import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../data/models/message_thread_model.dart';
import 'active_deal_card.dart';

/// Section listing active deals and priority threads.
class ActiveCampaignsSection extends StatelessWidget {
  final List<MessageThreadModel> deals;
  final ValueChanged<MessageThreadModel> onDealTap;

  const ActiveCampaignsSection({
    super.key,
    required this.deals,
    required this.onDealTap,
  });

  @override
  Widget build(BuildContext context) {
    if (deals.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 9,
                  height: 9,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary.withValues(alpha: 0.4),
                        blurRadius: 6,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  'Active Campaign Threads',
                  style: AppTextStyles.h4.copyWith(fontSize: 15),
                ),
              ],
            ),
            Text(
              'HIGH PRIORITY',
              style: AppTextStyles.caption.copyWith(
                fontSize: 10,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.6,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: deals.length,
          separatorBuilder: (_, _) => const SizedBox(height: 10),
          itemBuilder: (context, index) {
            final deal = deals[index];
            return ActiveDealCard(
              thread: deal,
              onTap: () => onDealTap(deal),
            );
          },
        ),
        const SizedBox(height: 18),
      ],
    );
  }
}
