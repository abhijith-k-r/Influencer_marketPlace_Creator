import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:creator_side/core/theme/app_colors.dart';
import 'package:creator_side/core/widgets/shared/app_filter_row.dart';
import 'package:creator_side/core/widgets/shared/app_loading_center.dart';
import 'package:creator_side/core/widgets/shared/app_scaffold.dart';
import '../../bloc/chat_bloc.dart';
import '../../bloc/chat_event.dart';
import '../../bloc/chat_state.dart';
import '../../data/models/chat_conversation_model.dart';
import '../widgets/chat_conversation_card.dart';
import '../widgets/chat_discovery_prompt.dart';
import '../widgets/chat_escrow_notice_bar.dart';
import '../widgets/chat_list_header.dart';
import 'individual_chat_screen.dart';

/// Brand Messages list screen — wired to ChatBloc, decomposed into sub-widgets (<95 LOC).
class ChatListScreen extends StatelessWidget {
  const ChatListScreen({super.key});

  static const _filters = [
    {'id': 'all', 'label': 'All Messages'},
    {'id': 'unread', 'label': 'Unread'},
    {'id': 'deals', 'label': 'Active Deals'},
    {'id': 'negotiations', 'label': 'Negotiations'},
  ];

  void _openChat(BuildContext context, ChatConversationModel convo) {
    context.read<ChatBloc>().add(OpenConversationEvent(convo.id));
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => IndividualChatScreen(
          creatorName: convo.creatorName,
          niche: convo.niche,
          avatarUrl: convo.avatarUrl,
          campaignTitle: convo.campaignTag,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    context.read<ChatBloc>().add(const LoadConversationsEvent());
    return AppScaffold(
      backgroundColor: AppColors.background,
      useSafeArea: true,
      body: Column(
        children: [
          const ChatListHeader(),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BlocBuilder<ChatBloc, ChatState>(
                    buildWhen: (p, c) => p.activeFilter != c.activeFilter,
                    builder: (context, state) => AppFilterRow(
                      filters: _filters.map((f) => f['label']!).toList(),
                      selectedFilter: _filters.firstWhere(
                        (f) => f['id'] == state.activeFilter,
                        orElse: () => _filters.first,
                      )['label']!,
                      onFilterChanged: (label) {
                        final id = _filters.firstWhere((f) => f['label'] == label)['id']!;
                        context.read<ChatBloc>().add(SelectChatFilterEvent(id));
                      },
                    ),
                  ),
                  const SizedBox(height: 12),
                  const ChatEscrowNoticeBar(),
                  const SizedBox(height: 14),
                  BlocBuilder<ChatBloc, ChatState>(
                    builder: (context, state) {
                      if (state.status == ChatStatus.loading && state.conversations.isEmpty) {
                        return const AppLoadingCenter();
                      }
                      return ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: state.conversations.length,
                        separatorBuilder: (_, _) => const SizedBox(height: 10),
                        itemBuilder: (_, i) => ChatConversationCard(
                          convo: state.conversations[i],
                          onTap: () => _openChat(context, state.conversations[i]),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  ChatDiscoveryPrompt(onDiscover: () {}),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
