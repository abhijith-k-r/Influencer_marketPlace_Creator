import 'package:flutter/material.dart';
import 'package:creator_side/core/theme/app_colors.dart';
import 'review_channel_stat_chip.dart';

/// Row of 3 mini channel reach cards: YouTube, Instagram, and TikTok.
class ReviewReachChannelsRow extends StatelessWidget {
  const ReviewReachChannelsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: ReviewChannelStatChip(
            platform: 'YouTube',
            count: '82K',
            icon: Icons.play_arrow,
            iconBgColor: Color(0x33FFDAD6),
            iconColor: Color(0xFFBA1A1A),
          ),
        ),
        SizedBox(width: 8),
        Expanded(
          child: ReviewChannelStatChip(
            platform: 'Instagram',
            count: '145K',
            icon: Icons.photo_camera,
            iconBgColor: Color(0x80E1E0FF),
            iconColor: AppColors.primary,
          ),
        ),
        SizedBox(width: 8),
        Expanded(
          child: ReviewChannelStatChip(
            platform: 'TikTok',
            count: '210K',
            icon: Icons.music_note,
            iconBgColor: Color(0xFF131B2E),
            iconColor: AppColors.scaffoldBackground,
          ),
        ),
      ],
    );
  }
}
