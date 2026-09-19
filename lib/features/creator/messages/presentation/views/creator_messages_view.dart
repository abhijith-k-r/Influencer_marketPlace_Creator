import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:creator_side/core/theme/app_text_styles.dart';
import 'package:creator_side/core/theme/creator_colors.dart';
import 'package:creator_side/core/widgets/creator/creator_section_app_bar.dart';
import 'package:creator_side/core/widgets/shared/app_empty_state.dart';
import 'package:creator_side/core/widgets/shared/app_loading_center.dart';
import 'package:creator_side/core/widgets/shared/app_scaffold.dart';
import '../../bloc/creator_messages_bloc.dart';
import '../../bloc/creator_messages_event.dart';
import '../../bloc/creator_messages_state.dart';
import '../../data/models/mock_creator_conversations.dart';
import '../widgets/creator_chat_filter_carousel.dart';
import '../widgets/creator_conversation_tile.dart';
import '../widgets/creator_pitch_fab.dart';

/// Pure StatelessWidget for Creator Messages tab using AppScaffold & CreatorSectionAppBar (<90 LOC).
class CreatorMessagesView extends StatelessWidget {
  const CreatorMessagesView({super.key});

  @override
  Widget build(BuildContext context) {
    final messagesBloc = context.watch<CreatorMessagesBloc?>();
    final activeFilter = messagesBloc?.state.activeFilter ?? 'all';
    final conversations = messagesBloc?.state.filteredConversations ?? mockCreatorConversations;
    final isLoading = messagesBloc?.state.status == CreatorMessagesStatus.loading;

    return AppScaffold(
      backgroundColor: CreatorColors.background,
      appBar: const CreatorSectionAppBar(
        title: 'Message',
        subtitle: 'CollabConnect',
        leadingIcon: Icons.hub_rounded,
      ),
      floatingActionButton: CreatorPitchFab(onPressed: () {}),
      body: isLoading
          ? const AppLoadingCenter()
          : CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 8),
                    child: CreatorChatFilterCarousel(
                      activeFilter: activeFilter,
                      onFilterChanged: (f) {
                        messagesBloc?.add(FilterCreatorMessages(f));
                      },
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'DIRECT BRAND THREADS',
                          style: AppTextStyles.labelSm(color: CreatorColors.outline).copyWith(
                            letterSpacing: 0.8,
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          '${conversations.length} Active',
                          style: AppTextStyles.labelSm(color: CreatorColors.primary).copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                if (conversations.isEmpty)
                  const SliverFillRemaining(
                    child: AppEmptyState(
                      title: 'No Active Messages',
                      subtitle: 'Direct conversations with brands will appear here.',
                    ),
                  )
                else
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) => CreatorConversationTile(
                        conversation: conversations[index],
                      ),
                      childCount: conversations.length,
                    ),
                  ),
                const SliverToBoxAdapter(child: SizedBox(height: 80)),
              ],
            ),
    );
  }
}
