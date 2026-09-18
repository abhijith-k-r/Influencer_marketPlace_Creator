import 'package:flutter/material.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_radii.dart';

class CampaignMoodboardThumbnail extends StatelessWidget {
  final String url;
  final VoidCallback onRemove;

  const CampaignMoodboardThumbnail({
    super.key,
    required this.url,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(AppRadii.md),
          child: Image.network(
            url,
            width: 64,
            height: 64,
            fit: BoxFit.cover,
            errorBuilder: (_, _, _) => Container(
              width: 64,
              height: 64,
              color: AppColors.surfaceContainerHigh,
              child: const Icon(Icons.image, color: AppColors.tertiary),
            ),
          ),
        ),
        Positioned(
          top: 3,
          right: 3,
          child: InkWell(
            onTap: onRemove,
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.onBackground.withValues(alpha: 0.7),
              ),
              child: const Icon(Icons.close, size: 12, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
