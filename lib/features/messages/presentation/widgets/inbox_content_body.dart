import 'package:flutter/material.dart';
import '../../data/models/message_thread_model.dart';
import 'active_campaigns_section.dart';
import 'brand_inbounds_section.dart';
import 'inbox_delight_footer.dart';
import 'inbox_empty_state.dart';
import 'inbox_filter_pills.dart';
import 'inbox_search_bar.dart';
import 'inbox_top_bar.dart';

/// Scrollable inbox content body containing filters, searches, and thread feeds.
class InboxContentBody extends StatelessWidget {
  final Animation<double> pulseAnimation;
  final TextEditingController searchController;
  final InboxFilter selectedFilter;
  final List<MessageThreadModel> deals;
  final List<MessageThreadModel> inbounds;
  final ValueChanged<String> onSearchChanged;
  final VoidCallback onSearchClear;
  final ValueChanged<InboxFilter> onFilterSelected;
  final VoidCallback onFilterTap;
  final VoidCallback onComposeTap;
  final ValueChanged<MessageThreadModel> onOpenChat;
  final ValueChanged<MessageThreadModel> onViewBrief;

  const InboxContentBody({
    super.key,
    required this.pulseAnimation,
    required this.searchController,
    required this.selectedFilter,
    required this.deals,
    required this.inbounds,
    required this.onSearchChanged,
    required this.onSearchClear,
    required this.onFilterSelected,
    required this.onFilterTap,
    required this.onComposeTap,
    required this.onOpenChat,
    required this.onViewBrief,
  });

  @override
  Widget build(BuildContext context) {
    final bool isEmpty = deals.isEmpty && inbounds.isEmpty;

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InboxTopBar(
            pulseAnimation: pulseAnimation,
            onFilterTap: onFilterTap,
            onComposeTap: onComposeTap,
          ),
          const SizedBox(height: 14),
          InboxSearchBar(
            controller: searchController,
            onChanged: onSearchChanged,
            onClear: onSearchClear,
          ),
          const SizedBox(height: 12),
          InboxFilterPills(
            selectedFilter: selectedFilter,
            onFilterSelected: onFilterSelected,
          ),
          const SizedBox(height: 16),
          if (selectedFilter != InboxFilter.inquiries)
            ActiveCampaignsSection(deals: deals, onDealTap: onOpenChat),
          if (selectedFilter != InboxFilter.activeDeals)
            BrandInboundsSection(
              inbounds: inbounds,
              onViewBrief: onViewBrief,
              onAcceptReply: onOpenChat,
            ),
          if (isEmpty) InboxEmptyState(selectedFilter: selectedFilter),
          const InboxDelightFooter(),
        ],
      ),
    );
  }
}
