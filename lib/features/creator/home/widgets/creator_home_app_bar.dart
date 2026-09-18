import 'package:flutter/material.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/theme/creator_colors.dart';
import '../../../auth/presentation/views/auth_bottom_sheet.dart';

class CreatorHomeAppBar extends StatelessWidget {
  const CreatorHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        color: CreatorColors.surface.withValues(alpha: 0.9),
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
          Row(
            children: [
              InkWell(
                onTap: () => Scaffold.of(context).openDrawer(),
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  width: 38,
                  height: 38,
                  decoration: BoxDecoration(
                    color: CreatorColors.primaryContainer,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: CreatorColors.primaryContainer.withValues(alpha: 0.25),
                        blurRadius: 8,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: const Icon(Icons.hub_rounded, size: 20, color: Colors.white),
                ),
              ),
              const SizedBox(width: 10),
              Text(
                'Home',
                style: AppTextStyles.headlineMd(color: CreatorColors.onSurface),
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
                onTap: () => AuthBottomSheet.show(context),
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  width: 32,
                  height: 32,
                  decoration: const BoxDecoration(
                    color: CreatorColors.primary,
                    shape: BoxShape.circle,
                  ),
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
