import 'package:flutter/material.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';

class ProfileDeliverablesTab extends StatelessWidget {
  const ProfileDeliverablesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildTierCard(
          title: '60s Dedicated Reel',
          price: '₹25,000',
          badge: 'Most Popular',
          isPopular: true,
          details: '4K cinema production, native storytelling, sound design, and 30-day organic usage rights included.',
        ),
        const SizedBox(height: 12),
        _buildTierCard(
          title: '3x High-Res Carousel',
          price: '₹15,000',
          details: 'Macro studio photography, product feature slides, caption copy, and 2x Instagram Story reshares.',
        ),
        const SizedBox(height: 12),
        _buildTierCard(
          title: 'Full Campaign Bundle',
          price: '₹35,000',
          badge: 'Best Value',
          details: '1x Dedicated 4K Reel + 3x Story sequence with custom CTA sticker + Link in Bio placement for 7 days.',
        ),
      ],
    );
  }

  Widget _buildTierCard({
    required String title,
    required String price,
    required String details,
    String? badge,
    bool isPopular = false,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isPopular ? AppColors.primary : AppColors.borderLight,
          width: isPopular ? 1.5 : 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: AppTextStyles.bodyMedium.copyWith(fontWeight: FontWeight.w700)),
              if (badge != null)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: const Color(0xFFEEF2FF),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    badge,
                    style: const TextStyle(color: Color(0xFF4F46E5), fontSize: 10, fontWeight: FontWeight.w700),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 6),
          Text(price, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w800, color: AppColors.textPrimary)),
          const SizedBox(height: 8),
          Text(details, style: AppTextStyles.caption.copyWith(color: AppColors.textSecondary, height: 1.4)),
        ],
      ),
    );
  }
}
