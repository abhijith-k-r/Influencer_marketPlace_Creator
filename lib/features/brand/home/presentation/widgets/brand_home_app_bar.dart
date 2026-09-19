import 'package:flutter/material.dart';
import 'package:creator_side/core/constants/app_assets.dart';
import 'package:creator_side/core/theme/app_colors.dart';
import 'package:creator_side/core/widgets/shared/app_brand_logo_row.dart';
import 'package:creator_side/core/widgets/shared/app_icon_button.dart';
import 'package:creator_side/core/widgets/shared/app_network_avatar.dart';
import 'package:creator_side/features/auth/presentation/views/auth_bottom_sheet.dart';

/// Top app bar for the Brand Home screen.
/// Contains drawer trigger, CollabConnect logo, notification, and profile avatar.
class BrandHomeAppBar extends StatelessWidget {
  const BrandHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
          Row(
            children: [
              AppIconButton(
                icon: Icons.menu_rounded,
                iconSize: 22,
                onTap: () => Scaffold.of(context).openDrawer(),
              ),
              const SizedBox(width: 10),
              const AppBrandLogoRow(pageTitle: 'Home'),
            ],
          ),
          Row(
            children: [
              AppIconButton(
                icon: Icons.notifications_none_rounded,
                iconColor: AppColors.onSurfaceVariant,
                onTap: () {},
              ),
              const SizedBox(width: 8),
              AppNetworkAvatar(
                imageUrl: AppAssets.brandManagerAvatar,
                radius: 17,
                onTap: () => AuthBottomSheet.show(context),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
