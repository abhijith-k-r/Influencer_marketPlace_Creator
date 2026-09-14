import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

/// Trailing actions cluster for headers (notification bell with unread dot + avatar icon).
class HeaderActionsCluster extends StatelessWidget {
  const HeaderActionsCluster({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          icon: Stack(
            clipBehavior: Clip.none,
            children: [
              const Icon(
                Icons.notifications_none_rounded,
                size: 22,
                color: AppColors.textSecondary,
              ),
              Positioned(
                top: 2,
                right: 2,
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          width: 32,
          height: 32,
          decoration: const BoxDecoration(
            color: AppColors.buttonPrimary,
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.person_rounded,
            size: 18,
            color: AppColors.textWhite,
          ),
        ),
      ],
    );
  }
}
