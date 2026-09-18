import 'package:flutter/material.dart';
import 'package:creator_side/core/theme/app_radii.dart';
import 'package:creator_side/core/theme/app_shadows.dart';
import 'package:creator_side/core/theme/app_text_styles.dart';
import 'package:creator_side/core/theme/creator_colors.dart';
import '../models/creator_profile_data.dart';
import 'profile_featured_work_tile.dart';

/// Container for Featured Works showcase with 2x2 grid.
class ProfileFeaturedWorksCard extends StatelessWidget {
  final List<FeaturedWorkItem> works;

  const ProfileFeaturedWorksCard({super.key, required this.works});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: CreatorColors.surfaceContainerLowest,
        borderRadius: AppRadii.roundedXl,
        boxShadow: AppShadows.cardSoft,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 32,
                    height: 32,
                    decoration: const BoxDecoration(color: CreatorColors.surfaceContainerLow, borderRadius: AppRadii.roundedSm),
                    child: const Icon(Icons.video_library_outlined, color: CreatorColors.primary, size: 18),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Featured Works',
                    style: AppTextStyles.headlineSm(color: CreatorColors.onSurface).copyWith(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              InkWell(
                onTap: () {},
                child: Row(
                  children: [
                    Text(
                      'View All (24)',
                      style: AppTextStyles.labelMd(color: CreatorColors.primary).copyWith(fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(width: 2),
                    const Icon(Icons.arrow_forward_rounded, size: 14, color: CreatorColors.primary),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: works.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 4 / 5,
            ),
            itemBuilder: (context, index) => ProfileFeaturedWorkTile(item: works[index]),
          ),
        ],
      ),
    );
  }
}
