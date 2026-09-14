import 'package:flutter/material.dart';
import '../../../../core/constants/app_routes.dart';
import '../../data/models/message_thread_model.dart';
import 'chat_day_divider.dart';
import 'chat_message_bubble.dart';
import 'document_attachment_card.dart';
import 'storyboard_preview_card.dart';

/// Scrollable message feed for an active brand collaboration thread.
class ConversationMessageList extends StatelessWidget {
  final MessageThreadModel thread;

  const ConversationMessageList({super.key, required this.thread});

  @override
  Widget build(BuildContext context) {
    final bool isSony = thread.id == 'deal_sony_audio';

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        children: [
          ChatDayDivider(text: isSony ? 'TODAY, 10:42 AM' : 'OCTOBER 2026'),
          const SizedBox(height: 12),
          if (isSony) ...[
            const ChatMessageBubble(
              text:
                  'Hey Alex! We loved your concept storyboard for the WH-1000XM5 reel. Please find the locked agreement terms attached.',
              time: '10:42 AM',
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(left: 36),
              child: DocumentAttachmentCard(
                onReviewTerms: () => Navigator.pushNamed(context, AppRoutes.payments),
              ),
            ),
            const SizedBox(height: 14),
            const ChatMessageBubble(
              text:
                  'Thanks Sarah! Reviewing now. The delivery schedule works perfectly with our studio shoot this Thursday.',
              time: '10:45 AM',
              isFromCreator: true,
            ),
            const SizedBox(height: 8),
            const StoryboardPreviewCard(),
            const SizedBox(height: 14),
            ChatMessageBubble(text: thread.lastMessage, time: thread.time),
          ] else ...[
            ChatMessageBubble(
              text: thread.inboundQuote ??
                  'Hello Alex! Looking forward to collaborating on ${thread.campaignName}.',
              time: thread.time,
            ),
            const SizedBox(height: 14),
            const ChatMessageBubble(
              text: 'Hi there! Thanks for reaching out. Excited to explore this collaboration.',
              time: 'Just now',
              isFromCreator: true,
            ),
            const SizedBox(height: 14),
            ChatMessageBubble(text: thread.lastMessage, time: thread.time),
          ],
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
