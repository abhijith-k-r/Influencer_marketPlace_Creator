import 'package:flutter/material.dart';
import '../../../../core/constants/app_routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../widgets/brand_campaign_context_bar.dart';
import '../widgets/chat_day_divider.dart';
import '../widgets/chat_message_bubble.dart';
import '../widgets/document_attachment_card.dart';
import '../widgets/message_action_chips.dart';
import '../widgets/message_input_bar.dart';
import '../widgets/messages_header.dart';
import '../widgets/storyboard_preview_card.dart';

/// Complete chat and collaboration screen between creator and partner brand.
class CreatorMessageScreen extends StatelessWidget {
  const CreatorMessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            const MessagesHeader(),
            const BrandCampaignContextBar(),
            MessageActionChips(
              onPaymentAgreementTap: () =>
                  Navigator.pushNamed(context, AppRoutes.payments),
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: Column(
                  children: [
                    const ChatDayDivider(text: 'TODAY, 10:42 AM'),
                    const SizedBox(height: 12),
                    const ChatMessageBubble(
                      text:
                          'Hey Alex! We loved your concept storyboard for the WH-1000XM5 reel. Please find the locked agreement terms attached.',
                      time: '10:42 AM',
                    ),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.only(left: 36),
                      child: DocumentAttachmentCard(
                        onReviewTerms: () =>
                            Navigator.pushNamed(context, AppRoutes.payments),
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
                    const ChatMessageBubble(
                      text:
                          'Awesome, once signed we will dispatch the test unit right away!',
                      time: '10:48 AM',
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
            const MessageInputBar(),
          ],
        ),
      ),
    );
  }
}
