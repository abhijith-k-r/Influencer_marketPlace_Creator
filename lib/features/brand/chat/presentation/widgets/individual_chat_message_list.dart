import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_radii.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../bloc/chat_bloc.dart';
import '../../bloc/chat_state.dart';
import '../../data/models/chat_message_model.dart';
import 'chat_bubble.dart';
import 'chat_video_attachment.dart';
import 'milestone_action_bar.dart';

/// Self-scrolling message list component for brand chat thread (<95 LOC).
class IndividualChatMessageList extends StatefulWidget {
  const IndividualChatMessageList({super.key});

  @override
  State<IndividualChatMessageList> createState() => _IndividualChatMessageListState();
}

class _IndividualChatMessageListState extends State<IndividualChatMessageList> {
  final ScrollController _scrollController = ScrollController();

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChatBloc, ChatState>(
      listener: (context, state) => _scrollToBottom(),
      builder: (context, state) {
        return ListView(
          controller: _scrollController,
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          children: [
            Center(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
                decoration: BoxDecoration(
                  color: AppColors.surfaceContainerHigh,
                  borderRadius: AppRadii.roundedPill,
                ),
                child: Text(
                  'Today, October 24',
                  style: AppTextStyles.labelSm(color: AppColors.onSurfaceVariant)
                      .copyWith(letterSpacing: 0.8),
                ),
              ),
            ),
            const SizedBox(height: 16),
            ...state.activeMessages.map((msg) {
              if (msg.type == MessageType.videoAttachment) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: ChatVideoAttachment(
                    message: msg,
                    onPlay: () {},
                    onDownload: () {},
                  ),
                );
              }
              return Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: ChatBubble(message: msg),
              );
            }),
            const SizedBox(height: 12),
            MilestoneActionBar(
              onViewAgreement: () {},
              onPaymentEscrow: () {},
            ),
            const SizedBox(height: 12),
          ],
        );
      },
    );
  }
}
