import 'package:flutter/material.dart';
import 'package:creator_side/core/theme/app_colors.dart';

/// 60x60 profile avatar with verified badge for Profile Review.
class ReviewProfileAvatar extends StatelessWidget {
  const ReviewProfileAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: const BoxDecoration(
            color: AppColors.trustBadgeBackground,
            shape: BoxShape.circle,
          ),
          alignment: Alignment.center,
          child: const Icon(
            Icons.person,
            size: 36,
            color: AppColors.primary,
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            padding: const EdgeInsets.all(2),
            decoration: const BoxDecoration(
              color: AppColors.primary,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.check_circle,
              size: 14,
              color: AppColors.surfaceWhite,
            ),
          ),
        ),
      ],
    );
  }
}
