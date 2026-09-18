import 'package:flutter/material.dart';
import '../../../chat/presentation/views/chat_list_screen.dart';

/// Messages inbox screen matching the current CollabConnect architecture.
/// Forwards seamlessly to [ChatListScreen].
class MessagesInboxScreen extends StatelessWidget {
  const MessagesInboxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ChatListScreen();
  }
}
