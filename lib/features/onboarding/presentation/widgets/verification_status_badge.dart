import 'package:flutter/material.dart';
import 'package:creator_side/core/theme/app_colors.dart';

/// 40x40 status badge with spinning autorenew icon and pulse indicator dot.
class VerificationStatusBadge extends StatelessWidget {
  const VerificationStatusBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: const BoxDecoration(
            color: AppColors.surfaceWhite,
            shape: BoxShape.circle,
          ),
          alignment: Alignment.center,
          child: const Icon(
            Icons.autorenew,
            size: 24,
            color: AppColors.primary,
          ),
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
    );
  }
}
