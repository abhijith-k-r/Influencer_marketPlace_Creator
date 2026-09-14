import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_radii.dart';
import '../../../../core/theme/app_text_styles.dart';
import 'inbox_filter_pills.dart';

/// Clean empty state placeholder when searches or filters return zero matches.
class InboxEmptyState extends StatelessWidget {
  final InboxFilter selectedFilter;

  const InboxEmptyState({super.key, required this.selectedFilter});

  @override
  Widget build(BuildContext context) {
    final bool isArchived = selectedFilter == InboxFilter.archived;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Center(
        child: Column(
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: AppColors.inputBackground,
                borderRadius: BorderRadius.circular(AppRadii.lg),
              ),
              child: const Icon(
                Icons.chat_bubble_outline_rounded,
                size: 28,
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              isArchived
                  ? 'No Archived Threads'
                  : 'No messages matching your search',
              style: AppTextStyles.h4.copyWith(fontSize: 14),
            ),
            const SizedBox(height: 4),
            Text(
              isArchived
                  ? 'Past completed campaign chats will appear here.'
                  : 'Try searching for another partner brand or clear filter.',
              style: AppTextStyles.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
