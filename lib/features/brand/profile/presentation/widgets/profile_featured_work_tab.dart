import 'package:flutter/material.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';

class ProfileFeaturedWorkTab extends StatelessWidget {
  const ProfileFeaturedWorkTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildCampaignCard(
          title: 'Sony Audio WH-1000XM5 Launch',
          category: 'Sponsored Reel • Tech & Audio',
          views: '54.3K',
          likes: '4.2K',
          rate: '8.2% ER',
          imageUrl: 'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?auto=format&fit=crop&w=600&q=80',
        ),
        const SizedBox(height: 12),
        _buildCampaignCard(
          title: 'Nordic Watch Co Minimalist Showcase',
          category: 'Product Integration • Lifestyle',
          views: '72.1K',
          likes: '5.6K',
          rate: '9.1% ER',
          imageUrl: 'https://images.unsplash.com/photo-1523275335684-37898b6baf30?auto=format&fit=crop&w=600&q=80',
        ),
      ],
    );
  }

  Widget _buildCampaignCard({
    required String title,
    required String category,
    required String views,
    required String likes,
    required String rate,
    required String imageUrl,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderLight),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: SizedBox(
              width: 80,
              height: 80,
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  color: AppColors.primaryLight,
                  child: const Icon(Icons.play_circle_outline, color: AppColors.primary),
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyles.bodyMedium.copyWith(fontWeight: FontWeight.w700),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                Text(category, style: AppTextStyles.caption.copyWith(color: AppColors.textTertiary)),
                const SizedBox(height: 8),
                Row(
                  children: [
                    _metricChip(Icons.visibility_outlined, views),
                    const SizedBox(width: 8),
                    _metricChip(Icons.favorite_border_rounded, likes),
                    const SizedBox(width: 8),
                    _metricChip(Icons.trending_up_rounded, rate, isHighlight: true),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _metricChip(IconData icon, String value, {bool isHighlight = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: isHighlight ? const Color(0xFFEEF2FF) : AppColors.background,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 11, color: isHighlight ? const Color(0xFF4F46E5) : AppColors.textSecondary),
          const SizedBox(width: 3),
          Text(
            value,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w600,
              color: isHighlight ? const Color(0xFF4F46E5) : AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
