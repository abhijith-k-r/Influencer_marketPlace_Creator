import 'package:flutter/material.dart';
import '../../data/models/message_thread_model.dart';
import '../views/creator_message_screen.dart';
import 'brief_details_modal.dart';

/// Navigation and prompt action handlers for Messages Inbox.
abstract final class InboxScreenActions {
  static void openChat(BuildContext context, MessageThreadModel thread) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => CreatorMessageScreen(thread: thread)),
    );
  }

  static void showComposeHint(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Search brands in Campaigns tab to initiate collaboration briefs.'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  static void showBriefModal(BuildContext context, MessageThreadModel req) {
    BriefDetailsModal.show(
      context,
      thread: req,
      onAccept: () => openChat(context, req),
    );
  }
}
