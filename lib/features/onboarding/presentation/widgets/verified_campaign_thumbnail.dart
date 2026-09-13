import 'package:flutter/material.dart';
import 'package:creator_side/core/theme/app_colors.dart';

/// 56x56 thumbnail with bottom-right platform badge for campaign card.
class VerifiedCampaignThumbnail extends StatelessWidget {
  final IconData productIcon;
  final IconData badgeIcon;
  final Color badgeColor;

  const VerifiedCampaignThumbnail({
    super.key,
    required this.productIcon,
    required this.badgeIcon,
    required this.badgeColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 56,
      height: 56,
      decoration: BoxDecoration(
        color: AppColors.trustBadgeBackground,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        children: [
          Center(
            child: Icon(productIcon, size: 28, color: AppColors.primary),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              width: 20,
              height: 20,
              decoration: const BoxDecoration(
                color: AppColors.surfaceWhite,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(4),
                ),
              ),
              child: Icon(badgeIcon, size: 14, color: badgeColor),
            ),
          ),
        ],
      ),
    );
  }
}
