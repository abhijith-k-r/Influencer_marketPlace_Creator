import 'package:flutter/material.dart';
import 'package:creator_side/core/theme/app_text_styles.dart';
import 'package:creator_side/core/theme/creator_colors.dart';
import 'package:creator_side/core/widgets/shared/app_icon_button.dart';
import 'package:creator_side/core/widgets/shared/app_network_avatar.dart';

/// Top bar header for the Creator Profile screen using AppIconButton and AppNetworkAvatar (<65 LOC).
class ProfileAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onMenuTap;
  final VoidCallback? onSettingsTap;

  const ProfileAppBar({
    super.key,
    this.onMenuTap,
    this.onSettingsTap,
  });

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 60,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: CreatorColors.surface.withValues(alpha: 0.95),
          border: Border(
            bottom: BorderSide(
              color: CreatorColors.surfaceContainerHigh.withValues(alpha: 0.5),
              width: 1,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppIconButton(
              icon: Icons.menu_rounded,
              iconColor: CreatorColors.onSurface,
              backgroundColor: Colors.transparent,
              onTap: onMenuTap ?? () => Scaffold.of(context).openDrawer(),
            ),
            Text(
              'Profile',
              style: AppTextStyles.headlineMd(
                color: CreatorColors.onSurface,
              ).copyWith(fontSize: 18, fontWeight: FontWeight.w700),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                AppIconButton(
                  icon: Icons.settings_outlined,
                  iconColor: CreatorColors.onSurfaceVariant,
                  backgroundColor: Colors.transparent,
                  onTap: onSettingsTap,
                ),
                const SizedBox(width: 8),
                const AppNetworkAvatar(
                  radius: 14,
                  fallbackIcon: Icons.person_rounded,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
