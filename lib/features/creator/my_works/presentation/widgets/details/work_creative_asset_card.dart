import 'package:flutter/material.dart';
import 'package:creator_side/core/theme/app_radii.dart';
import 'package:creator_side/core/theme/app_text_styles.dart';
import 'package:creator_side/core/theme/creator_colors.dart';

/// Single video/story asset preview card with play button and status indicator.
class WorkCreativeAssetCard extends StatelessWidget {
  final String title;
  final String sizeMeta;
  final String statusText;
  final bool isApproved;

  const WorkCreativeAssetCard({
    super.key,
    required this.title,
    required this.sizeMeta,
    required this.statusText,
    required this.isApproved,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 9 / 13,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF1E293B),
          borderRadius: AppRadii.roundedMd,
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF2C3E50), Color(0xFF0F172A)],
          ),
        ),
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                      color: isApproved ? Colors.white.withValues(alpha: 0.9) : CreatorColors.primary,
                      borderRadius: AppRadii.roundedFull,
                    ),
                    child: Text(
                      statusText,
                      style: AppTextStyles.labelSm(
                        color: isApproved ? CreatorColors.onSurface : Colors.white,
                      ).copyWith(fontSize: 10, fontWeight: FontWeight.w700),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                if (isApproved)
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.8), shape: BoxShape.circle),
                    child: const Icon(Icons.check_rounded, size: 12, color: CreatorColors.onSurface),
                  ),
              ],
            ),
            Container(
              width: 38,
              height: 38,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.9),
                shape: BoxShape.circle,
                boxShadow: const [BoxShadow(color: Color(0x33000000), blurRadius: 8, offset: Offset(0, 3))],
              ),
              child: const Icon(Icons.play_arrow_rounded, color: CreatorColors.primary, size: 22),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyles.labelSm(color: Colors.white).copyWith(fontWeight: FontWeight.w700),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  sizeMeta,
                  style: AppTextStyles.labelSm(color: Colors.white70).copyWith(fontSize: 10),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
