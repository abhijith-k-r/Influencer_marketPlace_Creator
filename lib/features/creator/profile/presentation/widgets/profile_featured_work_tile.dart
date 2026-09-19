import 'package:flutter/material.dart';
import 'package:creator_side/core/theme/app_radii.dart';
import 'package:creator_side/core/theme/app_text_styles.dart';
import 'package:creator_side/core/theme/creator_colors.dart';
import 'package:creator_side/features/creator/profile/data/models/creator_profile_data.dart';

/// Single 4:5 aspect ratio work sample card in the Featured Works grid.
class ProfileFeaturedWorkTile extends StatelessWidget {
  final FeaturedWorkItem item;
  final VoidCallback? onTap;

  const ProfileFeaturedWorkTile({
    super.key,
    required this.item,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 4 / 5,
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: AppRadii.roundedMd,
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF2C3E50), Color(0xFF0F172A)],
          ),
        ),
        child: Material(
          color: Colors.transparent,
          borderRadius: AppRadii.roundedMd,
          child: InkWell(
            onTap: onTap,
            borderRadius: AppRadii.roundedMd,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.6),
                        borderRadius: AppRadii.roundedFull,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.visibility_outlined, size: 12, color: Colors.white),
                          const SizedBox(width: 4),
                          Text(item.views, style: AppTextStyles.labelSm(color: Colors.white).copyWith(fontSize: 10)),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 28,
                        height: 28,
                        decoration: BoxDecoration(
                          color: CreatorColors.primary.withValues(alpha: 0.9),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.play_arrow_rounded, color: Colors.white, size: 18),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        item.title,
                        style: AppTextStyles.labelMd(color: Colors.white).copyWith(fontWeight: FontWeight.w700),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        item.subtitle,
                        style: AppTextStyles.labelSm(color: CreatorColors.outlineVariant).copyWith(fontSize: 10),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
