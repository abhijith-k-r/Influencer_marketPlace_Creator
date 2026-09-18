import 'package:flutter/material.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_radii.dart';
import '../../../../core/theme/app_text_styles.dart';

class LookbookSection extends StatelessWidget {
  const LookbookSection({super.key});

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
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Current Lookbook Assets',
                style: AppTextStyles.labelLg(
                  color: AppColors.onSurface,
                ).copyWith(fontWeight: FontWeight.w700),
              ),
              Text(
                '6 Files',
                style: AppTextStyles.labelSm(
                  color: AppColors.primary,
                ).copyWith(fontWeight: FontWeight.w700),
              ),
            ],
          ),

          const SizedBox(height: 12),

          // 2 Image Cards
          Row(
            children: [
              Expanded(
                child: _buildAssetCard(
                  imageUrl: AppAssets.lookbookFallDrop,
                  title: 'Fall Drop',
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _buildAssetCard(
                  imageUrl: AppAssets.lookbookSneakerGen2,
                  title: 'Sneaker Gen-2',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAssetCard({
    required String imageUrl,
    required String title,
  }) {
    return Container(
      height: 112,
      decoration: BoxDecoration(
        color: AppColors.surfaceContainer,
        borderRadius: BorderRadius.circular(16),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(
              imageUrl,
              fit: BoxFit.cover,
              errorBuilder: (_, _, _) => Container(
                color: AppColors.surfaceContainerHigh,
                child: const Icon(
                  Icons.image,
                  color: AppColors.tertiary,
                ),
              ),
            ),
            Positioned(
              bottom: 8,
              left: 8,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 3,
                ),
                decoration: BoxDecoration(
                  color: AppColors.surfaceContainerLowest.withValues(alpha: 0.9),
                  borderRadius: AppRadii.roundedPill,
                ),
                child: Text(
                  title,
                  style: AppTextStyles.labelSm(
                    color: AppColors.onSurface,
                  ).copyWith(fontSize: 10, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
