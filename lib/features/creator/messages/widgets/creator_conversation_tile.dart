import 'package:flutter/material.dart';
import '../../../../core/constants/app_routes.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/theme/creator_colors.dart';
import '../models/creator_conversation_model.dart';
import 'creator_chat_avatar.dart';

class CreatorConversationTile extends StatelessWidget {
  final CreatorConversationModel conversation;

  const CreatorConversationTile({super.key, required this.conversation});

  @override
  Widget build(BuildContext context) {
    final c = conversation;

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: CreatorColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [BoxShadow(color: Color(0x060B1C30), blurRadius: 10, offset: Offset(0, 2))],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => Navigator.of(context).pushNamed(AppRoutes.creatorChatDetail),
          borderRadius: BorderRadius.circular(18),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CreatorChatAvatar(avatarUrl: c.avatarUrl, isVerified: c.isVerified),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(child: Text(c.brandName, style: AppTextStyles.headlineSm(color: CreatorColors.onSurface), maxLines: 1, overflow: TextOverflow.ellipsis)),
                              Text(c.timeAgo, style: AppTextStyles.labelSm(color: c.unreadCount > 0 ? CreatorColors.primary : CreatorColors.outline).copyWith(fontWeight: c.unreadCount > 0 ? FontWeight.w700 : FontWeight.w400)),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Wrap(
                            spacing: 6,
                            runSpacing: 4,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                decoration: BoxDecoration(color: CreatorColors.surfaceContainerLow, borderRadius: BorderRadius.circular(12)),
                                child: Text(c.campaignTag, style: AppTextStyles.labelSm(color: CreatorColors.onSurfaceVariant)),
                              ),
                              if (c.statusTag != null)
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                  decoration: BoxDecoration(color: c.isStatusEscrow ? CreatorColors.secondaryFixed : CreatorColors.surfaceContainerHigh, borderRadius: BorderRadius.circular(12)),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      if (c.statusIcon != null) ...[Icon(c.statusIcon, size: 10, color: CreatorColors.primary), const SizedBox(width: 3)],
                                      Text(c.statusTag!, style: AppTextStyles.labelSm(color: CreatorColors.primary).copyWith(fontWeight: FontWeight.w700)),
                                    ],
                                  ),
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.only(left: 56.0),
                  child: Row(
                    children: [
                      Expanded(child: Text(c.lastMessage, style: AppTextStyles.bodyMd(color: c.unreadCount > 0 ? CreatorColors.onSurface : CreatorColors.onSurfaceVariant).copyWith(fontWeight: c.unreadCount > 0 ? FontWeight.w600 : FontWeight.w400), maxLines: 1, overflow: TextOverflow.ellipsis)),
                      if (c.unreadCount > 0)
                        Container(margin: const EdgeInsets.only(left: 6), width: 20, height: 20, decoration: const BoxDecoration(color: CreatorColors.primary, shape: BoxShape.circle), child: Center(child: Text('${c.unreadCount}', style: AppTextStyles.labelSm(color: Colors.white).copyWith(fontWeight: FontWeight.w700))))
                      else
                        const Icon(Icons.done_all_rounded, size: 16, color: CreatorColors.primary),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
