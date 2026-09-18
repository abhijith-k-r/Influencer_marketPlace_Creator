import 'package:flutter/material.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_radii.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../data/models/creator_model.dart';

class CreatorCard extends StatelessWidget {
  final CreatorModel creator;
  final VoidCallback? onViewProfile;

  const CreatorCard({
    super.key,
    required this.creator,
    this.onViewProfile,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.surfaceContainer.withValues(alpha: 0.7),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          children: [
            // Top Creator Info Row
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Avatar with online status indicator
                Stack(
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppColors.surfaceContainer,
                          width: 2,
                        ),
                      ),
                      child: ClipOval(
                        child: Image.network(
                          creator.avatarUrl,
                          fit: BoxFit.cover,
                          errorBuilder: (_, _, _) => Container(
                            color: AppColors.surfaceContainerHigh,
                            child: const Icon(
                              Icons.person,
                              color: AppColors.tertiary,
                            ),
                          ),
                        ),
                      ),
                    ),
                    if (creator.isOnline)
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                            color: AppColors.emerald,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: AppColors.surfaceContainerLowest,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),

                const SizedBox(width: 12),

                // Name, Verified badge & Niche
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Flexible(
                            child: Text(
                              creator.name,
                              style: AppTextStyles.labelLg(
                                color: AppColors.onSurface,
                              ).copyWith(fontWeight: FontWeight.w700),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          if (creator.isVerified) ...[
                            const SizedBox(width: 4),
                            const Icon(
                              Icons.verified_rounded,
                              size: 16,
                              color: AppColors.secondary,
                            ),
                          ],
                        ],
                      ),
                      const SizedBox(height: 2),
                      Text(
                        creator.niche,
                        style: AppTextStyles.bodySm(
                          color: AppColors.tertiary,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),

                // View Profile Outline Button
                OutlinedButton(
                  onPressed: onViewProfile,
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: AppColors.primary),
                    shape: RoundedRectangleBorder(
                      borderRadius: AppRadii.roundedPill,
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: Text(
                    'View Profile',
                    style: AppTextStyles.labelSm(
                      color: AppColors.primary,
                    ).copyWith(fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            // Divider
            const Divider(
              color: AppColors.surfaceContainer,
              height: 1,
            ),

            const SizedBox(height: 10),

            // Bottom Metrics & Match Strip
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Metrics
                Row(
                  children: [
                    Icon(
                      creator.platform == PlatformType.youtube
                          ? Icons.smart_display_rounded
                          : Icons.photo_camera_rounded,
                      size: 16,
                      color: AppColors.primary,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      creator.followersCount,
                      style: AppTextStyles.bodySm(
                        color: AppColors.onSurface,
                      ).copyWith(fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      width: 4,
                      height: 4,
                      decoration: const BoxDecoration(
                        color: AppColors.surfaceContainer,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: '${creator.engagementRate} ',
                            style: AppTextStyles.bodySm(
                              color: AppColors.onSurface,
                            ).copyWith(fontWeight: FontWeight.w700),
                          ),
                          TextSpan(
                            text: 'eng',
                            style: AppTextStyles.bodySm(
                              color: AppColors.tertiary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                // Match & Price Pill
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        color: creator.matchPercentage >= 95
                            ? AppColors.primary.withValues(alpha: 0.1)
                            : AppColors.secondaryFixed,
                        borderRadius: AppRadii.roundedPill,
                      ),
                      child: Text(
                        '${creator.matchPercentage}% Match',
                        style: AppTextStyles.labelSm(
                          color: creator.matchPercentage >= 95
                              ? AppColors.primary
                              : AppColors.onSecondaryFixedVariant,
                        ).copyWith(fontWeight: FontWeight.w700),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      creator.priceStarting,
                      style: AppTextStyles.labelSm(
                        color: AppColors.tertiary,
                      ).copyWith(fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
