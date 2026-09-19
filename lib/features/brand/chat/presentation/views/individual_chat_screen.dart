import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:creator_side/core/widgets/shared/app_scaffold.dart';
import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../bloc/chat_bloc.dart';
import '../../bloc/chat_event.dart';
import '../widgets/individual_chat_header.dart';
import '../widgets/individual_chat_message_list.dart';
import '../widgets/individual_chat_sticky_bar.dart';
import '../widgets/message_composer.dart';

/// Pure StatelessWidget direct chat thread view (<60 LOC).
class IndividualChatScreen extends StatelessWidget {
  final String creatorName;
  final String niche;
  final String avatarUrl;
  final String campaignTitle;

  const IndividualChatScreen({
    super.key,
    this.creatorName = 'Aarav Sharma',
    this.niche = 'Sneakerhead & Streetwear',
    this.avatarUrl = AppAssets.aaravSharmaChat,
    this.campaignTitle = 'Sneaker Gen-2 Drop',
  });

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      backgroundColor: AppColors.background,
      useSafeArea: true,
      body: Column(
        children: [
          IndividualChatHeader(
            creatorName: creatorName,
            niche: niche,
            avatarUrl: avatarUrl,
            onBackTap: () => Navigator.of(context).pop(),
          ),
          IndividualChatStickyBar(campaignTitle: campaignTitle),
          const Expanded(
            child: IndividualChatMessageList(),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: MessageComposer(
              onSend: (text) => context.read<ChatBloc>().add(
                    SendTextMessageEvent(
                      threadId: 'thread-aarav',
                      text: text,
                    ),
                  ),
              onAttach: () {},
              onEmoji: () {},
            ),
          ),
        ],
      ),
    );
  }
}
