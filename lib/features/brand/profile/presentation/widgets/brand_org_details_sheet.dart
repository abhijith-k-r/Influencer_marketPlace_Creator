import 'package:flutter/material.dart';
import 'package:creator_side/core/theme/app_colors.dart';
import 'package:creator_side/core/theme/app_text_styles.dart';
import 'profile_info_tile.dart';

/// Organization profile details card — brand name, email, phone, niche, bio, socials, website.
class BrandOrgDetailsSheet extends StatelessWidget {
  final dynamic profile;

  const BrandOrgDetailsSheet({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Organization Profile',
                style: AppTextStyles.labelLg(color: AppColors.onSurface)
                    .copyWith(fontWeight: FontWeight.w700),
              ),
              Text(
                'Verified Entity',
                style: AppTextStyles.labelSm(color: AppColors.tertiary),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Divider(color: AppColors.surfaceContainer, height: 1),
          ProfileInfoTile(
            icon: Icons.storefront_rounded,
            label: 'Brand Name',
            value: profile.companyName,
          ),
          const Divider(color: AppColors.surfaceContainer, height: 1),
          ProfileInfoTile(
            icon: Icons.mail_outline_rounded,
            label: 'Business Email',
            value: profile.email,
          ),
          const Divider(color: AppColors.surfaceContainer, height: 1),
          ProfileInfoTile(
            icon: Icons.call_outlined,
            label: 'Contact Phone',
            value: profile.phone,
          ),
          const Divider(color: AppColors.surfaceContainer, height: 1),
          ProfileInfoTile(
            icon: Icons.sell_outlined,
            label: 'Category & Niche',
            customContent: Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Wrap(
                spacing: 6,
                runSpacing: 4,
                children: (profile.nicheTags as List<String>).map((tag) {
                  return Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(
                      color: AppColors.surfaceContainerHigh,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(tag,
                        style:
                            AppTextStyles.labelSm(color: AppColors.onSurface)),
                  );
                }).toList(),
              ),
            ),
          ),
          const Divider(color: AppColors.surfaceContainer, height: 1),
          ProfileInfoTile(
            icon: Icons.inventory_2_outlined,
            label: 'Product Details',
            value: profile.productDetails,
          ),
          const Divider(color: AppColors.surfaceContainer, height: 1),
          ProfileInfoTile(
            icon: Icons.info_outline_rounded,
            label: 'Brand Bio',
            value: profile.bio,
          ),
          const Divider(color: AppColors.surfaceContainer, height: 1),
          ProfileInfoTile(
            icon: Icons.language_rounded,
            label: 'Brand Website',
            value: profile.website,
            trailingIcon: Icons.open_in_new_rounded,
          ),
        ],
      ),
    );
  }
}
