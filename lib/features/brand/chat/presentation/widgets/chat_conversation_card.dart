import 'package:flutter/material.dart';
import 'package:creator_side/core/theme/app_colors.dart';
import 'package:creator_side/core/theme/app_text_styles.dart';
import 'package:creator_side/features/brand/chat/data/models/chat_conversation_model.dart';
import 'chat_conversation_parts.dart';

/// Full conversation list tile for the Brand Messages screen.
class ChatConversationCard extends StatelessWidget {
  final ChatConversationModel convo;
  final VoidCallback onTap;

  const ChatConversationCard({
    super.key,
    required this.convo,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ChatConversationAvatar(convo: convo),
                    const SizedBox(width: 12),
                    Expanded(child: ChatConversationInfo(convo: convo)),
                    _TimeAndBadge(convo: convo),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  convo.lastMessage,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.bodyMd(color: AppColors.onSurface)
                      .copyWith(
                    fontWeight: convo.unreadCount > 0
                        ? FontWeight.w600
                        : FontWeight.w400,
                  ),
                ),
                if (convo.attachmentName != null) ...[
                  const SizedBox(height: 8),
                  _AttachmentPill(convo: convo),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _TimeAndBadge extends StatelessWidget {
  final ChatConversationModel convo;
  const _TimeAndBadge({required this.convo});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          convo.timestamp,
          style: AppTextStyles.labelSm(
            color: convo.unreadCount > 0
                ? AppColors.primary
                : AppColors.tertiary,
          ).copyWith(
            fontWeight: convo.unreadCount > 0
                ? FontWeight.w700
                : FontWeight.w400,
          ),
        ),
        const SizedBox(height: 4),
        if (convo.unreadCount > 0)
          Container(
            width: 20,
            height: 20,
            decoration: const BoxDecoration(
              color: AppColors.primary,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                '${convo.unreadCount}',
                style: AppTextStyles.labelSm(color: Colors.white)
                    .copyWith(fontSize: 10, fontWeight: FontWeight.w800),
              ),
            ),
          )
        else if (convo.hasUnreadDot)
          Container(
            width: 10,
            height: 10,
            decoration: const BoxDecoration(
              color: AppColors.primary,
              shape: BoxShape.circle,
            ),
          ),
      ],
    );
  }
}

class _AttachmentPill extends StatelessWidget {
  final ChatConversationModel convo;
  const _AttachmentPill({required this.convo});

  @override
  Widget build(BuildContext context) {
    final isContract = convo.attachmentType == 'contract';
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(
              convo.attachmentType == 'video'
                  ? Icons.videocam_rounded
                  : isContract
                      ? Icons.draw_rounded
                      : Icons.attachment_rounded,
              size: 15,
              color: isContract ? AppColors.primary : AppColors.secondary,
            ),
            const SizedBox(width: 5),
            Text(
              convo.attachmentName!,
              style: AppTextStyles.labelSm(color: AppColors.onSurfaceVariant)
                  .copyWith(fontWeight: FontWeight.w600),
            ),
          ],
        ),
        Icon(
          Icons.chevron_right_rounded,
          size: 18,
          color: AppColors.tertiary.withValues(alpha: 0.5),
        ),
      ],
    );
  }
}
