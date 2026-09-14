import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class ProfileBrandTrustTab extends StatelessWidget {
  const ProfileBrandTrustTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildTrustScoreCard(),
        const SizedBox(height: 14),
        _buildBrandPartnersWall(),
        const SizedBox(height: 14),
        _buildTestimonialCard(),
      ],
    );
  }

  Widget _buildTrustScoreCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderLight),
      ),
      child: Row(
        children: [
          const Text('4.9', style: TextStyle(fontSize: 34, fontWeight: FontWeight.w800, color: AppColors.textPrimary)),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: List.generate(5, (_) => const Icon(Icons.star_rounded, color: Color(0xFFF59E0B), size: 18)),
                ),
                const SizedBox(height: 4),
                Text(
                  '18 Completed Campaigns • 100% Rehire Rate',
                  style: AppTextStyles.caption.copyWith(color: AppColors.textSecondary),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBrandPartnersWall() {
    final brands = ['Sony Audio', 'Notion', 'Anker', 'Lululemon'];
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderLight),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Past Brand Collaborators', style: AppTextStyles.caption.copyWith(color: AppColors.textSecondary)),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: brands.map((b) => Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: AppColors.background,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: AppColors.borderLight),
              ),
              child: Text(b, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 11)),
            )).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildTestimonialCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F3FF),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFDDD6FE)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.format_quote_rounded, color: Color(0xFF7C3AED), size: 24),
          const SizedBox(height: 6),
          Text(
            'Alex delivered exceptional creative quality ahead of schedule. The engagement exceeded our campaign KPI targets by 240%.',
            style: AppTextStyles.bodySmall.copyWith(fontStyle: FontStyle.italic, height: 1.4),
          ),
          const SizedBox(height: 10),
          Text(
            'Priya Sharma • Senior Brand Director, Ogilvy Tech',
            style: AppTextStyles.caption.copyWith(color: const Color(0xFF6D28D9), fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
