import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../data/models/message_thread_model.dart';
import 'deal_deliverable_tags.dart';
import 'deal_status_ribbon.dart';

/// Middle text column of an active deal card with title, role, tags, preview, and ribbon.
class DealContentBody extends StatelessWidget {
  final MessageThreadModel thread;

  const DealContentBody({super.key, required this.thread});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                thread.brandName,
                style: AppTextStyles.h4.copyWith(fontSize: 15),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(width: 6),
            Text(
              thread.time,
              style: AppTextStyles.caption.copyWith(
                fontWeight: thread.isUnread ? FontWeight.w700 : FontWeight.w500,
                color: thread.isUnread ? AppColors.primary : AppColors.textSecondary,
              ),
            ),
          ],
        ),
        const SizedBox(height: 2),
        Text(
          '${thread.contactName} • ${thread.contactRole}',
          style: AppTextStyles.bodySmall,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 8),
        DealDeliverableTags(
          campaignName: thread.campaignName,
          deliverableSummary: thread.deliverableSummary,
          deliverableIcon: thread.deliverableIcon,
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: Text(
                thread.lastMessage,
                style: AppTextStyles.bodySmall.copyWith(
                  fontWeight: thread.isUnread ? FontWeight.w600 : FontWeight.w400,
                  color: thread.isUnread ? AppColors.textPrimary : AppColors.textSecondary,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            if (thread.isUnread) ...[
              const SizedBox(width: 8),
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ],
        ),
        const SizedBox(height: 10),
        DealStatusRibbon(
          statusIcon: thread.statusIcon,
          statusText: thread.statusText,
          dealAmount: thread.dealAmount,
        ),
      ],
    );
  }
}
