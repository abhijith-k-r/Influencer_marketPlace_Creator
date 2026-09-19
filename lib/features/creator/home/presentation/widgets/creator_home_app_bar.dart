import 'package:flutter/material.dart';
import 'package:creator_side/core/constants/app_assets.dart';
import 'package:creator_side/core/theme/creator_colors.dart';
import 'package:creator_side/core/theme/app_text_styles.dart';
import 'package:creator_side/core/widgets/creator/creator_auth_sheet/creator_auth_bottom_sheet.dart';
import 'package:creator_side/core/widgets/shared/app_icon_button.dart';
import 'package:creator_side/core/widgets/shared/app_network_avatar.dart';

/// Top section AppBar for Creator Home tab using shared AppIconButton and AppNetworkAvatar (<85 LOC).
class CreatorHomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onDrawerTap;

  const CreatorHomeAppBar({super.key, required this.onDrawerTap});

  @override
  Size get preferredSize => const Size.fromHeight(64);

  void _openAuthSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => const CreatorAuthBottomSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CreatorColors.surface,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: SafeArea(
        bottom: false,
        child: Row(
          children: [
            AppIconButton(
              icon: Icons.menu_rounded,
              iconColor: CreatorColors.onSurface,
              backgroundColor: Colors.transparent,
              onTap: onDrawerTap,
            ),
            const SizedBox(width: 4),
            SizedBox(
              width: 32,
              height: 32,
              child: Image.network(
                AppAssets.collabConnectLogo,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) => const Icon(
                  Icons.hub_rounded,
                  color: CreatorColors.primary,
                  size: 28,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'COLLABCONNECT',
                    style: AppTextStyles.labelSm(
                      color: CreatorColors.primary,
                    ).copyWith(letterSpacing: 1.0, fontWeight: FontWeight.w800),
                  ),
                  Text(
                    'Home',
                    style: AppTextStyles.headlineSm(
                      color: CreatorColors.onSurface,
                    ).copyWith(fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
            AppIconButton(
              icon: Icons.notifications_none_rounded,
              iconColor: CreatorColors.onSurfaceVariant,
              backgroundColor: Colors.transparent,
              onTap: () {},
            ),
            const SizedBox(width: 8),
            AppNetworkAvatar(
              radius: 16,
              fallbackIcon: Icons.person_rounded,
              onTap: () => _openAuthSheet(context),
            ),
          ],
        ),
      ),
    );
  }
}
