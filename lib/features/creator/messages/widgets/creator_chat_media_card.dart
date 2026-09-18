import 'package:flutter/material.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/theme/creator_colors.dart';

class CreatorChatMediaCard extends StatelessWidget {
  const CreatorChatMediaCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        width: 270,
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: CreatorColors.surfaceContainerLowest,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(18),
            topRight: Radius.circular(4),
            bottomLeft: Radius.circular(18),
            bottomRight: Radius.circular(18),
          ),
          boxShadow: const [BoxShadow(color: Color(0x0A0B1C30), blurRadius: 10, offset: Offset(0, 3))],
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Image.network(
                  AppAssets.creatorVideoThumbnail,
                  height: 140,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (_, _, _) => Container(height: 140, color: CreatorColors.surfaceContainerHigh),
                ),
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(color: CreatorColors.primary.withValues(alpha: 0.9), shape: BoxShape.circle),
                  child: const Icon(Icons.play_arrow_rounded, size: 28, color: Colors.white),
                ),
                Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(color: Colors.black.withValues(alpha: 0.65), borderRadius: BorderRadius.circular(12)),
                    child: Text('Draft v1 • 0:42 • 4K 60fps', style: AppTextStyles.labelSm(color: Colors.white)),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(color: CreatorColors.surfaceContainerHigh, borderRadius: BorderRadius.circular(8)),
                        child: const Icon(Icons.movie_rounded, size: 18, color: CreatorColors.primary),
                      ),
                      const SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Draft_Reel_v1.mp4', style: AppTextStyles.labelMd(color: CreatorColors.onSurface)),
                          Text('48 MB • MP4 H.265', style: AppTextStyles.labelSm(color: CreatorColors.outline)),
                        ],
                      ),
                    ],
                  ),
                  const Icon(Icons.download_rounded, size: 20, color: CreatorColors.primary),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10, bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('10:25 AM', style: AppTextStyles.labelSm(color: CreatorColors.outline)),
                  const SizedBox(width: 4),
                  const Icon(Icons.done_all_rounded, size: 14, color: CreatorColors.primary),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
