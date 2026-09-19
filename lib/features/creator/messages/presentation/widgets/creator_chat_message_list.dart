import 'package:flutter/material.dart';
import 'package:creator_side/core/theme/app_radii.dart';
import 'package:creator_side/core/theme/app_text_styles.dart';
import 'package:creator_side/core/theme/creator_colors.dart';
import 'creator_chat_media_card.dart';

class CreatorChatMessageList extends StatelessWidget {
  const CreatorChatMessageList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      children: [
        Center(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: const BoxDecoration(
              color: CreatorColors.surfaceContainerLowest,
              borderRadius: AppRadii.roundedFull,
            ),
            child: Text(
              'TODAY, 11:42 AM',
              style: AppTextStyles.labelSm(
                color: CreatorColors.outline,
              ).copyWith(fontSize: 10, fontWeight: FontWeight.w700),
            ),
          ),
        ),
        const SizedBox(height: 16),
        _buildBrandMessage(
          'Hey Aarav! We reviewed your initial moodboard for the Sneaker Gen-2 campaign. Loving the raw streetwear aesthetic! 🔥',
          '11:42 AM',
        ),
        const SizedBox(height: 12),
        _buildCreatorMessage(
          'Thanks Rhea! Glad you liked the moodboard. Here is the draft video reel preview for Milestone 2.',
          '11:45 AM',
        ),
        const SizedBox(height: 8),
        Align(
          alignment: Alignment.centerRight,
          child: CreatorChatMediaCard(
            title: 'Sneaker_Gen2_Draft_v1.mp4',
            duration: '0:45s',
            fileSize: '38.4 MB',
            onPreview: () {},
          ),
        ),
        const SizedBox(height: 12),
        _buildBrandMessage(
          'This cut is fire! Releasing Milestone 2 (₹15,000) escrow deposit right away. 🚀',
          '11:50 AM',
        ),
      ],
    );
  }

  Widget _buildBrandMessage(String message, String time) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        constraints: const BoxConstraints(maxWidth: 280),
        padding: const EdgeInsets.all(12),
        decoration: const BoxDecoration(
          color: CreatorColors.surfaceContainerLowest,
          borderRadius: AppRadii.bubbleIncoming,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              message,
              style: AppTextStyles.bodyMd(color: CreatorColors.onSurface),
            ),
            const SizedBox(height: 4),
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                time,
                style: AppTextStyles.labelSm(color: CreatorColors.outline).copyWith(fontSize: 9),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCreatorMessage(String message, String time) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        constraints: const BoxConstraints(maxWidth: 280),
        padding: const EdgeInsets.all(12),
        decoration: const BoxDecoration(
          color: CreatorColors.primary,
          borderRadius: AppRadii.bubbleOutgoing,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              message,
              style: AppTextStyles.bodyMd(color: Colors.white),
            ),
            const SizedBox(height: 4),
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                time,
                style: AppTextStyles.labelSm(color: Colors.white70).copyWith(fontSize: 9),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
