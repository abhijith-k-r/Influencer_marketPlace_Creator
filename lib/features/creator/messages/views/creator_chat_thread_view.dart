import 'package:flutter/material.dart';
import '../../../../core/theme/creator_colors.dart';
import '../widgets/creator_chat_bottom_bar.dart';
import '../widgets/creator_chat_message_list.dart';
import '../widgets/creator_chat_thread_header.dart';
import '../widgets/creator_milestone_escrow_tracker.dart';

class CreatorChatThreadView extends StatefulWidget {
  final String brandName;

  const CreatorChatThreadView({super.key, this.brandName = 'Chat Thread'});

  @override
  State<CreatorChatThreadView> createState() => _CreatorChatThreadViewState();
}

class _CreatorChatThreadViewState extends State<CreatorChatThreadView> {
  final List<String> _newMessages = [];

  void _handleSendMessage(String text) {
    setState(() => _newMessages.add(text));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CreatorColors.background,
      body: SafeArea(
        child: Column(
          children: [
            CreatorChatThreadHeader(title: widget.brandName),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: CreatorMilestoneEscrowTracker(),
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: CreatorChatMessageList(additionalMessages: _newMessages),
              ),
            ),
            CreatorChatBottomBar(onSendMessage: _handleSendMessage),
          ],
        ),
      ),
    );
  }
}
