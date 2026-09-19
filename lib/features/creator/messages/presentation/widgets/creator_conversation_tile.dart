import 'package:flutter/material.dart';
import 'package:creator_side/core/constants/app_routes.dart';
import 'package:creator_side/core/theme/app_radii.dart';
import 'package:creator_side/core/theme/app_shadows.dart';
import 'package:creator_side/core/theme/app_text_styles.dart';
import 'package:creator_side/core/theme/creator_colors.dart';
import 'package:creator_side/features/creator/messages/data/models/creator_conversation_model.dart';
import 'creator_chat_avatar.dart';

class CreatorConversationTile extends StatelessWidget {
  final CreatorConversationModel conversation;
  final VoidCallback? onTap;

  const CreatorConversationTile({
    super.key,
    required this.conversation,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      decoration: const BoxDecoration(
        color: CreatorColors.surfaceContainerLowest,
        borderRadius: AppRadii.roundedXl,
        boxShadow: AppShadows.cardSoft,
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: AppRadii.roundedXl,
        child: InkWell(
          borderRadius: AppRadii.roundedXl,
          onTap: onTap ??
              () {
                Navigator.of(context).pushNamed(
                  AppRoutes.creatorChatDetail,
                  arguments: conversation,
                );
              },
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CreatorChatAvatar(
                      avatarUrl: conversation.avatarUrl,
                      isOnline: conversation.isOnline,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Row(
                                  children: [
                                    Flexible(
                                      child: Text(
                                        conversation.brandName,
                                        style: AppTextStyles.labelLg(
                                          color: CreatorColors.onSurface,
                                        ).copyWith(fontWeight: FontWeight.w700),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    if (conversation.isVerified) ...[
                                      const SizedBox(width: 4),
                                      const Icon(
                                        Icons.verified_rounded,
                                        size: 14,
                                        color: CreatorColors.primaryContainer,
                                      ),
                                    ],
                                  ],
                                ),
                              ),
                              Text(
                                conversation.timeAgo,
                                style: AppTextStyles.labelSm(
                                  color: CreatorColors.outline,
                                ).copyWith(fontSize: 10),
                              ),
                            ],
                          ),
                          const SizedBox(height: 2),
                          Text(
                            conversation.campaignTag,
                            style: AppTextStyles.labelSm(
                              color: CreatorColors.primary,
                            ).copyWith(fontWeight: FontWeight.w600),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  conversation.lastMessage,
                  style: AppTextStyles.bodySm(
                    color: conversation.unreadCount > 0
                        ? CreatorColors.onSurface
                        : CreatorColors.outline,
                  ).copyWith(
                    fontWeight: conversation.unreadCount > 0 ? FontWeight.w600 : FontWeight.normal,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (conversation.footerNote.isNotEmpty)
                      Row(
                        children: [
                          if (conversation.footerIcon != null) ...[
                            Icon(conversation.footerIcon, size: 14, color: CreatorColors.outline),
                            const SizedBox(width: 4),
                          ],
                          Text(
                            conversation.footerNote,
                            style: AppTextStyles.labelSm(
                              color: CreatorColors.outline,
                            ).copyWith(fontSize: 10),
                          ),
                        ],
                      )
                    else
                      const SizedBox.shrink(),
                    if (conversation.unreadCount > 0)
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: const BoxDecoration(
                          color: CreatorColors.primary,
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          '${conversation.unreadCount}',
                          style: AppTextStyles.labelSm(
                            color: Colors.white,
                          ).copyWith(fontSize: 10, fontWeight: FontWeight.w800),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
