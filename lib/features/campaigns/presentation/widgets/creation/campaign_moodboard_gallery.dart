import 'package:flutter/material.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_radii.dart';
import '../../../../../core/theme/app_text_styles.dart';
import 'campaign_moodboard_thumbnail.dart';

class CampaignMoodboardGallery extends StatelessWidget {
  final TextEditingController briefController;
  final List<String> mediaUrls;
  final VoidCallback onAddMedia;
  final ValueChanged<int> onRemoveMedia;

  const CampaignMoodboardGallery({
    super.key,
    required this.briefController,
    required this.mediaUrls,
    required this.onAddMedia,
    required this.onRemoveMedia,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Product Brief & Moodboard', style: AppTextStyles.labelMd(color: AppColors.onSurfaceVariant)),
            Text('Markdown supported', style: AppTextStyles.labelSm(color: AppColors.tertiary)),
          ],
        ),
        const SizedBox(height: 6),
        TextField(
          controller: briefController,
          maxLines: 3,
          style: AppTextStyles.bodyMd(),
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.surfaceContainerLow,
            hintText: 'Describe deliverables, format (9:16), hooks, tone...',
            hintStyle: AppTextStyles.bodyMd(color: AppColors.tertiary),
            contentPadding: const EdgeInsets.all(14),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(AppRadii.md), borderSide: BorderSide.none),
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 68,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: mediaUrls.length + 1,
            separatorBuilder: (_, _) => const SizedBox(width: 8),
            itemBuilder: (context, index) {
              if (index == mediaUrls.length) return _buildAddMediaButton();
              return CampaignMoodboardThumbnail(
                url: mediaUrls[index],
                onRemove: () => onRemoveMedia(index),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildAddMediaButton() {
    return InkWell(
      onTap: onAddMedia,
      borderRadius: BorderRadius.circular(AppRadii.md),
      child: Container(
        width: 64,
        height: 64,
        decoration: BoxDecoration(color: AppColors.surfaceContainerHigh, borderRadius: BorderRadius.circular(AppRadii.md)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.add_photo_alternate_rounded, size: 20, color: AppColors.onSurfaceVariant),
            const SizedBox(height: 2),
            Text('Add Media', style: AppTextStyles.labelSm(color: AppColors.onSurfaceVariant)),
          ],
        ),
      ),
    );
  }
}
