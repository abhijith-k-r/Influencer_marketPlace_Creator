import 'package:flutter/material.dart';
import 'package:creator_side/core/theme/app_radii.dart';
import 'package:creator_side/core/theme/app_shadows.dart';
import 'package:creator_side/core/theme/app_text_styles.dart';
import 'package:creator_side/core/theme/creator_colors.dart';

/// Search field for brand/campaign name with live matched partner tag.
class WorkFilterBrandSearch extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onClear;

  const WorkFilterBrandSearch({super.key, required this.controller, required this.onClear});

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
              Text('Brand & Campaign', style: AppTextStyles.labelLg(color: CreatorColors.onSurface).copyWith(fontWeight: FontWeight.w700)),
              Text('Quick Lookup', style: AppTextStyles.labelSm(color: CreatorColors.onSurfaceVariant)),
            ],
          ),
          const SizedBox(height: 10),
          Container(
            height: 46,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: const BoxDecoration(color: CreatorColors.surfaceContainerLow, borderRadius: AppRadii.roundedMd),
            child: Row(
              children: [
                const Icon(Icons.search_rounded, size: 20, color: CreatorColors.onSurfaceVariant),
                const SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    controller: controller,
                    style: AppTextStyles.bodyMd(color: CreatorColors.onSurface),
                    decoration: InputDecoration(
                      hintText: 'Search by brand or campaign name...',
                      hintStyle: AppTextStyles.bodyMd(color: CreatorColors.onSurfaceVariant),
                      border: InputBorder.none,
                      isDense: true,
                    ),
                  ),
                ),
                InkWell(
                  onTap: onClear,
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: const BoxDecoration(color: CreatorColors.surfaceContainer, shape: BoxShape.circle),
                    child: const Icon(Icons.close_rounded, size: 14, color: CreatorColors.onSurfaceVariant),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Container(
                width: 28,
                height: 28,
                decoration: const BoxDecoration(color: CreatorColors.surfaceContainer, borderRadius: AppRadii.roundedSm),
                child: const Icon(Icons.inventory_2_outlined, size: 16, color: CreatorColors.primary),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text('Matched Campaign: UrbanKicks SS25 Launch', style: AppTextStyles.labelSm(color: CreatorColors.onSurface), overflow: TextOverflow.ellipsis),
              ),
              const SizedBox(width: 6),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: const BoxDecoration(color: CreatorColors.primaryFixed, borderRadius: AppRadii.roundedFull),
                child: Text('Brand Verified', style: AppTextStyles.labelSm(color: CreatorColors.onPrimaryFixed).copyWith(fontWeight: FontWeight.w700)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
