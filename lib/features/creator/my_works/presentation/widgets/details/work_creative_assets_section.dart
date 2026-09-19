import 'package:flutter/material.dart';
import 'package:creator_side/core/theme/app_radii.dart';
import 'package:creator_side/core/theme/app_shadows.dart';
import 'package:creator_side/core/theme/app_text_styles.dart';
import 'package:creator_side/core/theme/creator_colors.dart';
import 'work_creative_asset_card.dart';

/// Container section for Creative Assets & Drafts preview gallery.
class WorkCreativeAssetsSection extends StatelessWidget {
  const WorkCreativeAssetsSection({super.key});

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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Creative Assets & Drafts', style: AppTextStyles.headlineSm(color: CreatorColors.onSurface).copyWith(fontSize: 16, fontWeight: FontWeight.w700)),
                  Text('Manage video cuts & frame stills', style: AppTextStyles.bodySm(color: CreatorColors.outline)),
                ],
              ),
              InkWell(
                onTap: () {},
                borderRadius: AppRadii.roundedMd,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: const BoxDecoration(color: CreatorColors.primary, borderRadius: AppRadii.roundedMd),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.cloud_upload_rounded, color: Colors.white, size: 16),
                      const SizedBox(width: 4),
                      Text('Upload', style: AppTextStyles.labelSm(color: Colors.white).copyWith(fontWeight: FontWeight.w700)),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          const Row(
            children: [
              Expanded(
                child: WorkCreativeAssetCard(
                  title: 'Reel_Cut_Final_v1.mov',
                  sizeMeta: '48 MB • MP4 4K',
                  statusText: 'Draft_v1 Approved',
                  isApproved: true,
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: WorkCreativeAssetCard(
                  title: 'SwipeUp_Stills_2.mp4',
                  sizeMeta: '22 MB • Vertical MP4',
                  statusText: 'Story_v2 In Review',
                  isApproved: false,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
