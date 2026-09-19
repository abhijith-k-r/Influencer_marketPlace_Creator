import 'package:flutter/material.dart';
import '../../theme/creator_colors.dart';
import '../../theme/app_text_styles.dart';
import '../shared/app_icon_button.dart';
import '../shared/app_network_avatar.dart';
import 'creator_auth_sheet/creator_auth_bottom_sheet.dart';

/// Unified global AppBar for Creator feature section views (<90 LOC).
class CreatorSectionAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String? subtitle;
  final Widget? titleWidget;
  final IconData leadingIcon;
  final Color? leadingIconBg;
  final VoidCallback? onLeadingTap;
  final List<Widget>? actions;
  final Color? backgroundColor;
  final double height;

  const CreatorSectionAppBar({
    super.key,
    required this.title,
    this.subtitle,
    this.titleWidget,
    this.leadingIcon = Icons.bolt_rounded,
    this.leadingIconBg,
    this.onLeadingTap,
    this.actions,
    this.backgroundColor,
    this.height = 60.0,
  });

  @override
  Size get preferredSize => Size.fromHeight(height);

  Widget _buildTitle() {
    if (titleWidget != null) return titleWidget!;
    if (subtitle != null && subtitle!.isNotEmpty) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppTextStyles.headlineSm(color: CreatorColors.onSurface).copyWith(fontSize: 15)),
          Text(subtitle!, style: AppTextStyles.labelSm(color: CreatorColors.primary).copyWith(letterSpacing: 0.8, fontWeight: FontWeight.w800)),
        ],
      );
    }
    return Text(title, style: AppTextStyles.headlineMd(color: CreatorColors.onSurface));
  }

  @override
  Widget build(BuildContext context) {
    final bgColor = backgroundColor ?? CreatorColors.surface.withValues(alpha: 0.9);
    final iconBg = leadingIconBg ?? CreatorColors.primaryContainer;

    return SafeArea(
      child: Container(
        height: height,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        decoration: BoxDecoration(
          color: bgColor,
          border: Border(bottom: BorderSide(color: CreatorColors.surfaceContainerHigh.withValues(alpha: 0.5), width: 1)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                AppIconButton(
                  icon: leadingIcon,
                  iconColor: Colors.white,
                  backgroundColor: iconBg,
                  size: 38,
                  iconSize: 20,
                  onTap: onLeadingTap ?? () => Scaffold.of(context).openDrawer(),
                ),
                const SizedBox(width: 10),
                _buildTitle(),
              ],
            ),
            Row(
              children: actions ??
                  [
                    AppIconButton(icon: Icons.notifications_none_rounded, iconColor: CreatorColors.onSurfaceVariant, backgroundColor: Colors.transparent, onTap: () {}),
                    const SizedBox(width: 6),
                    AppNetworkAvatar(radius: 16, fallbackIcon: Icons.person_rounded, onTap: () => CreatorAuthBottomSheet.show(context)),
                  ],
            ),
          ],
        ),
      ),
    );
  }
}
