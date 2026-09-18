import 'package:flutter/material.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/theme/creator_colors.dart';
import 'creator_chat_media_card.dart';

class CreatorChatMessageList extends StatelessWidget {
  final List<String> additionalMessages;

  const CreatorChatMessageList({super.key, this.additionalMessages = const []});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 12),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(color: CreatorColors.surfaceContainer, borderRadius: BorderRadius.circular(16)),
            child: Text('Today, 10:24 AM', style: AppTextStyles.labelSm(color: CreatorColors.outline)),
          ),
        ),
        _buildCreatorBubble('Hey UrbanKicks team! I just finished editing the draft reel with the 4K color grading in urban street settings. Really excited about this drop! ⚡', '10:24 AM'),
        const CreatorChatMediaCard(),
        _buildBrandBubble('This looks fantastic Aarav! The pacing and transition effects match our moodboard perfectly. We are ready to approve milestone 2! 🔥👟', '10:32 AM'),
        _buildCreatorBubble('Awesome! Could you please sign off on the deliverables checklist and release the escrow milestone?', '10:35 AM'),
        for (final msg in additionalMessages) _buildCreatorBubble(msg, 'Just now'),
      ],
    );
  }

  Widget _buildCreatorBubble(String text, String time) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        constraints: const BoxConstraints(maxWidth: 290),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: CreatorColors.primary,
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(18), topRight: Radius.circular(4), bottomLeft: Radius.circular(18), bottomRight: Radius.circular(18)),
          boxShadow: [BoxShadow(color: CreatorColors.primary.withValues(alpha: 0.2), blurRadius: 8, offset: const Offset(0, 3))],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(text, style: AppTextStyles.bodyMd(color: Colors.white)),
            const SizedBox(height: 4),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(time, style: AppTextStyles.labelSm(color: Colors.white.withValues(alpha: 0.8))),
                const SizedBox(width: 4),
                const Icon(Icons.done_all_rounded, size: 14, color: Colors.white),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBrandBubble(String text, String time) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 32,
            height: 32,
            margin: const EdgeInsets.only(right: 8, top: 2),
            decoration: BoxDecoration(color: CreatorColors.surfaceContainerHighest, borderRadius: BorderRadius.circular(16)),
            child: Center(child: Text('UK', style: AppTextStyles.labelSm(color: CreatorColors.primary).copyWith(fontWeight: FontWeight.w800))),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 12),
            constraints: const BoxConstraints(maxWidth: 270),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: CreatorColors.surfaceContainerLow,
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(4), topRight: Radius.circular(18), bottomLeft: Radius.circular(18), bottomRight: Radius.circular(18)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(text, style: AppTextStyles.bodyMd(color: CreatorColors.onSurface)),
                const SizedBox(height: 4),
                Text(time, style: AppTextStyles.labelSm(color: CreatorColors.outline)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
