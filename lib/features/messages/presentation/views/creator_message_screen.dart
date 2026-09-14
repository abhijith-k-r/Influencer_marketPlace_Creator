import 'package:flutter/material.dart';
import '../../../../core/constants/app_routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../data/datasources/mock_message_threads.dart';
import '../../data/models/message_thread_model.dart';
import '../widgets/brand_campaign_context_bar.dart';
import '../widgets/conversation_message_list.dart';
import '../widgets/message_action_chips.dart';
import '../widgets/message_input_bar.dart';
import '../widgets/messages_header.dart';

/// Complete chat and collaboration screen between creator and partner brand.
class CreatorMessageScreen extends StatelessWidget {
  final MessageThreadModel? thread;
  final VoidCallback? onBack;

  const CreatorMessageScreen({super.key, this.thread, this.onBack});

  @override
  Widget build(BuildContext context) {
    final activeThread = thread ?? MockMessageThreads.threads.first;

    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            MessagesHeader(
              title: activeThread.brandName,
              showBackButton: true,
              onBack: onBack ??
                  (Navigator.canPop(context) ? () => Navigator.pop(context) : null),
            ),
            BrandCampaignContextBar(
              brandName: activeThread.brandName,
              campaignName: activeThread.campaignName,
              isVerified: activeThread.isVerified,
              avatarUrl: activeThread.avatarUrl,
              status: activeThread.statusText.isNotEmpty
                  ? activeThread.statusText
                  : 'Active',
            ),
            MessageActionChips(
              onPaymentAgreementTap: () =>
                  Navigator.pushNamed(context, AppRoutes.payments),
            ),
            Expanded(
              child: ConversationMessageList(thread: activeThread),
            ),
            const MessageInputBar(),
          ],
        ),
      ),
    );
  }
}
