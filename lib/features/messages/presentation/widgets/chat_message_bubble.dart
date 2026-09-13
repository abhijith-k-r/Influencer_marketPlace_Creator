import 'package:flutter/material.dart';
import 'brand_message_bubble.dart';
import 'creator_message_bubble.dart';

/// Message bubble for both incoming brand messages and outgoing creator messages.
class ChatMessageBubble extends StatelessWidget {
  final String text;
  final String time;
  final bool isFromCreator;

  const ChatMessageBubble({
    super.key,
    required this.text,
    required this.time,
    this.isFromCreator = false,
  });

  @override
  Widget build(BuildContext context) {
    return isFromCreator
        ? CreatorMessageBubble(text: text, time: time)
        : BrandMessageBubble(text: text, time: time);
  }
}
