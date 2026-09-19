import 'package:flutter/material.dart';
import 'package:creator_side/core/theme/app_colors.dart';
import 'package:creator_side/core/theme/app_text_styles.dart';
import 'package:creator_side/core/widgets/shared/app_icon_button.dart';
import 'package:creator_side/core/widgets/shared/app_network_avatar.dart';

/// Global section header AppBar for Brand side views using shared AppIconButton and AppNetworkAvatar (<75 LOC).
class BrandSectionAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String? subtitle;
  final IconData? leadingIcon;
  final VoidCallback? onLeadingTap;
  final List<Widget>? actions;
  final bool showNotifications;
  final VoidCallback? onNotificationTap;
  final VoidCallback? onAvatarTap;
  final String? avatarUrl;

  const BrandSectionAppBar({
    super.key,
    required this.title,
    this.subtitle,
    this.leadingIcon,
    this.onLeadingTap,
    this.actions,
    this.showNotifications = true,
    this.onNotificationTap,
    this.onAvatarTap,
    this.avatarUrl,
  });

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.surface,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: SafeArea(
        bottom: false,
        child: Row(
          children: [
            if (leadingIcon != null) ...[
              AppIconButton(
                icon: leadingIcon!,
                iconSize: 20,
                backgroundColor: Colors.transparent,
                onTap: onLeadingTap ?? () => Navigator.of(context).maybePop(),
              ),
              const SizedBox(width: 4),
            ],
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (subtitle != null) ...[
                    Text(
                      subtitle!.toUpperCase(),
                      style: AppTextStyles.labelSm(color: AppColors.primary)
                          .copyWith(fontSize: 10, letterSpacing: 0.8, fontWeight: FontWeight.w800),
                    ),
                    const SizedBox(height: 1),
                  ],
                  Text(
                    title,
                    style: AppTextStyles.headlineSm(color: AppColors.onSurface)
                        .copyWith(fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
            if (actions != null)
              ...actions!
            else ...[
              if (showNotifications)
                AppIconButton(
                  icon: Icons.notifications_none_rounded,
                  iconSize: 20,
                  backgroundColor: Colors.transparent,
                  onTap: onNotificationTap,
                ),
              if (onAvatarTap != null || avatarUrl != null)
                Padding(
                  padding: const EdgeInsets.only(left: 6),
                  child: AppNetworkAvatar(
                    radius: 16,
                    imageUrl: avatarUrl,
                    fallbackIcon: Icons.business_rounded,
                    onTap: onAvatarTap,
                  ),
                ),
            ],
          ],
        ),
      ),
    );
  }
}
