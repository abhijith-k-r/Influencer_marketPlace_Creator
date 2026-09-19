import 'package:flutter/material.dart';
import 'package:creator_side/core/constants/app_assets.dart';
import 'package:creator_side/core/theme/app_colors.dart';
import 'package:creator_side/core/widgets/shared/app_brand_logo_row.dart';
import 'package:creator_side/core/widgets/shared/app_icon_button.dart';
import 'package:creator_side/core/widgets/shared/app_network_avatar.dart';

/// Top header bar for the Brand Messages / Chat List screen.
class ChatListHeader extends StatelessWidget {
  const ChatListHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLowest.withValues(alpha: 0.95),
        border: Border(
          bottom: BorderSide(
            color: AppColors.surfaceContainer.withValues(alpha: 0.6),
            width: 1,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const AppBrandLogoRow(pageTitle: 'Messages'),
          Row(
            children: [
              AppIconButton(
                icon: Icons.search_rounded,
                onTap: () {},
              ),
              const SizedBox(width: 8),
              AppNetworkAvatar(
                imageUrl: AppAssets.brandManagerAvatar,
                radius: 19,
                isOnline: true,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
