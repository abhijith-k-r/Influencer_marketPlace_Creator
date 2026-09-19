import 'package:flutter/material.dart';
import 'package:creator_side/core/theme/app_radii.dart';
import 'package:creator_side/core/theme/app_text_styles.dart';
import 'package:creator_side/core/theme/creator_colors.dart';
import 'package:creator_side/core/widgets/shared/app_icon_button.dart';
import 'package:creator_side/core/widgets/shared/app_network_avatar.dart';

/// Top bar header for the Creator My Works list view using global AppIconButton & AppNetworkAvatar (<75 LOC).
class MyWorksHeader extends StatelessWidget {
  final VoidCallback? onFilterTap;

  const MyWorksHeader({super.key, this.onFilterTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CreatorColors.surface.withValues(alpha: 0.95),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: SafeArea(
        bottom: false,
        child: Row(
          children: [
            Container(
              width: 38,
              height: 38,
              decoration: const BoxDecoration(
                color: CreatorColors.primaryContainer,
                borderRadius: AppRadii.roundedMd,
                boxShadow: [
                  BoxShadow(
                    color: Color(0x3D3B46F1),
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: const Icon(Icons.hub_rounded, color: Colors.white, size: 20),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'COLLABCONNECT',
                    style: AppTextStyles.labelSm(color: CreatorColors.primary),
                  ),
                  Text(
                    'My Works',
                    style: AppTextStyles.headlineSm(color: CreatorColors.onSurface),
                  ),
                ],
              ),
            ),
            AppIconButton(
              icon: Icons.tune_rounded,
              iconColor: CreatorColors.onSurfaceVariant,
              backgroundColor: Colors.transparent,
              onTap: onFilterTap,
            ),
            AppIconButton(
              icon: Icons.notifications_none_rounded,
              iconColor: CreatorColors.onSurfaceVariant,
              backgroundColor: Colors.transparent,
              onTap: () {},
            ),
            const SizedBox(width: 6),
            const AppNetworkAvatar(
              radius: 15,
              fallbackIcon: Icons.person_rounded,
            ),
          ],
        ),
      ),
    );
  }
}
