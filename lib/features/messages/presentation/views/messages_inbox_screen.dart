import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../data/datasources/inbox_threads_filter.dart';
import '../../data/datasources/mock_message_threads.dart';
import '../widgets/inbox_content_body.dart';
import '../widgets/inbox_screen_actions.dart';
import '../widgets/messages_header.dart';

/// Messages Inbox & Active Threads screen matching the Lumina specification.
class MessagesInboxScreen extends StatefulWidget {
  const MessagesInboxScreen({super.key});

  @override
  State<MessagesInboxScreen> createState() => _MessagesInboxScreenState();
}

class _MessagesInboxScreenState extends State<MessagesInboxScreen>
    with SingleTickerProviderStateMixin {
  late final TextEditingController _searchController;
  late final AnimationController _pulseController;
  late final Animation<double> _pulseAnimation;
  InboxFilter _selectedFilter = InboxFilter.all;
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat(reverse: true);
    _pulseAnimation = Tween<double>(begin: 0.8, end: 1.25).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    _pulseController.dispose();
    super.dispose();
  }

  void _onFilterTap() => setState(
    () => _selectedFilter = _selectedFilter == InboxFilter.all
        ? InboxFilter.activeDeals
        : InboxFilter.all,
  );

  void _onSearchClear() => setState(() {
    _searchController.clear();
    _searchQuery = '';
  });

  @override
  Widget build(BuildContext context) {
    final filtered = InboxThreadsFilter.filter(
      threads: MockMessageThreads.threads,
      query: _searchQuery,
      filter: _selectedFilter,
    );

    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            const MessagesHeader(title: 'Messages'),
            Expanded(
              child: InboxContentBody(
                pulseAnimation: _pulseAnimation,
                searchController: _searchController,
                selectedFilter: _selectedFilter,
                deals: filtered.where((t) => t.isDeal).toList(),
                inbounds: filtered.where((t) => !t.isDeal).toList(),
                onSearchChanged: (v) => setState(() => _searchQuery = v.trim()),
                onSearchClear: _onSearchClear,
                onFilterSelected: (f) => setState(() => _selectedFilter = f),
                onFilterTap: _onFilterTap,
                onComposeTap: () => InboxScreenActions.showComposeHint(context),
                onOpenChat: (t) => InboxScreenActions.openChat(context, t),
                onViewBrief: (r) =>
                    InboxScreenActions.showBriefModal(context, r),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
