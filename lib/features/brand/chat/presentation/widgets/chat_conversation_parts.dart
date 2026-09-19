import 'package:flutter/material.dart';
import 'package:creator_side/core/theme/app_colors.dart';
import 'package:creator_side/core/widgets/shared/app_network_avatar.dart';
import 'package:creator_side/features/brand/chat/data/models/chat_conversation_model.dart';

/// Avatar with online dot for a chat conversation tile.
class ChatConversationAvatar extends StatelessWidget {
  final ChatConversationModel convo;

  const ChatConversationAvatar({super.key, required this.convo});

  @override
  Widget build(BuildContext context) {
    return AppNetworkAvatar(
      imageUrl: convo.avatarUrl,
      radius: 26,
      isOnline: true,
      fallbackIcon: Icons.person,
    );
  }
}

/// Name, niche chip, and campaign tag row for a conversation tile.
class ChatConversationInfo extends StatelessWidget {
  final ChatConversationModel convo;

  const ChatConversationInfo({super.key, required this.convo});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Flexible(
              child: Text(
                convo.creatorName,
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: AppColors.onSurface,
                      fontWeight: FontWeight.w700,
                    ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(width: 6),
            Text(
              convo.niche,
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: AppColors.tertiary,
                  ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha: 0.08),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 6,
                height: 6,
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 5),
              Flexible(
                child: Text(
                  convo.campaignTag,
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w700,
                      ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
