import 'package:flutter/material.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/theme/creator_colors.dart';
import 'creator_chat_quick_pills.dart';

class CreatorChatBottomBar extends StatefulWidget {
  final ValueChanged<String> onSendMessage;

  const CreatorChatBottomBar({super.key, required this.onSendMessage});

  @override
  State<CreatorChatBottomBar> createState() => _CreatorChatBottomBarState();
}

class _CreatorChatBottomBarState extends State<CreatorChatBottomBar> {
  final TextEditingController _controller = TextEditingController();

  void _send() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;
    widget.onSendMessage(text);
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: CreatorColors.surfaceBright.withValues(alpha: 0.95),
        border: Border(top: BorderSide(color: CreatorColors.surfaceContainerHigh.withValues(alpha: 0.6))),
      ),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CreatorChatQuickPills(),
            const SizedBox(height: 8),
            Row(
              children: [
                Container(
                  width: 38,
                  height: 38,
                  decoration: const BoxDecoration(color: CreatorColors.surfaceContainerHigh, shape: BoxShape.circle),
                  child: const Icon(Icons.attach_file_rounded, size: 20, color: CreatorColors.primary),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Container(
                    height: 42,
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    decoration: BoxDecoration(color: CreatorColors.surfaceContainerLowest, borderRadius: BorderRadius.circular(22)),
                    child: TextField(
                      controller: _controller,
                      onSubmitted: (_) => _send(),
                      decoration: InputDecoration(
                        hintText: 'Type a message...',
                        hintStyle: AppTextStyles.bodyMd(color: CreatorColors.outline),
                        border: InputBorder.none,
                        isDense: true,
                        contentPadding: const EdgeInsets.symmetric(vertical: 10),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                InkWell(
                  onTap: _send,
                  borderRadius: BorderRadius.circular(22),
                  child: Container(
                    width: 42,
                    height: 42,
                    decoration: BoxDecoration(
                      color: CreatorColors.primary,
                      shape: BoxShape.circle,
                      boxShadow: [BoxShadow(color: CreatorColors.primary.withValues(alpha: 0.3), blurRadius: 8, offset: const Offset(0, 3))],
                    ),
                    child: const Icon(Icons.send_rounded, size: 18, color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
