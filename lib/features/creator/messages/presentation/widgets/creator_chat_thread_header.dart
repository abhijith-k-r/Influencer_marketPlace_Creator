import 'package:flutter/material.dart';
import 'package:creator_side/core/theme/app_text_styles.dart';
import 'package:creator_side/core/theme/creator_colors.dart';
import 'creator_chat_avatar.dart';

class CreatorChatThreadHeader extends StatelessWidget implements PreferredSizeWidget {
  final String brandName;
  final String campaignTag;
  final String? avatarUrl;
  final bool isOnline;

  const CreatorChatThreadHeader({
    super.key,
    required this.brandName,
    required this.campaignTag,
    this.avatarUrl,
    this.isOnline = true,
  });

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: const BoxDecoration(
        color: CreatorColors.surfaceContainerLowest,
        border: Border(bottom: BorderSide(color: Color(0x1A000000), width: 1)),
      ),
      child: SafeArea(
        child: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 20),
              color: CreatorColors.onSurface,
              onPressed: () => Navigator.of(context).pop(),
            ),
            CreatorChatAvatar(
              avatarUrl: avatarUrl,
              isOnline: isOnline,
              radius: 18,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          brandName,
                          style: AppTextStyles.labelLg(
                            color: CreatorColors.onSurface,
                          ).copyWith(fontWeight: FontWeight.w700),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(width: 4),
                      const Icon(Icons.verified_rounded, size: 14, color: CreatorColors.primaryContainer),
                    ],
                  ),
                  Text(
                    campaignTag,
                    style: AppTextStyles.labelSm(
                      color: CreatorColors.outline,
                    ).copyWith(fontSize: 10),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(Icons.phone_outlined, size: 20),
              color: CreatorColors.primary,
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.more_vert_rounded, size: 20),
              color: CreatorColors.onSurfaceVariant,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
