import 'package:flutter/material.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/theme/app_radii.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/theme/creator_colors.dart';
import '../../auth/widgets/creator_auth_bottom_sheet.dart';

class CreatorHomeAppBar extends StatelessWidget {
  const CreatorHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        color: CreatorColors.surface.withValues(alpha: 0.9),
        border: Border(bottom: BorderSide(color: CreatorColors.surfaceContainerHigh.withValues(alpha: 0.5), width: 1)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              InkWell(
                onTap: () => Scaffold.of(context).openDrawer(),
                borderRadius: AppRadii.roundedPill,
                child: Container(
                  width: 38,
                  height: 38,
                  decoration: const BoxDecoration(color: CreatorColors.surfaceContainerLow, shape: BoxShape.circle),
                  child: const Icon(Icons.menu_rounded, size: 22, color: CreatorColors.onSurface),
                ),
              ),
              const SizedBox(width: 10),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  AppAssets.collabConnectLogo,
                  height: 32,
                  width: 32,
                  fit: BoxFit.contain,
                  errorBuilder: (_, _, _) => Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(color: CreatorColors.primary, borderRadius: BorderRadius.circular(8)),
                    child: const Icon(Icons.hub_rounded, color: Colors.white, size: 18),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'COLLABCONNECT',
                    style: AppTextStyles.labelSm(color: CreatorColors.primary).copyWith(letterSpacing: 0.8, fontWeight: FontWeight.w800, fontSize: 10),
                  ),
                  Text('Home', style: AppTextStyles.headlineSm(color: CreatorColors.onSurface).copyWith(fontWeight: FontWeight.w700)),
                ],
              ),
            ],
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.notifications_none_rounded, size: 22, color: CreatorColors.onSurfaceVariant),
              ),
              const SizedBox(width: 4),
              InkWell(
                onTap: () => CreatorAuthBottomSheet.show(context),
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  width: 34,
                  height: 34,
                  decoration: const BoxDecoration(color: CreatorColors.primary, shape: BoxShape.circle),
                  child: const Icon(Icons.person_rounded, size: 18, color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
