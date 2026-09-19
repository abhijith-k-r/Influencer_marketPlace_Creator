import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:creator_side/core/theme/creator_colors.dart';
import 'package:creator_side/core/widgets/shared/app_scaffold.dart';
import 'package:creator_side/features/creator/messages/data/models/creator_conversation_model.dart';
import 'package:creator_side/features/creator/messages/data/models/mock_creator_conversations.dart';
import '../../bloc/creator_chat_input_cubit.dart';
import '../widgets/creator_chat_bottom_bar.dart';
import '../widgets/creator_chat_message_list.dart';
import '../widgets/creator_chat_quick_pills.dart';
import '../widgets/creator_chat_thread_header.dart';
import '../widgets/creator_escrow_anchor_banner.dart';

/// Pure StatelessWidget creator direct chat thread view (<70 LOC).
class CreatorChatThreadView extends StatelessWidget {
  final CreatorConversationModel? conversation;

  const CreatorChatThreadView({super.key, this.conversation});

  @override
  Widget build(BuildContext context) {
    final routeConv = ModalRoute.of(context)?.settings.arguments as CreatorConversationModel?;
    final conv = conversation ?? routeConv ?? mockCreatorConversations.first;

    return BlocProvider(
      create: (_) => CreatorChatInputCubit(),
      child: AppScaffold(
        backgroundColor: CreatorColors.background,
        useSafeArea: true,
        body: Builder(
          builder: (context) => Column(
            children: [
              CreatorChatThreadHeader(
                brandName: conv.brandName,
                campaignTag: conv.campaignTag,
                avatarUrl: conv.avatarUrl,
                isOnline: conv.isOnline,
              ),
              CreatorEscrowAnchorBanner(
                amount: conv.statusTag ?? '₹45,000',
                status: conv.footerNote.isNotEmpty ? conv.footerNote : 'Milestone In Progress',
                onDetailsTap: () {},
              ),
              const Expanded(
                child: CreatorChatMessageList(),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: CreatorChatQuickPills(
                  onSelect: (pill) => context.read<CreatorChatInputCubit>().setInput(pill),
                ),
              ),
              CreatorChatBottomBar(
                onSend: () => context.read<CreatorChatInputCubit>().clear(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
