import 'package:flutter/material.dart';
import 'package:creator_side/core/theme/app_text_styles.dart';
import 'package:creator_side/core/theme/creator_colors.dart';

/// Top bar header for the Creator Profile screen.
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
    return Container(
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
          IconButton(
            icon: const Icon(Icons.menu_rounded, size: 24),
            color: CreatorColors.onSurface,
            onPressed: onMenuTap ?? () => Scaffold.of(context).openDrawer(),
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
              IconButton(
                icon: const Icon(Icons.settings_outlined, size: 22),
                color: CreatorColors.onSurfaceVariant,
                onPressed: onSettingsTap,
              ),
              const CircleAvatar(
                radius: 14,
                backgroundColor: CreatorColors.primary,
                child: Icon(Icons.person_rounded, size: 16, color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
