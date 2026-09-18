import 'package:flutter/material.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/theme/creator_colors.dart';
import '../models/creator_conversation_model.dart';
import '../models/mock_creator_conversations.dart';
import '../widgets/creator_chat_filter_carousel.dart';
import '../widgets/creator_conversation_tile.dart';
import '../widgets/creator_escrow_anchor_banner.dart';
import '../widgets/creator_messages_app_bar.dart';
import '../widgets/creator_pitch_fab.dart';

class CreatorMessagesView extends StatefulWidget {
  const CreatorMessagesView({super.key});

  @override
  State<CreatorMessagesView> createState() => _CreatorMessagesViewState();
}

class _CreatorMessagesViewState extends State<CreatorMessagesView> {
  String _activeFilter = 'all';

  List<CreatorConversationModel> get _filteredList {
    if (_activeFilter == 'all') return mockCreatorConversations;
    return mockCreatorConversations.where((c) => c.categories.contains(_activeFilter)).toList();
  }

  @override
  Widget build(BuildContext context) {
    final list = _filteredList;

    return Scaffold(
      backgroundColor: CreatorColors.background,
      floatingActionButton: const CreatorPitchFab(),
      body: SafeArea(
        child: Column(
          children: [
            const CreatorMessagesAppBar(),
            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                children: [
                  const CreatorEscrowAnchorBanner(),
                  const SizedBox(height: 10),
                  CreatorChatFilterCarousel(
                    activeFilter: _activeFilter,
                    onFilterChanged: (filter) => setState(() => _activeFilter = filter),
                  ),
                  const SizedBox(height: 12),
                  if (list.isEmpty)
                    Container(
                      padding: const EdgeInsets.all(32),
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          const Icon(Icons.mark_chat_read_outlined, size: 40, color: CreatorColors.outline),
                          const SizedBox(height: 10),
                          Text('No conversations here', style: AppTextStyles.headlineSm(color: CreatorColors.onSurface)),
                          const SizedBox(height: 4),
                          Text('You are completely caught up! New brand inquiries will land here.', textAlign: TextAlign.center, style: AppTextStyles.bodySm(color: CreatorColors.outline)),
                        ],
                      ),
                    )
                  else
                    ...list.map((c) => CreatorConversationTile(conversation: c)),
                  const SizedBox(height: 70),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
