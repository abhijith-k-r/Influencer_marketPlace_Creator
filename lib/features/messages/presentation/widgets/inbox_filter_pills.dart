import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../data/models/inbox_filter.dart';
import 'inbox_chip_item.dart';

export '../../data/models/inbox_filter.dart';

/// Horizontal category filter pills for the inbox.
class InboxFilterPills extends StatelessWidget {
  final InboxFilter selectedFilter;
  final ValueChanged<InboxFilter> onFilterSelected;
  final int allCount;
  final int activeDealsCount;
  final int inquiriesCount;

  const InboxFilterPills({
    super.key,
    required this.selectedFilter,
    required this.onFilterSelected,
    this.allCount = 6,
    this.activeDealsCount = 3,
    this.inquiriesCount = 2,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Row(
        children: [
          InboxChipItem(
            title: 'All',
            isSelected: selectedFilter == InboxFilter.all,
            count: allCount,
            countBg: AppColors.strengthInactive,
            countColor: AppColors.textPrimary,
            onTap: () => onFilterSelected(InboxFilter.all),
          ),
          const SizedBox(width: 8),
          InboxChipItem(
            title: 'Active Deals',
            isSelected: selectedFilter == InboxFilter.activeDeals,
            count: activeDealsCount,
            countBg: AppColors.pillBackground,
            countColor: AppColors.primaryDark,
            onTap: () => onFilterSelected(InboxFilter.activeDeals),
          ),
          const SizedBox(width: 8),
          InboxChipItem(
            title: 'Inquiries',
            isSelected: selectedFilter == InboxFilter.inquiries,
            count: inquiriesCount,
            countBg: AppColors.liveBadgeBackground,
            countColor: AppColors.textPrimary,
            onTap: () => onFilterSelected(InboxFilter.inquiries),
          ),
          const SizedBox(width: 8),
          InboxChipItem(
            title: 'Archived',
            isSelected: selectedFilter == InboxFilter.archived,
            onTap: () => onFilterSelected(InboxFilter.archived),
          ),
        ],
      ),
    );
  }
}
